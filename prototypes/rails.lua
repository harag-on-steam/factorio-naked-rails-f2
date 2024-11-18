require("globals")

local DIRECTIONS =
{
	-- 8-way has no underscore in the name
	"northeast",
	"southeast",
	"southwest",
	"northwest",
	-- 16-way
	"north",
	"north_north_east",
	"north_east",
	"east_north_east",
	"east",
	"east_south_east",
	"south_east",
	"south_south_east",
	"south",
	"south_south_west",
	"south_west",
	"west_south_west",
	"west",
	"west_north_west",
	"north_west",
	"north_north_west",
}

local RAIL_ENDINGS =
{
	"front_rail_endings",
	"back_rail_endings",
	"rail_endings",
}

local NAKED_COMPONENTS_REMOVED = {
	rails = {
		-- "backplates",
		"stone_path",
		"stone_path_background",
		"ties",
	},
	remnants = {
		"metals",
		"stone_path",
		"stone_path_background",
		"ties",
	}
}

local SLEEPY_COMPONENTS_REMOVED = {
	rails = {
		-- "backplates",
		"stone_path",
		"stone_path_background",
	},
	remnants = {
		"metals",
		"stone_path",
		"stone_path_background",
	}
}

local function remove_rail_components(prototype, components_to_remove)
	for _, direction in pairs(DIRECTIONS) do
		local pictures = prototype.pictures[direction]
		if pictures then
			for _, component in pairs(components_to_remove) do
				pictures[component] = nil
			end
		end
	end
end

local function remove_rail_endings(prototype)
	for _, rail_endings in pairs(RAIL_ENDINGS) do
		local pictures = prototype.pictures[rail_endings]
		if pictures then
			pictures.sheets = { pictures.sheets[2] } -- background is layer 1, keep foreground
		end
	end
end

local function new_rail_entities(name_prefix, components_to_remove)
	for _, name in pairs(RAIL_ENTITY_NAMES) do
		local entity = table.deepcopy(data.raw[name][name])
		local remnants = table.deepcopy(data.raw["rail-remnants"][entity.corpse])

		local entity_name = name_prefix.."-"..entity.name
		local remnants_name = name_prefix.."-"..remnants.name

		entity.name = entity_name
		entity.corpse = remnants_name
		-- TODO: surface.create_entity({fast_replace: true}) still doesn't work. Does it simply not work for rails?
		entity.fast_replace_group = name
		remove_rail_components(entity, components_to_remove.rails)
		remove_rail_endings(entity)

		remnants.name = remnants_name
		remnants.related_rail = entity_name
		remove_rail_components(remnants, components_to_remove.remnants)

		data:extend({ entity, remnants })
	end
end

new_rail_entities("naked", NAKED_COMPONENTS_REMOVED)
new_rail_entities("sleepy", SLEEPY_COMPONENTS_REMOVED)