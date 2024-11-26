require("globals")

local function replace_rails(event, entity_mapping)
	if not event.item == "naked-rails-tool" then
		return
	end

	local player_index = event.player_index
	local undo_info = {player = player_index}

	for _,e in pairs(event.entities) do
		local replacement_name = entity_mapping[e.name]
		if replacement_name then
			local new_rail = {
				name = replacement_name,
				quality = e.quality,
				position = e.position,
				direction = e.direction,
				force = e.force,
				player = player_index,
				-- fast_replace = true, -- TODO Doesn't seem to work even with the proper fast-replace-group set
			}

			if e.destroy(undo_info) then
				event.surface.create_entity(new_rail)
			end
		end
	end
end

script.on_event(defines.events.on_player_selected_area, function(event) replace_rails(event, NORMAL_TO_NAKED) end)
script.on_event(defines.events.on_player_alt_selected_area, function(event) replace_rails(event, NORMAL_TO_SLEEPY) end)
script.on_event(defines.events.on_player_reverse_selected_area, function(event) replace_rails(event, ALL_TO_NORMAL) end)