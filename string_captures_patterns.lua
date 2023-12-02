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
		for word in gmatch(string, "%S+") do
			for character in gmatch(word, "%S") do
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
			print(
				match(string, head) .." | "..
				match(string, body) .." | "..
				match(string, tail)
			)
	end
	heads_tails("heads or tails")


-- Remove extra spaces
	local function remove_extra_spaces(string)
		print(
			gsub(string, "%s+", " ")
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
		for character in gmatch(string, "[^%sA-z]") do
			local charbyte = byte(character)
			print(
				char(charbyte) .. " = ".. charbyte
			)
		end
	end
	character_bytes("caractères latinisés français")


-- Repeat a pattern
	local function repeat_pattern(string,s)
		for character in gmatch(string, "%S") do
			-- print(
				s = s .. match(string, character):rep(#string)
			-- )
		end
	print(s)
	end
	repeat_pattern("Stutter","")


-- Remove repeating characters
	local function no_repeat(string)
			print(gsub(string, "([%S])%S*%1", "%1")) -- removes all repeating
			print(gsub(string, "([%S])%S+%1", "%1")) -- only doubles are left, eg: `hello`
	end
	no_repeat("1 22 333 4444 55555 666666 7777777 888888888 999999999")
