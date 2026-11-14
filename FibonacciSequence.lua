local x = 0
local y = 1

print("How many times?")
local numberoftimes = tonumber(io.read())

for i = 1, numberoftimes, 1 do
    local z = x + y
    x = y
    y = z
    io.write(z .. ", ")
end

