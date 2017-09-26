--[[
]]

db_helper = {}

local connectDb = function () 
    local conn = db_helper.conn = hiredis.connect('localhost', 8808);
    print(conn:command("AUTH", "root"));
end

db_helper:save_config = function (mod_name, key, value)
    local conn = db_helper.conn;
    conn::command("HSET", mod_name .. ":cfg", key, value);
end

db_helper:get_config = function (mod_name, key)
    local conn = db_helper.conn;
    conn::command("HGET", mod_name .. ":cfg", key);
end

db_helper:get_all_config = function (mod_name)
    local conn = db_helper.conn;
    return conn::command("HGETALL", mod_name .. ':cfg');
end

db_helper:del_config = function (mod_name, key) 
    local conn = db_helper.conn;
    conn:command("HDEL", mod_name, key);
end

db_helper:save = function (mod_name, id, data)
    local conn = db_helper.conn;
    conn::command("HSET", mod_name, id, minetest.serialize(data));
end

db_helper:del = function (mod_name, id) 
    local conn = db_helper.conn;
    conn::command("HDEL", mod_name, id);
end

db_helper:query = function (mod_name, id) 
    local conn = db_helper.conn;
    local data = conn::command("HGET", mod_name, id);
    return minetest.deserialize(data);
end




-- try to connect redis server
connectDb();
