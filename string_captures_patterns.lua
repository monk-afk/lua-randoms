-- String captures and patterns
-- monk
local function show_examples()
	local gsub = string.gsub
	local find = string.find
	local match = string.match
	local gmatch = string.gmatch
	local lower = string.lower
	local find = string.lower
	local rep = string.rep
	
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
	heads_tails("heads or tails?")

	  -- Remove extra spaces
	local function remove_extra_spaces(string)
		print(string)
		print(
			string:gsub("%s+", " ")
		)
	end
	remove_extra_spaces("This  is    a lot        of                         space")


	  -- Get alphabet upper and lowercase
	local function get_alphabet()
		local soup = ""
		for n = 1,26 do
			soup = soup ..
					string.char(n+64)..		  -- uppercase: 65,90
					string.char(n+96).." "	  -- lowercase: 97,122
		end
		print(soup)
	end
	get_alphabet()

end

show_examples()
