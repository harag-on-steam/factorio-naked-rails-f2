local function rgba_f(r, g, b, a)
	return { r = r, g = g, b = b, a = a or 1 }
end

local tool_mode = { "buildable-type", "same-force" }

local tool =
{
	type = "selection-tool",
	name = "naked-rails-tool",

	stack_size = 1,
	flags = { "only-in-cursor", "not-stackable", "spawnable" },
	subgroup = "transport",
	order = "a[train-system]-y[naked-rails]",

	icons = {
		{ icon = "__naked-rails-f2__/graphics/naked-rails-planner.png" },
		{ icon = "__base__/graphics/icons/rail.png", scale = 0.4 },
	},

	select = {
		border_color = rgba_f(1, 1, 1),
		cursor_box_type = "copy",
		mode = tool_mode,
		entity_filters = RAIL_ENTITY_NAMES,
	},

	reverse_select = {
		border_color = rgba_f(1, 0, 0),
		cursor_box_type = "entity",
		mode = tool_mode,
		entity_filters = MOD_RAIL_ENTITY_NAMES,
	},

	alt_select = {
		border_color = rgba_f(0, 1, 1),
		cursor_box_type = "copy",
		mode = tool_mode,
		entity_filters = RAIL_ENTITY_NAMES,
	},
}

local shortcut =
{
	type = "shortcut",
	name = "naked-rails-shortcut",
	order = "a[train-system]-y[naked-rails-nakedify]",
	action = "spawn-item",
	item_to_spawn = "naked-rails-tool",
	localised_name = {"item-name.naked-rails-tool"},
	technology_to_unlock = "railway",
	icon = "__naked-rails-f2__/graphics/naked-rails-icon.png",
	icon_size = 32,
	small_icon = "__naked-rails-f2__/graphics/naked-rails-icon.png",
	small_icon_size = 32,
	style = "green",
}

data:extend({ tool, shortcut })