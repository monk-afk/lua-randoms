pick_matches = {
}
local prize_pool = 0
local prize_payout = 0
local carryover = 0
-- picks = {}
--[[  ]]





function check_dups(picked_numbers)
    local hash = {}
    local res = {}
    for _,v in pairs(picked_numbers) do
        if (not hash[v]) then
            res[#res+1] = v
            hash[v] = true
        else
            return get_number_pick()
        end
    end
return res
end

function get_number_pick()
--print(draw_date)
local picked_numbers = {}
    for i = 1, 6 do
        math.randomseed(os.time() * math.random(10000000,99999999) * os.clock())
        local random_num = math.ceil( math.random(1,39)) --math.ceil( math.random() * math.random(1,49) )
        table.insert(picked_numbers, random_num)
    end
return check_dups(picked_numbers)
end

local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end
local int = 0
local m6s = 0.05
local m5s = 0.05
local m4s = 0.1
local m3s = 0.3
local m2s = 0.5
-- local m1s = 0.05
--print(table.concat(get_number_pick(), " - "))
function get_carryover(carryover)
    int = int + 1
    print(int)
    if --[[ match_count == "m4" and ]] pick_matches.m6 >= 1 then
    print("m6: "..pick_matches.m6.." | "..
    math.floor(( prize_pool * m6s ) / pick_matches.m6).." | $"..
    math.floor(( prize_pool * m6s ) / pick_matches.m6)*5
    )
    carryover = carryover - math.floor(( prize_pool * m6s ))
    end

    if --[[ match_count == "m4" and ]] pick_matches.m5 >= 1 then
    print("m5: "..pick_matches.m5.." | "..
    math.floor(( prize_pool * m5s ) / pick_matches.m5).." | $"..
    math.floor(( prize_pool * m5s ) / pick_matches.m5)*5
    )
    carryover = carryover - math.floor(( prize_pool * m5s ))
    end

    if --[[ match_count == "m4" and ]] pick_matches.m4 >= 1 then
    print("m4: "..pick_matches.m4.." | "..
    math.floor(( prize_pool * m4s ) / pick_matches.m4).." | $"..
    math.floor(( prize_pool * m4s ) / pick_matches.m4)*5
    )
    carryover = carryover - math.floor(( prize_pool * m4s ))
    end

    if --[[ match_count == "m3" and ]] pick_matches.m3 >= 1 then
    print("m3: "..pick_matches.m3.." | "..
    math.floor(( prize_pool * m3s ) / pick_matches.m3).." | $"..
    math.floor(( prize_pool * m3s ) / pick_matches.m3)*5
    )
    carryover = carryover - math.floor(( prize_pool * m3s ))
    end

    if --[[ match_count == "m2" and ]] pick_matches.m2 >= 1 then
    print("m2: "..pick_matches.m2.." | "..
    math.ceil(( prize_pool * m2s ) / pick_matches.m2).." | $"..
    math.ceil(( prize_pool * m2s ) / pick_matches.m2)*5
    )
    carryover = carryover - math.ceil(( prize_pool * m2s ))
    end

    -- if --[[ match_count == "m1" and ]] pick_matches.m1 >= 1 then
    -- print("m1: "..pick_matches.m1 .." | "..
    -- math.ceil(( prize_pool * m1s )/ pick_matches.m1 ).." | $"..
    -- math.ceil(( prize_pool * m1s )/ pick_matches.m1)*5
    -- )
    -- prize_pool = prize_pool - math.ceil(( prize_pool * m1s ))
    -- end
    -- carryover = prize_pool
    print("-------------")
    sleep(1)
return check_ticket(carryover)
end


function check_ticket(carryover)
    local win_picks = get_number_pick()
    
    --print(int)
    prize_pool = 0 + carryover
    pick_matches = {
        m1 = 0,
        m2 = 0,
        m3 = 0,
        m4 = 0,
        m5 = 0,
        m6 = 0
    }
    math.randomseed(os.time() * math.random(10000000,99999999) * os.clock())
    local random_num = math.ceil( math.random(300,1200)) --math.ceil( math.random() * math.random(1,49) )
    for i = 1,random_num do
        local match_count = 0
        --local ticket_nums = table.concat(get_number_pick(), " - ")
        local ticket_nums = get_number_pick()
        --for num in ticket_nums:gmatch("[^%s%-%s]+") do
        for _,num in pairs(ticket_nums) do
            -- picks[num] = (picks[num] or 0) + 1
                for _,pnum in pairs(win_picks) do
                    --print(num.."|"..pnum)
                if tonumber(num) == tonumber(pnum) then
                    match_count = match_count + 1
                end
            end
        end
        if match_count >= 1 then
            local mnum_key = "m"..match_count
            pick_matches[mnum_key] = pick_matches[mnum_key] + 1
        end
        prize_pool = prize_pool + 1
    end
    print("lot $"..prize_pool*5 .. " | carry: $" .. carryover*5)
    
return get_carryover(prize_pool)
end



check_ticket(carryover)
-- print(prize_pool)

