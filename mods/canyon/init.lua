-- Parameters

-- Water factor is proportion of water surface level to removed stone surface level
local WAFAV = 0.4 -- Water factor average
local WAFAMP = 0.7 -- Water factor amplitude
local MINDEP = 11 -- (0-30) Minimum river depth
local MAXDEP = 30 -- (0-30) Maximum river depth
local TRIVERL = -0.06
local TRIVERH = 0.06

-- 2D noise for river channel

local np_river = {
	offset = 0,
	scale = 1,
	spread = {x = 384, y = 384, z = 384},
	seed = 5192098,
	octaves = 5,
	persist = 0.6
}

-- 2D noise for depth variation

local np_depth = {
	offset = 0,
	scale = 1,
	spread = {x = 192, y = 192, z = 192},
	seed = 924,
	octaves = 4,
	persist = 0.5
}

-- 2D noise for water factor

local np_factor = {
	offset = 0,
	scale = 1,
	spread = {x = 512, y = 512, z = 512},
	seed = 13050,
	octaves = 2,
	persist = 0.4
}


-- Stuff

local depran = MAXDEP - MINDEP
local noiran = TRIVERH - TRIVERL


-- Do files

dofile(minetest.get_modpath("canyon").."/nodes.lua")


-- Initialize noise objects to nil

local nobj_river = nil
local nobj_depth = nil
local nobj_factor = nil


-- On generated function

minetest.register_on_generated(function(minp, maxp, seed)
	if not (minp.y < 1 and maxp.y > 1) then -- if not surface chunk
		return
	end
		local t0 = os.clock()
	local x0 = minp.x
	local x1 = maxp.x
	local y0 = minp.y
	local y1 = maxp.y
	local z0 = minp.z
	local z1 = maxp.z

	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge = emin, MaxEdge = emax}
	local data = vm:get_data()

	local c_air = minetest.get_content_id("air")
	local c_water = minetest.get_content_id("default:water_source")
	local c_waterflow = minetest.get_content_id("default:water_flowing")
	local c_stone = minetest.get_content_id("default:stone")
	local c_destone = minetest.get_content_id("default:desert_stone")
	local c_sand = minetest.get_content_id("default:sand")

	local c_freshwater = minetest.get_content_id("canyon:freshwater")

	local sidelen = x1 - x0 + 1
	local emerlen = sidelen + 32
	local chulens = {x = sidelen, y = sidelen, z = 1}
	local minposxz = {x = x0, y = z0}

	nobj_river = nobj_river or minetest.get_perlin_map(np_river, chulens)
	nobj_depth = nobj_depth or minetest.get_perlin_map(np_depth, chulens)
	nobj_factor = nobj_factor or minetest.get_perlin_map(np_factor, chulens)

	local nvals_river = nobj_river:get2dMap_flat(minposxz)
	local nvals_depth = nobj_depth:get2dMap_flat(minposxz)
	local nvals_factor = nobj_factor:get2dMap_flat(minposxz)

	local nixz = 1
	for z = z0, z1 do
	for x = x0, x1 do
		local n_river = nvals_river[nixz]
		if n_river > TRIVERL and n_river < TRIVERH then -- if column in river channel
			local n_depth = nvals_depth[nixz]
			local norm1 = (n_river - TRIVERL) * (TRIVERH - n_river) / noiran ^ 2 * 4
			local norm2 = (n_depth + 1.875) / 3.75
			-- find surface y and stone surface y
			local ysurf = 1
			local ystone = 1
			local vi = area:index(x, y1, z)
			for y = y1, 2, -1 do
				local nodid = data[vi]
				if ysurf == 1 and nodid ~= c_air then
					ysurf = y
				end
				if nodid == c_stone
				or nodid == c_destone then
					ystone = y
					break
				end
				vi = vi - emerlen
			end
			-- Calculate water surface rise and riverbed sand bottom y
			local n_factor = nvals_factor[nixz]
			local watfac = WAFAV + n_factor * WAFAMP
			watfac = math.min(math.max(watfac, 0), 0.9)
			local watris = math.floor((ystone - 1) * watfac)
			local yexbot = ysurf - math.floor(norm1 *
			(ysurf - watris + 2 + MINDEP + norm2 * depran))
			-- Find seabed y or airgap y
			local yseabed = y1
			local vi = area:index(x, yexbot, z)
			for y = yexbot, y1 do
				local nodid = data[vi]
				if nodid == c_water
				or nodid == c_waterflow
				or nodid == c_air then
					yseabed = y - 1
					break
				end
				vi = vi + emerlen
			end
			-- Excavate canyon, add sand if below seabed or airgap
			-- add water up to varying height
			local vi = area:index(x, yexbot, z)
			for y = yexbot, ysurf do
				if y <= yexbot + 2 and y <= yseabed
				and y <= watris + 2 then
					data[vi] = c_sand
				elseif y <= watris + 1 then
					data[vi] = c_freshwater
				else
					data[vi] = c_air
				end
				vi = vi + emerlen
			end
		end
		nixz = nixz + 1
	end
	end

	vm:set_data(data)
	vm:set_lighting({day = 0, night = 0})
	vm:calc_lighting()
	vm:write_to_map(data)
	vm:update_liquids()

	local chugent = math.ceil((os.clock() - t0) * 1000)
	print ("[canyon] " .. chugent .. " ms")
end)
