cars = {["current_cars"]={}}
minetest.register_craftitem("cars:car",{
	description = "Car",
	inventory_image = "cars_car_inv.png",
	on_use = function(_,user)
		local name = user:get_player_name()
		if cars.current_cars[name] == nil then
			cars.current_cars[name] = {}
			cars.current_cars[name].properties = user:get_properties()
			cars.current_cars[name].physics_override = user:get_physics_override()
			user:set_properties({visual="mesh",visual_size={x=1,y=1},mesh="cars_car.obj",textures={"cars_car.png"}})
			user:set_physics_override({speed=(minetest.setting_getbool("disable_anticheat")== true and 3 or 1),jump=0,gravity=2})
		else
			user:set_properties(cars.current_cars[name].properties)
			user:set_physics_override(cars.current_cars[name].physics_override)
			cars.current_cars[name] = nil
		end
	end}
)
minetest.register_craft({output="cars:car 1",recipe={
	{"default:glass","default:steel_ingot",""},
	{"homedecor:motor","default:steel_ingot","default:steel_ingot"},
	{"homedecor:plastic_sheeting","","homedecor:plastic_sheeting"}
}})
