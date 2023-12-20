--[[ matchbox = { m0 = 0, m1 = 0, m2 = 0, m3 = 0, m4 = 0 }

function get_numbers()
    local pick_nums = {}
    local dup_check = {}
    math.randomseed(os.time() * math.random(10000000,99999999) * os.clock())
        while #pick_nums < 4 do
            local random_num = math.ceil( math.random(1,49))
            if (not dup_check[random_num]) then
                table.insert(pick_nums, random_num)
                dup_check[random_num] = true
            end
        end
    table.sort(pick_nums)
return pick_nums
end

local win_picks = get_numbers()

for i,k in pairs(win_picks) do
    print(win_picks[k])
end
    
for i = 1,1000 do
    local match_count = 0
    function check_ticket()
        for _,pnum in pairs(win_picks) do
            for num in pairs(get_numbers()) do
                if tonumber(num) == tonumber(pnum) then
                    match_count = match_count + 1
                end
            end
        end
    end
    local m_value = "m"..match_count
    function add_entry(m_value)
            matchbox[m_value] = (matchbox[m_value] + 1 )
    end
end

for i,k in pairs(matchbox) do
print(matchbox[k])
end ]]

lotto = {}
function lotto.check_dups(picked_numbers)
    local dupcheck = {}
    local checkednums = {}
    for _,v in ipairs(picked_numbers) do
        if (not dupcheck[v]) then
            checkednums[#checkednums+1] = v
            dupcheck[v] = true
        else
            return lotto.get_number_pick()
        end
    end
    table.sort(checkednums)
    --checkednums = table.concat(checkednums,", ")
return checkednums
end

function lotto.get_number_pick()
--print(draw_date)
local picked_numbers = {}
    for i = 1, 4 do
        math.randomseed(os.time() * math.random(10000000,99999999) * os.clock())
        local random_num = math.ceil( math.random(1,49)) --math.ceil( math.random() * math.random(1,49) )
        table.insert(picked_numbers, random_num)
    end
return lotto.check_dups(picked_numbers)
end


local number_pick = lotto.get_number_pick()


print(lotto.get_number_pick())
matchbox = { m0 = 0, m1 = 0, m2 = 0, m3 = 0, m4 = 0 }
for i = 1,3 do
    local match_count = 0
    local m_value = "m"..tostring(match_count)
    -- function check_ticket()
        for _,pnum in pairs(number_pick) do
            for num in pairs(lotto.get_number_pick()) do
                if tonumber(num) == tonumber(pnum) then
                    match_count = match_count + 1
                            matchbox[m_value] = (matchbox[m_value] + 1 )
                end
            end
        end
    -- end
    print(m_value)

end

for i,k in pairs(matchbox) do
    print(matchbox[i])
end