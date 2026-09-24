-- lua notes
function greet(name)
    return "hello " .. name
end

print(greet("practice"))

local nums = {1, 2, 3}
for i, n in ipairs(nums) do
    print(n * 2)
end

-- TODO: try metatables next
