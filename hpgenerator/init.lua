hpgenerator = {}
hpgenerator.version = "08/14/2018a";
--dofile(minetest.get_modpath("hpgenerator").."/particles.lua") --makes small particles emanate from the beginning of a beam
hpgenerator.radius = tonumber(minetest.settings:get("hpgenerator_radius")) or 5
hpgenerator.consume_rate = tonumber(minetest.settings:get("hpgenerator_rate")) or 2
hpgenerator.players = {}

--
-- Formspec
--


local hpgenerator_formspec =
	"size[8,8.5]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_name;fuel;1,0.4;5,3;]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	"label[0.1,0.3;Fuel:]"..
	"label[0,3.6;PUNCH node to show the health area]"..
	"listring[current_player;main]"..
	"listring[current_player;main]"..
	"listring[context;fuel]"..
	"listring[current_player;main]"..
	default.get_hotbar_bg(0, 4.25)

--
-- Node callback functions that are the same for active and inactive hpgenerator
--

local function allow_metadata_inventory_put(pos, ttl, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return 0
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("fuel")
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

local function swap_node(pos, name, param2)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	node.param2 = param2
	minetest.swap_node(pos, node)
end

 --
 -- Node timer
 --
local function hpgenerator_node_timer(pos)
	--
	-- Update formspec, infotext and node
	--
	local timer = minetest.get_node_timer(pos)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = ItemStack("default:diamond 1")
	local fuel = inv:contains_item("fuel", stack) -- nil if not true
	local node = minetest.get_node(pos)

	if fuel then
		--Breath
		for _, ob in ipairs(minetest.get_objects_inside_radius(pos, 6)) do
			local hp = ob:get_hp()
			if ob:get_hp() ~= 11 then
				ob:set_hp(hp + 18)
			end
		end
		if timer:is_started() == false then
			timer:start(hpgenerator.consume_rate)
		end
		inv:remove_item("fuel", stack)
	else
		meta:set_string("infotext", "Insert a diamond as fuel.")
		-- stop timer on the inactive hpgenerator
		timer:stop()
	end
end

--
-- Node definitions
--

minetest.register_node("hpgenerator:hpgenerator", {
	description = "hpgenerator",
	tiles = {"hpgenerator_front.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	paramtype = "light",
	sounds = default.node_sound_stone_defaults(),
	can_dig = can_dig,
	on_timer = hpgenerator_node_timer,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", hpgenerator_formspec)
		meta:set_string("infotext", "Insert a diamond as fuel.")
		local inv = meta:get_inventory()
		inv:set_size('fuel', 1)
	end,
	on_punch = function(pos, node, puncher)
	minetest.add_entity(pos, "hpgenerator:display") end,
	on_metadata_inventory_put = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = ItemStack("default:diamond 1")
		local fuel = inv:contains_item("fuel", stack)
		if fuel then
			meta:set_string("infotext", "Diamond inserted.")
			minetest.get_node_timer(pos):start(hpgenerator.consume_rate)
		end
	end,
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "fuel", drops)
		drops[#drops+1] = "hpgenerator:hpgenerator"
		minetest.remove_node(pos)
		return drops
	end,

	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
})
-- CRAFTS

minetest.register_craft({
	output = "hpgenerator:hpgenerator",
	recipe = {
                {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot", },
                {"default:steel_ingot", "dye:red",        "default:steel_ingot", },
                {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot", }
	}
})
-- Display "radius"
minetest.register_entity("hpgenerator:display", {
	physical = false,
	collisionbox = {0, 0, 0, 0, 0, 0},
	visual = "wielditem",
	-- wielditem seems to be scaled to 1.5 times original node size
	visual_size = {x = 1.0 / 1.5, y = 1.0 / 1.5},
	textures = {"hpgenerator:display_node"},
	timer = 0,

	on_step = function(self, dtime)

		self.timer = self.timer + dtime

		-- remove after 5 seconds
		if self.timer > 5 then
			self.object:remove()
		end
	end,
})

local x = hpgenerator.radius
minetest.register_node("hpgenerator:display_node", {
	tiles = {"hpgenerator_display.png"},
	use_texture_alpha = false,
	walkable = false,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			-- sides
			{-(x+.55), -(x+.55), -(x+.55), -(x+.45), (x+.55), (x+.55)},
			{-(x+.55), -(x+.55), (x+.45), (x+.55), (x+.55), (x+.55)},
			{(x+.45), -(x+.55), -(x+.55), (x+.55), (x+.55), (x+.55)},
			{-(x+.55), -(x+.55), -(x+.55), (x+.55), (x+.55), -(x+.45)},
			-- top
			{-(x+.55), (x+.45), -(x+.55), (x+.55), (x+.55), (x+.55)},
			-- bottom
			{-(x+.55), -(x+.55), -(x+.55), (x+.55), -(x+.45), (x+.55)},
			-- middle (surround hpgenerator)
			{0,0,0},
		},
	},
	selection_box = {
		type = "regular",
	},
	paramtype = "light",
	groups = {dig_immediate = 3, not_in_creative_inventory = 1},
	drop = "",
})