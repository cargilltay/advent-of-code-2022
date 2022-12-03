local function sum(x)
    local s = 0
    for i,v in ipairs(x) do
       s = s + v
    end
    return s
 end

local function toSpecialCharCode(c)
    local charCode = string.byte(c) - 96

    if (charCode < 0) then -- byte for 'A'
        local offset = 58
        charCode = charCode + offset
    end
    
    return charCode
end

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function intersect(m,n)
    local r={}
    for i = 1, #m do
        for j = 1, #n do
            local c = m:sub(i,i)
            local c2 = n:sub(j,j)
            if (c==c2) then
                local charCode = toSpecialCharCode(c)
                local hasValue = has_value(r, charCode)
                if (hasValue == false) then
                    table.insert(r, charCode)
                end
                break
            end
        end
    end
    return r
end

local function toTable(str) 
    return str:gsub(".",function(c) table.insert(t,c) end)
end


local function rr(line) 
    local len = string.len(line)

    if(len % 2 ~= 0) then
        print("ERROR")
    end

    local middle = len / 2
    local firstHalf = string.sub(line, 1, middle)
    local secondHalf = string.sub(line, middle + 1, len)

    local commonTable = intersect(firstHalf, secondHalf)

    return sum(commonTable)
end

local function solve() 
    local fileContent = io.lines("input.txt");
    
    local total = 0

    for line in fileContent do
        total = total + rr(line)
    end

    return total
end

local res = solve()

print(res)
