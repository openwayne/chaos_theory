minetest.register_node("canyon:freshwater", {
	description = "Fresh Water Source",
	inventory_image = minetest.inventorycube("canyon_freshwater.png"),
	drawtype = "liquid",
	tiles = {
		{
			name="canyon_freshwateranim.png",
			animation={type="vertical_frames",
			aspect_w=16, aspect_h=16, length=2.0}
		}
	},
	special_tiles = {
		{
			name="canyon_freshwateranim.png",
			animation={type="vertical_frames",
			aspect_w=16, aspect_h=16, length=2.0},
			backface_culling = false,
		}
	},
	alpha = WATER_ALPHA,
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "canyon:freshwaterflow",
	liquid_alternative_source = "canyon:freshwater",
	liquid_viscosity = WATER_VISC,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a=64, r=100, g=150, b=200},
	groups = {water=3, liquid=3, puts_out_fire=1},
})

minetest.register_node("canyon:freshwaterflow", {
	description = "Fresh Flowing Water",
	inventory_image = minetest.inventorycube("canyon_freshwater.png"),
	drawtype = "flowingliquid",
	tiles = {"canyon_freshwater.png"},
	special_tiles = {
		{
			image="canyon_freshwaterflowanim.png",
			backface_culling=false,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.8}
		},
		{
			image="canyon_freshwaterflowanim.png",
			backface_culling=true,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.8}
		},
	},
	alpha = WATER_ALPHA,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	is_ground_content = false,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "canyon:freshwaterflow",
	liquid_alternative_source = "canyon:freshwater",
	liquid_viscosity = WATER_VISC,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a=64, r=100, g=130, b=200},
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory=1},
})

-- Register buckets

bucket.register_liquid(
	"canyon:freshwater",
	"canyon:freshwaterflow",
	"canyon:bucket_freshwater",
	"canyon_bucketfreshwater.png",
	"Fresh Water Bucket"
)

