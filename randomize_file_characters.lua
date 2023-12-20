-- randomize characters in a file

local function randomize()
	local logfile = "./logfile.txt"
	local function file_exists(file)
		local f = io.open(file,"rb")
		if f then f:close() end
		return f~=nil
	end

	if not file_exists(logfile) then
	return end

    math.randomseed(os.time() * math.random(10000000,99999999) * os.clock())

	for line in io.lines(logfile) do
	
	local randle = math.random(46, 64)
		local function randchar()
			return string.char(randle):lower()
		end
		
		line = string.gsub(line,"[^%sA-z]", randchar())

		local r1 = math.random(0, 64)
		local r2 = math.random(64, 183)
		line = string.sub("\n", r1, r2)

		print(line)
	end
end
randomize()