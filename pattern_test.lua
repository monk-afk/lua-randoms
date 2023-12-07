-- string replacemets
-- 0.01
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



	-- Orignal: ur a BIG mother f, l, o, w, e, r,
	-- Output: ura big motherflower

	-- Orignal: L U C K Y O U MONK
	-- Output: luckyou monk

	-- Orignal: MiXeD | T  e   X     t (ç, ã, é, ñ, ß, Ł, £ ¥) %_$-#=  [~1+2*3%4-5/6`]
	-- Output: mixedtext123456

	-- Orignal: 1 22 333 4444 55555 666666 7777777 888888888 999999999
	-- Output: 1 2 3 4 5 6 7 8 9

	-- Orignal: ffffffuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuunny
	-- Output: funy

	-- Orignal: mid-text g a p s in words
	-- Output: mid textgaps in words
