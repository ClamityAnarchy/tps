local channel = minetest.mod_channel_join("tps")
local etime = 1
local ticks = 0

minetest.register_globalstep(function(dtime)
	etime = etime - dtime
	if etime < 0 then
		channel:send_all(ticks)
		ticks = 0
		etime = 1
	end
	ticks = ticks + 1
end)
