Config = {}

--amount of cooked items you get back when cooking
Config.BurgerAmount = 3 --burger
Config.ChickenAmount = 3 --chicken burger
Config.HotDogAmount = 8 --hotdog
Config.RibsAmount = 1 --ribs
Config.BrisketAmount = 1 --brisket
Config.JacketAmount = 1 --Jacket potatoes

--buying ingredients
Config.BuyPed = 'a_m_m_hillbilly_01'
Config.BuyLocation = vector4(1084.35, 6509.35, 21.04, 134.77)  --must be vector 4 not 3
Config.Items = {   ---set prices,amount to whatever your server economy is.
    label = "Stall",
        slots = 6,
        items = {
            [1] = {
                name = "b-uc-burger",
                price = 3,
                amount = 50,
                info = {},
                type = "item",
                slot = 1,
            },
            [2] = {
                name = "b-uc-chicken",
                price = 4,
                amount = 50,
                info = {},
                type = "item",
                slot = 2,
            },
            [3] = {
                name = "b-uc-hotdog",
                price = 2,
                amount = 50,
                info = {},
                type = "item",
                slot = 3,
            },
            [4] = {
                name = "b-uc-brisket",
                price = 2,
                amount = 50,
                info = {},
                type = "item",
                slot = 4,
            },
            [5] = {
                name = "b-uc-ribs",
                price = 5,
                amount = 20,
                info = {},
                type = "item",
                slot = 5,
            },
            [6] = {
                name = "b-uc-jacket",
                price = 5,
                amount = 50,
                info = {},
                type = "item",
                slot = 6,
            },
        }
    }