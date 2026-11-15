local function main()
    local Player = {
        ["HP"] = 7,["ATK"] = 1,
        ["DEF"] = 1,
        ["DDef"] = 0,
        ["Inv"] = {"Healing Potion", "Berserk Potion", "Berserk Potion"},
        ["DBersk"] = 0
    }
    local Enemy = {
        ["HP"] = 9,
        ["ATK"] = 1
    }
    SetupDifficulty(Player, Enemy)

    print("You encountered an emeny!")

    while Enemy.HP > 0 do
        Turn(Player, Enemy)
    end
end

function SetupDifficulty(p, e)
    print("Select a difficulty. 1 for normal, and 2 for hard.")
    local Difficulty = io.read()

    if Difficulty == "2" then
        e.HP = 13
        e.ATK = 1.25
        table.insert(p.Inv, 1, "Healing Potion")
--        for Num, Item in pairs(p.Inv) do
--            print(Num, Item)
--        end
--        print(e.HP .. e.ATK)
    end
end

function Turn(p, e)
    print("Your health: " .. p.HP .. "HP. Enemy HP: " .. e.HP .. "HP.\nWhat will you do? 1 for attack, 2 for defend, or 3 for inventory.")
    local YourChoice = io.read()

    if YourChoice == "1" then
        e.HP = e.HP - p.ATK
        print("You attacked! Dealt " .. p.ATK .. " damage.")
        if p.DBersk == 1 then
            p.DBersk = 0
            p.ATK = p.ATK / 2
        end
    elseif YourChoice == "2" then
        p.DEF = p.DEF * 2
        p.DDef = 1
        print("You defended! Damage halfed!")
    elseif YourChoice == "3" then
        for Num, Item in pairs(p.Inv) do
            print(Num, Item)
        end
        print("What item would you like to use?")
        local InvChoice = tonumber(io.read()) 
        local ItemUsed = p.Inv[InvChoice]
        print("You used " .. ItemUsed .. ".")
        table.remove(p.Inv, InvChoice)
        if itemusage(p, ItemUsed) == 1 then
            return
        end
    end
    local DMG = (e.ATK / p.DEF)
    p.HP = p.HP - DMG
    print("Enemy attacked! Dealt " .. DMG .." damage.")
    if p.DDef == 1 then
        p.DDef = 0
        p.DEF = p.DEF / 2
    end
    if p.HP <= 0 then
        print("You lost all your health.\nYou Lose.")
        os.exit()
    end
end

function itemusage(p, i)
    if i == "Healing Potion" then
        p.HP = p.HP +5
        print("You healed 5 HP.")
    elseif i == "Berserk Potion" then
        if p.DBersk == 1 then
            print("Already berserked! Try something else.")
            table.insert(p.Inv, "Berserk Potion")
            return 1
        end
        p.ATK = p.ATK * 2
        print("Next attack's damage is doubled!")
        p.DBersk = 1
    end
end
main()

print("You win!")