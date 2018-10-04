-- code made by PolySaken and modified by ManElevation
dofile(minetest.get_modpath("mover").."/update.lua") --makes small particles emanate from the beginning of a beam
minetest.register_node("mover:pipe_E", {
	description = "Horizontal Item Mover\n"..minetest.colorize("#00affa", "The arrow on top indicates the direction, rightclick with mover tool to rotate."),
	tiles = {"arrow_right.png", "side.png", "side.png", "side.png", "side.png", "side.png"},
	is_ground_content = false,
	sunlight_propagates = true,
	drawtype="nodebox",
	paramtype="light",
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_metal_defaults(),
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
		local owner = placer:get_player_name()
		meta:set_string("owner", owner)
		meta:set_string("infotext", "Owned By: "..owner.."\nRightclick with mover tool to change direction")
		local inv = meta:get_inventory()
		inv:set_size("pipe_buffer", 10)
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		return owner == player:get_player_name()
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		if player:get_player_name() == minetest.get_meta(pos):get_string("owner") then
			if itemstack:get_name() == "mover:mover_tool" then
				minetest.swap_node(pos, {name="mover:pipe_S"})
			end
		end
	end
})
minetest.register_node("mover:pipe_S", {
	description = "unav.tile",
	tiles = {"arrow_down.png", "side.png", "side.png", "side.png", "side.png", "side.png"},
	is_ground_content = false,
	sunlight_propagates = true,
	drop = "mover:pipe_E",
	drawtype="nodebox",
	paramtype="light",
	groups = {cracky = 3, oddly_breakable_by_hand = 3, not_in_creative_inventory=1},
	sounds = default.node_sound_metal_defaults(),
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
		local owner = placer:get_player_name()
		meta:set_string("owner", owner)
		meta:set_string("infotext", "Owned By: "..owner.."\nRightclick with mover tool to change direction")
		local inv = meta:get_inventory()
		inv:set_size("pipe_buffer", 10)
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		return owner == player:get_player_name()
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		if player:get_player_name() == minetest.get_meta(pos):get_string("owner") then
			if itemstack:get_name() == "mover:mover_tool" then
				minetest.swap_node(pos, {name="mover:pipe_W"})
			end
		end
	end
})
minetest.register_node("mover:pipe_W", {
	description = "unav.tile",
	tiles = {"arrow_left.png", "side.png", "side.png", "side.png", "side.png", "side.png"},
	is_ground_content = false,
	sunlight_propagates = true,
	drawtype="nodebox",
	drop = "mover:pipe_E",
	paramtype="light",
	groups = {cracky = 3, oddly_breakable_by_hand = 3, not_in_creative_inventory=1},
	sounds = default.node_sound_metal_defaults(),
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
		local owner = placer:get_player_name()
		meta:set_string("owner", owner)
		meta:set_string("infotext", "Owned By: "..owner.."\nRightclick with mover tool to change direction")
		local inv = meta:get_inventory()
		inv:set_size("pipe_buffer", 10)
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		return owner == player:get_player_name()
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		if player:get_player_name() == minetest.get_meta(pos):get_string("owner") then
			if itemstack:get_name() == "mover:mover_tool" then
				minetest.swap_node(pos, {name="mover:pipe_N"})
			end
		end
	end
})
minetest.register_node("mover:pipe_N", {
	description = "unav.tile",
	tiles = {"arrow_up.png", "side.png", "side.png", "side.png", "side.png", "side.png"},
	is_ground_content = false,
	sunlight_propagates = true,
	drop = "mover:pipe_E",
	drawtype="nodebox",
	paramtype="light",
	groups = {cracky = 3, oddly_breakable_by_hand = 3, not_in_creative_inventory=1},
	sounds = default.node_sound_metal_defaults(),
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
		local owner = placer:get_player_name()
		meta:set_string("owner", owner)
		meta:set_string("infotext", "Owned By: "..owner.."\nRightclick to change direction")
		local inv = meta:get_inventory()
		inv:set_size("pipe_buffer", 10)
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		return owner == player:get_player_name()
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		if player:get_player_name() == minetest.get_meta(pos):get_string("owner") then
			if itemstack:get_name() == "mover:mover_tool" then
				minetest.swap_node(pos, {name="mover:pipe_E"})
			end
		end
	end
})
minetest.register_node("mover:pipe_U", {
	description = "Vertical Item Mover\n"..minetest.colorize("#00affa", "The arrow indicates the direction, rightclick with mover tool to flip."),
	tiles = {"side.png", "side.png", "arrow_up.png", "arrow_up.png", "arrow_up.png", "arrow_up.png"},
	is_ground_content = false,
	sunlight_propagates = true,
	drop = "mover:pipe_U",
	drawtype="nodebox",
	paramtype="light",
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_metal_defaults(),
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
		local owner = placer:get_player_name()
		meta:set_string("owner", owner)
		meta:set_string("infotext", "Owned By: "..owner.."\nRightclick with mover tool to invert")
		local inv = meta:get_inventory()
		inv:set_size("pipe_buffer", 10)
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		return owner == player:get_player_name()
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		if player:get_player_name() == minetest.get_meta(pos):get_string("owner") then
			if itemstack:get_name() == "mover:mover_tool" then
				minetest.swap_node(pos, {name="mover:pipe_D"})
			end
		end
	end
})
minetest.register_node("mover:pipe_D", {
	description = "V",
	tiles = {"side.png", "side.png", "arrow_down.png", "arrow_down.png", "arrow_down.png", "arrow_down.png"},
	is_ground_content = false,
	sunlight_propagates = true,
	drop = "mover:pipe_U",
	drawtype="nodebox",
	paramtype="light",
	groups = {cracky = 3, oddly_breakable_by_hand = 3, not_in_creative_inventory=1},
	sounds = default.node_sound_metal_defaults(),
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
		local owner = placer:get_player_name()
		meta:set_string("owner", owner)
		meta:set_string("infotext", "Owned By: "..owner.."\nRightclick with mover tool to invert")
		local inv = meta:get_inventory()
		inv:set_size("pipe_buffer", 10)
	end,
	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		return owner == player:get_player_name()
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		if player:get_player_name() == minetest.get_meta(pos):get_string("owner") then
			if itemstack:get_name() == "mover:mover_tool" then
				minetest.swap_node(pos, {name="mover:pipe_U"})
			end
		end
	end
})

minetest.register_craftitem("mover:mover_tool", {
	description = "C-Type Mover Tool\n"..minetest.colorize("#00affa", "This mover tool is used to rotate pipes."),
	inventory_image = "mover_tool.png",
	stack_max=1,
})