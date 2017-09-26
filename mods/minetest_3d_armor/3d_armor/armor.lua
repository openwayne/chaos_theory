local S = function(s) return s end
if minetest.global_exists("intllib") then
	S = intllib.Getter()
end

minetest.register_alias("adminboots","3d_armor:boots_admin")
minetest.register_alias("adminhelmet","3d_armor:helmet_admin")
minetest.register_alias("adminchestplate","3d_armor:chestplate_admin")
minetest.register_alias("adminleggings","3d_armor:leggings_admin")

armor:register_armor("3d_armor:helmet_admin", {
	description = S("Admin Helmet"),
	inventory_image = "3d_armor_inv_helmet_admin.png",
	armor_groups = {fleshy=100},
	groups = {armor_head=1, armor_heal=100, armor_use=0, armor_water=1,
			not_in_creative_inventory=1},
	on_drop = function(itemstack, dropper, pos)
		return
	end,
})

armor:register_armor("3d_armor:chestplate_admin", {
	description = S("Admin Chestplate"),
	inventory_image = "3d_armor_inv_chestplate_admin.png",
	armor_groups = {fleshy=100},
	groups = {armor_torso=1, armor_heal=100, armor_use=0,
			not_in_creative_inventory=1},
	on_drop = function(itemstack, dropper, pos)
		return
	end,
})

armor:register_armor("3d_armor:leggings_admin", {
	description = S("Admin Leggings"),
	inventory_image = "3d_armor_inv_leggings_admin.png",
	armor_groups = {fleshy=100},
	groups = {armor_legs=1, armor_heal=100, armor_use=0,
			not_in_creative_inventory=1},
	on_drop = function(itemstack, dropper, pos)
		return
	end,
})

armor:register_armor("3d_armor:boots_admin", {
	description = S("Admin Boots"),
	inventory_image = "3d_armor_inv_boots_admin.png",
	armor_groups = {fleshy=100},
	groups = {armor_feet=1, armor_heal=100, armor_use=0,
			not_in_creative_inventory=1},
	on_drop = function(itemstack, dropper, pos)
		return
	end,
})

if armor.materials.wood then
	armor:register_armor("3d_armor:helmet_wood", {
		description = S("Wood Helmet"),
		inventory_image = "3d_armor_inv_helmet_wood.png",
		armor_groups = {fleshy=5},
		groups = {armor_head=1, armor_heal=0, armor_use=2000},
	})
	armor:register_armor("3d_armor:chestplate_wood", {
		description = S("Wood Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_wood.png",
		armor_groups = {fleshy=10},
		groups = {armor_torso=1, armor_heal=0, armor_use=2000},
	})
	armor:register_armor("3d_armor:leggings_wood", {
		description = S("Wood Leggings"),
		inventory_image = "3d_armor_inv_leggings_wood.png",
		armor_groups = {fleshy=5},
		groups = {armor_legs=1, armor_heal=0, armor_use=2000},
	})
	armor:register_armor("3d_armor:boots_wood", {
		description = S("Wood Boots"),
		inventory_image = "3d_armor_inv_boots_wood.png",
		armor_groups = {fleshy=5},
		groups = {armor_feet=1, armor_heal=0, armor_use=2000},
	})
end

if armor.materials.cactus then
	armor:register_armor("3d_armor:helmet_cactus", {
		description = S("Cactus Helmet"),
		inventory_image = "3d_armor_inv_helmet_cactus.png",
		armor_groups = {fleshy=5},
		groups = {armor_head=1, armor_heal=0, armor_use=1000},
	})
	armor:register_armor("3d_armor:chestplate_cactus", {
		description = S("Cactus Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_cactus.png",
		armor_groups = {fleshy=10},
		groups = {armor_torso=1, armor_heal=0, armor_use=1000},
	})
	armor:register_armor("3d_armor:leggings_cactus", {
		description = S("Cactus Leggings"),
		inventory_image = "3d_armor_inv_leggings_cactus.png",
		armor_groups = {fleshy=5},
		groups = {armor_legs=1, armor_heal=0, armor_use=1000},
	})
	armor:register_armor("3d_armor:boots_cactus", {
		description = S("Cactus Boots"),
		inventory_image = "3d_armor_inv_boots_cactus.png",
		armor_groups = {fleshy=5},
		groups = {armor_feet=1, armor_heal=0, armor_use=1000},
	})
end

if armor.materials.steel then
	armor:register_armor("3d_armor:helmet_steel", {
		description = S("Steel Helmet"),
		inventory_image = "3d_armor_inv_helmet_steel.png",
		armor_groups = {fleshy=10},
		groups = {armor_head=1, armor_heal=0, armor_use=500},
	})
	armor:register_armor("3d_armor:chestplate_steel", {
		description = S("Steel Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_steel.png",
		armor_groups = {fleshy=15},
		groups = {armor_torso=1, armor_heal=0, armor_use=500},
	})
	armor:register_armor("3d_armor:leggings_steel", {
		description = S("Steel Leggings"),
		inventory_image = "3d_armor_inv_leggings_steel.png",
		armor_groups = {fleshy=15},
		groups = {armor_legs=1, armor_heal=0, armor_use=500},
	})
	armor:register_armor("3d_armor:boots_steel", {
		description = S("Steel Boots"),
		inventory_image = "3d_armor_inv_boots_steel.png",
		armor_groups = {fleshy=10},
		groups = {armor_feet=1, armor_heal=0, armor_use=500},
	})
end

if armor.materials.bronze then
	armor:register_armor("3d_armor:helmet_bronze", {
		description = S("Bronze Helmet"),
		inventory_image = "3d_armor_inv_helmet_bronze.png",
		armor_groups = {fleshy=10},
		groups = {armor_head=1, armor_heal=6, armor_use=250},
	})
	armor:register_armor("3d_armor:chestplate_bronze", {
		description = S("Bronze Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_bronze.png",
		armor_groups = {fleshy=15},
		groups = {armor_torso=1, armor_heal=6, armor_use=250},
	})
	armor:register_armor("3d_armor:leggings_bronze", {
		description = S("Bronze Leggings"),
		inventory_image = "3d_armor_inv_leggings_bronze.png",
		armor_groups = {fleshy=15},
		groups = {armor_legs=1, armor_heal=6, armor_use=250},
	})
	armor:register_armor("3d_armor:boots_bronze", {
		description = S("Bronze Boots"),
		inventory_image = "3d_armor_inv_boots_bronze.png",
		armor_groups = {fleshy=10},
		groups = {armor_feet=1, armor_heal=6, armor_use=250},
	})
end

if armor.materials.diamond then
	armor:register_armor("3d_armor:helmet_diamond", {
		description = S("Diamond Helmet"),
		inventory_image = "3d_armor_inv_helmet_diamond.png",
		armor_groups = {fleshy=15},
		groups = {armor_head=1, armor_heal=12, armor_use=100},
	})
	armor:register_armor("3d_armor:chestplate_diamond", {
		description = S("Diamond Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_diamond.png",
		armor_groups = {fleshy=20},
		groups = {armor_torso=1, armor_heal=12, armor_use=100},
	})
	armor:register_armor("3d_armor:leggings_diamond", {
		description = S("Diamond Leggings"),
		inventory_image = "3d_armor_inv_leggings_diamond.png",
		armor_groups = {fleshy=20},
		groups = {armor_legs=1, armor_heal=12, armor_use=100},
	})
	armor:register_armor("3d_armor:boots_diamond", {
		description = S("Diamond Boots"),
		inventory_image = "3d_armor_inv_boots_diamond.png",
		armor_groups = {fleshy=15},
		groups = {armor_feet=1, armor_heal=12, armor_use=100},
	})
end

if armor.materials.gold then
	armor:register_armor("3d_armor:helmet_gold", {
		description = S("Gold Helmet"),
		inventory_image = "3d_armor_inv_helmet_gold.png",
		armor_groups = {fleshy=10},
		groups = {armor_head=1, armor_heal=6, armor_use=250},
	})
	armor:register_armor("3d_armor:chestplate_gold", {
		description = S("Gold Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_gold.png",
		armor_groups = {fleshy=15},
		groups = {armor_torso=1, armor_heal=6, armor_use=250},
	})
	armor:register_armor("3d_armor:leggings_gold", {
		description = S("Gold Leggings"),
		inventory_image = "3d_armor_inv_leggings_gold.png",
		armor_groups = {fleshy=15},
		groups = {armor_legs=1, armor_heal=6, armor_use=250},
	})
	armor:register_armor("3d_armor:boots_gold", {
		description = S("Gold Boots"),
		inventory_image = "3d_armor_inv_boots_gold.png",
		armor_groups = {fleshy=10},
		groups = {armor_feet=1, armor_heal=6, armor_use=250},
	})
end

if armor.materials.mithril then
	armor:register_armor("3d_armor:helmet_mithril", {
		description = S("Mithril Helmet"),
		inventory_image = "3d_armor_inv_helmet_mithril.png",
		armor_groups = {fleshy=15},
		groups = {armor_head=1, armor_heal=12, armor_use=50},
	})
	armor:register_armor("3d_armor:chestplate_mithril", {
		description = S("Mithril Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_mithril.png",
		armor_groups = {fleshy=20},
		groups = {armor_torso=1, armor_heal=12, armor_use=50},
	})
	armor:register_armor("3d_armor:leggings_mithril", {
		description = S("Mithril Leggings"),
		inventory_image = "3d_armor_inv_leggings_mithril.png",
		armor_groups = {fleshy=20},
		groups = {armor_legs=1, armor_heal=12, armor_use=50},
	})
	armor:register_armor("3d_armor:boots_mithril", {
		description = S("Mithril Boots"),
		inventory_image = "3d_armor_inv_boots_mithril.png",
		armor_groups = {fleshy=15},
		groups = {armor_feet=1, armor_heal=12, armor_use=50},
	})
end

if armor.materials.crystal then
	armor:register_armor("3d_armor:helmet_crystal", {
		description = S("Crystal Helmet"),
		inventory_image = "3d_armor_inv_helmet_crystal.png",
		armor_groups = {fleshy=15},
		groups = {armor_head=1, armor_heal=12, armor_use=50, armor_fire=1},
	})
	armor:register_armor("3d_armor:chestplate_crystal", {
		description = S("Crystal Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_crystal.png",
		armor_groups = {fleshy=20},
		groups = {armor_torso=1, armor_heal=12, armor_use=50, armor_fire=1},
	})
	armor:register_armor("3d_armor:leggings_crystal", {
		description = S("Crystal Leggings"),
		inventory_image = "3d_armor_inv_leggings_crystal.png",
		armor_groups = {fleshy=20},
		groups = {armor_legs=1, armor_heal=12, armor_use=50, armor_fire=1},
	})
	armor:register_armor("3d_armor:boots_crystal", {
		description = S("Crystal Boots"),
		inventory_image = "3d_armor_inv_boots_crystal.png",
		armor_groups = {fleshy=15},
		groups = {armor_feet=1, armor_heal=12, armor_use=50, physics_speed=1,
				physics_jump=0.5, armor_fire=1},
	})
end

for k, v in pairs(armor.materials) do
	minetest.register_craft({
		output = "3d_armor:helmet_"..k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{"", "", ""},
		},
	})
	minetest.register_craft({
		output = "3d_armor:chestplate_"..k,
		recipe = {
			{v, "", v},
			{v, v, v},
			{v, v, v},
		},
	})
	minetest.register_craft({
		output = "3d_armor:leggings_"..k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{v, "", v},
		},
	})
	minetest.register_craft({
		output = "3d_armor:boots_"..k,
		recipe = {
			{v, "", v},
			{v, "", v},
		},
	})
end
