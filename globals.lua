RAIL_ENTITY_NAMES =
{
	"straight-rail",
	"half-diagonal-rail",
	"curved-rail-a",
	"curved-rail-b",
	"legacy-straight-rail",
	"legacy-curved-rail",
}

MOD_RAIL_ENTITY_NAMES = {}
NAKED_RAIL_ENTITY_NAMES = {}
SLEEPY_RAIL_ENTITY_NAMES = {}

NORMAL_TO_NAKED = {}
NAKED_TO_NORMAL = {}
NORMAL_TO_SLEEPY = {}
SLEEPY_TO_NORMAL = {}
ALL_TO_NORMAL = {}

for _,name in pairs(RAIL_ENTITY_NAMES) do
	local naked = "naked-"..name
	local sleepy = "sleepy-"..name

	NORMAL_TO_NAKED[name] = naked
	NAKED_TO_NORMAL[naked] = name
	NORMAL_TO_SLEEPY[name] = sleepy
	SLEEPY_TO_NORMAL[sleepy] = name
	ALL_TO_NORMAL[naked] = name
	ALL_TO_NORMAL[sleepy] = name

    table.insert(MOD_RAIL_ENTITY_NAMES, naked)
    table.insert(MOD_RAIL_ENTITY_NAMES, sleepy)
    table.insert(NAKED_RAIL_ENTITY_NAMES, naked)
    table.insert(SLEEPY_RAIL_ENTITY_NAMES, sleepy)
end