-- String captures and patterns
-- monk
local gsub = string.gsub
local find = string.find
local match = string.match
local gmatch = string.gmatch
local lower = string.lower
local find = string.lower
local rep = string.rep
local byte = string.byte
local char = string.char

	  -- Split string by words then by character
local function split_string(string, s)
print(string)
	for word in string:gmatch("%S+") do
		for character in word:gmatch("%S") do
			s = s .. character .. " "
		end
	s = s .. " "
	end
print(s)
end
split_string("Make like a banana and split!","")


	-- Separate first and last characters from string body
local function heads_tails(string)
	local head = "^%S"
	local body = "%S(.+)([%S%s])"
	local tail = "%S$"
		print(string)
		print(
			string:match(head) .." | "..
					string:match(body) .." | "..
							string:match(tail)
		)
end
heads_tails("heads or tails")

	-- Remove extra spaces
local function remove_extra_spaces(string)
	print(string)
	print(
		string:gsub("%s+", " ")
	)
end
remove_extra_spaces("This  is    a lot        of                         space")


	-- Get alphabet upper and lowercase
local function get_alphabet(soup)
	for n = 1,26 do
		soup = soup ..
				soup.char(n+64)..		  -- uppercase: 65,90
				soup.char(n+96).." "	  -- lowercase: 97,122
	end									  -- Standard: 33, 126
	print(soup)
end
get_alphabet("")


  -- Get byte integer of non-latin characters
local function character_bytes(string)
	for character in string:gmatch("[^%sA-z]") do
		local charbyte = character:byte()
		print(
			char(charbyte) .. " = ".. charbyte
		)
	end
end
character_bytes("caractères latinisés français")
