minetest.register_abm({
    label = "east-facing pipe",
	nodenames = {"mover:pipe_E"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x-1, y=pos.y, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x+1, y=pos.y, z=pos.z})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z}).name
		local target_node = minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z}).name
		if owner == source_owner or source_owner=="" then
			if source_inv:get_list("output") then
				for i,stack in ipairs(source_inv:get_list("output")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("output", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("dst") then
				for i,stack in ipairs(source_inv:get_list("dst")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("dst", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("main") then
				for i,stack in ipairs(source_inv:get_list("main")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("main", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			end
			if target_node == "mover:pipe_E" then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("pipe_buffer", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("pipe_buffer", stack)
					end
				end
			elseif target_inv:get_list("main") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("main", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("main", stack)
					end
				end
			elseif target_inv:get_list("input") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("input", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("input", stack)
					end
				end
			elseif target_inv:get_list("src") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("src", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("src", stack)
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "west-facing pipe",
	nodenames = {"mover:pipe_W"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x+1, y=pos.y, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x-1, y=pos.y, z=pos.z})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z}).name
		local target_node = minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("output") then
				for i,stack in ipairs(source_inv:get_list("output")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("output", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("dst") then
				for i,stack in ipairs(source_inv:get_list("dst")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("dst", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("main") then
				for i,stack in ipairs(source_inv:get_list("main")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("main", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			end
			if target_node == "mover:pipe_W" then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("pipe_buffer", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("pipe_buffer", stack)
					end
				end
			elseif target_inv:get_list("main") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("main", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("main", stack)
					end
				end
			elseif target_inv:get_list("input") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("input", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("input", stack)
					end
				end
			elseif target_inv:get_list("src") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("src", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("src", stack)
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "south-facing pipe",
	nodenames = {"mover:pipe_S"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y, z=pos.z+1})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x, y=pos.y, z=pos.z-1})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1}).name
		local target_node = minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("output") then
				for i,stack in ipairs(source_inv:get_list("output")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("output", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("dst") then
				for i,stack in ipairs(source_inv:get_list("dst")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("dst", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("main") then
				for i,stack in ipairs(source_inv:get_list("main")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("main", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			end
			if target_node == "mover:pipe_S" then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("pipe_buffer", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("pipe_buffer", stack)
					end
				end
			elseif target_inv:get_list("main") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("main", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("main", stack)
					end
				end
			elseif target_inv:get_list("input") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("input", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("input", stack)
					end
				end
			elseif target_inv:get_list("src") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("src", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("src", stack)
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "north-facing pipe",
	nodenames = {"mover:pipe_N"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y, z=pos.z-1})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x, y=pos.y, z=pos.z+1})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1}).name
		local target_node = minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("output") then
				for i,stack in ipairs(source_inv:get_list("output")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("output", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("dst") then
				for i,stack in ipairs(source_inv:get_list("dst")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("dst", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("main") then
				for i,stack in ipairs(source_inv:get_list("main")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("main", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			end
			if target_node == "mover:pipe_N" then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("pipe_buffer", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("pipe_buffer", stack)
					end
				end
			elseif target_inv:get_list("main") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("main", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("main", stack)
					end
				end
			elseif target_inv:get_list("input") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("input", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("input", stack)
					end
				end
			elseif target_inv:get_list("src") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("src", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("src", stack)
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "up-facing pipe",
	nodenames = {"mover:pipe_U"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x, y=pos.y+1, z=pos.z})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local target_node = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("output") then
				for i,stack in ipairs(source_inv:get_list("output")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("output", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("dst") then
				for i,stack in ipairs(source_inv:get_list("dst")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("dst", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("main") then
				for i,stack in ipairs(source_inv:get_list("main")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("main", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			end
			if target_node == "mover:pipe_U" then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("pipe_buffer", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("pipe_buffer", stack)
					end
				end
			elseif target_inv:get_list("main") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("main", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("main", stack)
					end
				end
			elseif target_inv:get_list("input") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("input", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("input", stack)
					end
				end
			elseif target_inv:get_list("src") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("src", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("src", stack)
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "down-facing pipe",
	nodenames = {"mover:pipe_D"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y+1, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name
		local target_node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("output") then
				for i,stack in ipairs(source_inv:get_list("output")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("output", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("dst") then
				for i,stack in ipairs(source_inv:get_list("dst")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("dst", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("main") then
				for i,stack in ipairs(source_inv:get_list("main")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("main", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			end
			if target_node == "mover:pipe_D" then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("pipe_buffer", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("pipe_buffer", stack)
					end
				end
			elseif target_inv:get_list("main") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("main", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("main", stack)
					end
				end
			elseif target_inv:get_list("input") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("input", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("input", stack)
					end
				end
			elseif target_inv:get_list("src") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("src", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("src", stack)
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "trash extracting",
	nodenames = {"mover:pipe_filtered_D"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local destroyList = string.split(meta:get_string("items"), " ")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y+1, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name
		local target_node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("main") then
				for _,item in ipairs(destroyList) do
					if source_inv:contains_item("main", item) then
						source_inv:remove_item("main", item)
						if target_inv:room_for_item("main", item) then
							target_inv:add_item("main", item)
						end
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "trash extracting",
	nodenames = {"mover:pipe_filtered_U"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local destroyList = string.split(meta:get_string("items"), " ")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x, y=pos.y+1, z=pos.z})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local target_node = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("main") then
				for _,item in ipairs(destroyList) do
					if source_inv:contains_item("main", item) then
						source_inv:remove_item("main", item)
						if target_inv:room_for_item("main", item) then
							target_inv:add_item("main", item)
						end
					end
				end
			end
		end
	end,
})
