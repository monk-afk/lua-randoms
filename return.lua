
local function send(text)
	return {
		tag = function(tag)
			tag = "#["..tag.."] "..test
		end,
	}
end

local test = send("testst"):tag()
print(test)