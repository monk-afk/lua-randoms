-- debug filtering test
local lower = string.lower
local gsub = string.gsub

local strings = { --> todo, get messages from stream output
	[1] = "2023-12-08 03:43:24: ACTION[Server]: gongong dies at (0,-1,0). Inventory dropped",
	[2] = "2023-11-25 20:23:19: ACTION[Server]: RealSuperd places node default:silver_sandstone_block at (-7,4,1)",
	[3] = "2023-11-23 14:10:16: ACTION[Server]: ElinetUwu [10.0.0.1] joins game. List of players: ",
	[4] = "2023-11-23 14:11:37: ACTION[Server]: Quintin digs default:cobble at (-1,1,1)",
	[5] = "2023-11-25 20:23:11: ACTION[Server]: player Addicat (id=63352, hp=20) punched player Zeratul (id=41118, hp=15), damage=0 (handled by Lua)",
}

local sweep = function(string)
		return gsub(string, "^([%d-%s:]+):%s%S+%s(%S+)%s([%[%d.%]]?%s?%S+)%s(%S+)%s(%S+)",
			function(date,name,action,dnode,node)
				print(date .. " | ".. name.." | ".. action.." | ".. dnode.." | ".. node)
				return
			end)
end

for i = 1,#strings do
	local message = strings[i]
	print("Orignal: "..message.."\nOutput: "..sweep(message).."\n")
end



		-- 2023-12-08 03:43:24 | gongong | dies | at | (0,-1,0).
		-- Orignal: 2023-12-08 03:43:24: ACTION[Server]: gongong dies at (0,-1,0). Inventory dropped
		-- Output: 2023-12-08 03:43:24: ACTION[Server]: gongong dies at (0,-1,0). Inventory dropped
		
		-- 2023-11-25 20:23:19 | RealSuperd | places | node | default:silver_sandstone_block
		-- Orignal: 2023-11-25 20:23:19: ACTION[Server]: RealSuperd places node default:silver_sandstone_block at (-7,4,1)
		-- Output: 2023-11-25 20:23:19: ACTION[Server]: RealSuperd places node default:silver_sandstone_block at (-7,4,1)
		
		-- 2023-11-23 14:10:16 | ElinetUwu | [10.0.0.1] | joins | game.
		-- Orignal: 2023-11-23 14:10:16: ACTION[Server]: ElinetUwu [10.0.0.1] joins game. List of players: 
		-- Output: 2023-11-23 14:10:16: ACTION[Server]: ElinetUwu [10.0.0.1] joins game. List of players: 
		
		-- 2023-11-23 14:11:37 | Quintin | digs | default:cobble | at
		-- Orignal: 2023-11-23 14:11:37: ACTION[Server]: Quintin digs default:cobble at (-1,1,1)
		-- Output: 2023-11-23 14:11:37: ACTION[Server]: Quintin digs default:cobble at (-1,1,1)
		
		-- 2023-11-25 20:23:11 | player | Addicat | (id=63352, | hp=20)
		-- Orignal: 2023-11-25 20:23:11: ACTION[Server]: player Addicat (id=63352, hp=20) punched player Zeratul (id=41118, hp=15), damage=0 (handled by Lua)
		-- Output: 2023-11-25 20:23:11: ACTION[Server]: player Addicat (id=63352, hp=20) punched player Zeratul (id=41118, hp=15), damage=0 (handled by Lua)




-- irregular patterns test
local lower = string.lower
local gsub = string.gsub

local strings = {
	[1] = "ur a BIG mother f, l, o, w, e, r,",
	[2] = "L U C K Y O U MONK",
	[3] = "MiXeD | T  e   X     t (ç, ã, é, ñ, ß, Ł, £ ¥) %_$-#=  [~1+2*3%4-5/6`]",
	[4] = "1 22 333 4444 55555 666666 7777777 888888888 999999999",
	[5] = "ffffffuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuunny",
	[6] = "mid-text g a p s in words",
}


local sweep = function(string)
		--> keep doubled chars, eg: 'hello'	--> return gsub(string, "([%S])%S+%1", "%1")
			return lower(string):
					 gsub("(%w+)", " %1 "): -- extra spaces
					 gsub("^%s*(.-)%s*$","%1"):
					 gsub("[^%sa-zA-Z0-9]", ""): -- non-alpha
					 gsub("%s-(%w*)%s(%w)%s", "%1%2"): -- word g a p s 
					 gsub("([%s%S])%1([%s%S]*)%2([%s%S]*)%3", "%1"): -- reppittittionns
					 gsub("([%s%S])%1", "%1") -- repititions second pass

end


for i = 1,#strings do
	local message = strings[i]
	print("Orignal: "..message.."\nOutput: "..sweep(message).."\n")
end



-- 	-- Orignal: ur a BIG mother f, l, o, w, e, r,
-- 	-- Output: ura big motherflower

-- 	-- Orignal: L U C K Y O U MONK
-- 	-- Output: luckyou monk

-- 	-- Orignal: MiXeD | T  e   X     t (ç, ã, é, ñ, ß, Ł, £ ¥) %_$-#=  [~1+2*3%4-5/6`]
-- 	-- Output: mixedtext123456

-- 	-- Orignal: 1 22 333 4444 55555 666666 7777777 888888888 999999999
-- 	-- Output: 1 2 3 4 5 6 7 8 9

-- 	-- Orignal: ffffffuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuunny
-- 	-- Output: funy

-- 	-- Orignal: mid-text g a p s in words
-- 	-- Output: mid textgaps in words
