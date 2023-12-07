  -- Average CPU clock time for simple benchmarking
  --[[ monk ]]
  -- 
local avg = 0
local ct = 0
local frq = 0
function benchmark()
	while true do  -- infinite loop
		local osc = os.clock()
		frq = frq + 1

--[[	insert function here	]]

		local isc = os.clock()
		ct = ct + (isc - osc)
		avg = (ct/frq)
	end
end
print(tonumber(string.format("%.6f", benchmark())))
