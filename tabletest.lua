-- -- table1 = { i = "k" }
-- -- table2 = { i = "k" }
-- -- print("table1 type is: "..type(table1))
-- -- print("table1.i type is: "..type(table1.i))
-- -- print("table2 type is: "..type(table2))
-- -- print("table2.i type is: "..type(table2.i))


-- -- function load_data()
-- --     local table1 = table1
-- --         if type(table1) ~= "table" then table1 = {} end
-- --     return table1
-- -- end
-- -- load_data()
-- -- print("table1 type is: "..type(table1))
-- -- print("table1.i type is: "..type(table1.i))
-- -- print(table1.i)

-- -- load_data = function()
-- --     --local table2 = table2
-- --         if type(table2) ~= "table" then table2 = {} end
-- --     return table2
-- -- end
-- -- load_data()
-- -- print("table2 type is: "..type(table2))
-- -- print("table2.i type is: "..type(table2.i))
-- -- print(table2.i)

-- -- factions = {}
-- -- factions.board = {}
-- -- local fname = "lkn"
-- -- local from = os.date("%b/%d %H:%M:%S").." <monk>"
-- -- local message = "chicken chose mews"
-- -- factions.board[fname] = factions.board[fname] or {}

-- -- for i= 1,10 do
-- -- table.insert(factions.board[fname], 1, {from=from,message=message})
-- -- if #factions.board[fname] > 3 then
-- --     table.remove(factions.board[fname], #factions.board[fname])
-- -- end
-- -- end

-- -- for i in pairs(factions.board[fname]) do
-- --     print(factions.board[fname][i].from)
-- --     print(factions.board[fname][i].message)
-- --     print(i)
-- --     --print(k[1])
-- -- end

-- local stats_data = {}
-- stats_data.daily = {
-- 	monk = 25345,
-- 	monk2 = 34656,
-- 	monk3 = 323626,
-- }
-- stats_data.newdaily = {
-- 	123453, 975447, 5787,
-- }


-- function dailyplayers()

-- 	local tmpdaily = {}
-- 	for i,k in pairs(stats_data.daily) do
-- 		if k > 86400 then
-- 			stats_data.daily[i] = nil
-- 		else
-- 			table.insert(tmpdaily,i)
-- 		end
-- 	end
-- 	for i=1,#stats_data.newdaily do
-- 		if stats_data.newdaily[i] > 86400 then
-- 			stats_data.newdaily[i] = nil
-- 		end
-- 	end
-- local daily, newdaily = #tmpdaily, #stats_data.newdaily
-- return daily,newdaily end

-- local daily, newdaily = dailyplayers()
-- print(daily.." "..newdaily)

local filter = {}
local blacklist = "curse_list.lua"

local index_blacklist = function(curses)
	for i, curse in pairs(curses) do
			filter[curse] = curse
	end
	return filter
end
local curses = dofile(blacklist)
index_blacklist(curses)

for curse in pairs(filter) do

	print(curse)

end