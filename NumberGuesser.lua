local Thought = math.random(1, 100)
local GuessNumbers = 1
print("I'm thinking about a number... Can you guess it? \nI'l tell you if your guess is higher or lower!")

local Guess = tonumber(io.read())

while Guess ~= Thought do
    
if Thought < Guess then
    print("Lower!")
    Guess = tonumber(io.read())
    GuessNumbers = GuessNumbers + 1
else
    print("Higher!")
    Guess = tonumber(io.read())
    GuessNumbers = GuessNumbers + 1
end
end
if Guess == Thought then
    print("Spot on! \nGuessed in ".. GuessNumbers.. " attempts!")
end