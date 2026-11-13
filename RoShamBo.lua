local clanker = {"Rock", "Paper", 'Scissors'}
local pick = math.random(1, 3) 

print("Choose a number from 1 to 3, where 1 is Rock, 2 is Paper, and 3 is Scissors")
local yourpick = tonumber(io.read())

print("Your pick is " .. clanker[yourpick])
print("AI's pick is " .. clanker[pick])

if pick == yourpick then
    print("Draw!")
elseif (pick == 1 and yourpick == 3) or (pick == 3 and yourpick == 2) or (pick == 2 and yourpick == 1) then
    print("You lose!")
else
    print("You win!")
end