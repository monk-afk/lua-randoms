-- Time and date functions
local function time_zero()
	local zero = {
		year = -1, month = 12, day = 0,
		hour = -1, min = 45, sec = 36,
	}
	zero.genesis = os.time(zero)
	return zero
end
local zero = time_zero()
	print("Seconds since 0AD: " .. os.time() - zero.genesis)


local mf = math.floor
local mfm = math.fmod
local function custom_time()
	local time = -zero.genesis
		local custom_time = {
			y = mf(time/31556952), -- 365.2425 * 86400 (days per Gregorian year)
			M = mf(mfm(time,31556952)/2629746), -- year seconds / 12
			d = mf(mfm(time,2629746)/86400), -- month seconds / 86400
			h = mf(mfm(time,86400)/3600),
			m = mf(mfm(time,3600)/60),
			s = mf(mfm(time,60))
		}
	return custom_time
end
local ct = custom_time()
	print(
		"Custom Time: "..
		string.format("%04dAD, %d/%d, %02d:%02d:%02d",
				ct.y,ct.M,ct.d,ct.h,ct.m,ct.s).."\n"..
		"Current Time: " .. os.date("%YAD %m/%d %H:%M:%S",
				os.time())
	)


	-- simple benchmark
local osc = os.clock() --> place on first line
	--> Insert functions
osc = string.format("%.7f", os.clock() - osc)
	print(osc.."\n")
