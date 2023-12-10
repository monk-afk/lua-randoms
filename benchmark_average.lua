  -- Average CPU clock time for simple benchmarking
  --[[ monk ]]--
  -- 0.02
local avg = 0
local ct = 0
local frq = 0

--[[ function benchmark() ]]--

	while true do
		local osc = os.clock()
		frq = frq + 1

--[[	insert function here	]]--

		local isc = os.clock()
		ct = ct + (isc - osc)
		avg = (ct/frq)
	end
	print(
		tonumber(
			string.format("%.6f", avg)))

--[[ end ]]--
