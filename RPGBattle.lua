local YourHP = 7
local YourATK = 1
local YourDEF = 1
local YourInv = {"Healing Potion", "Berserk Potion"}
local InvChoice = 0
local BerserkFlag = 0
local DidDefend = 0
local EnemyHP = 10
local EnemyATK = 1
local YourChoice = 0

print("You encountered an emeny!")

while EnemyHP > 0 do
    print("Your health: " .. YourHP .. "HP. Enemy HP: " .. EnemyHP .. "HP.\nWhat will you do? 1 for attack, 2 for defend, or 3 for inventory.")
    YourChoice = io.read()

    if YourChoice == "1" then
        EnemyHP = EnemyHP - YourATK
        print("You attacked! Dealt " .. YourATK .. " damage.")
        if BerserkFlag == 1 then
            BerserkFlag = 0
            YourATK = YourATK / 2
        end
    elseif YourChoice == "2" then
        YourDEF = YourDEF * 2
        DidDefend = 1
        print("You defended! Damage halfed!")
    elseif YourChoice == "3" then
        for Num, Item in pairs(YourInv) do
            print(Num, Item)
        end
        print("What item would you like to use?")
        InvChoice = tonumber(io.read()) 
        local ItemUsed = YourInv[InvChoice]
        print("You used " .. ItemUsed .. ".")
        table.remove(YourInv, InvChoice)
        if ItemUsed == "Healing Potion" then
            YourHP = YourHP +5
            print("You healed 5 HP.")
        elseif ItemUsed == "Berserk Potion" then
            YourATK = YourATK * 2
            print("Next attack's damage is doubled!")
            BerserkFlag = 1
        end
    end

    YourHP = YourHP - (EnemyATK / YourDEF)
    print("Enemy attacked! Dealt " .. EnemyATK / YourDEF .." damage.")
    if DidDefend == 1 then
        DidDefend = 0
        YourDEF = YourDEF / 2
    end

    if YourHP <= 0 then
        print("You lost all your health.\nYou Lose.")
        os.exit()
    end
end

print("You win!")