local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}


--BBQ Menu
RegisterNetEvent('qb-bbq:BBQMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Cook |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Burger",
            txt = "Cook a Juicy Burger",
            params = {
                event = "qb-bbq:client:CookBurger"
            }
        },
        {
            
            header = "• Chicken Burger",
            txt = "Rolling Paper , Dream Weed",
            params = {
                event = "qb-bbq:client:CookChicken"
            }
        },
        {
            
            header = "• Hot Dog",
            txt = "An American Hero",
            params = {
                event = "qb-bbq:client:CookHotDog"
            }
        },  
        {
            
            header = "• Spare Ribs",
            txt = "Juicy Pork Ribs with BBQ Sauce",
            params = {
                event = "qb-bbq:client:CookRibs"
            }
        },
        {
            
            header = "• Brisket",
            txt = "A Tender Joint of Brisket",
            params = {
                event = "qb-bbq:client:CookBrisket"
            }
        },
        {
            
            header = "• Loaded Jacket",
            txt = "A Jacket Full of Goodness",
            params = {
                event = "qb-bbq:client:CookJacket"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)
--conversation with buy ped
--[[RegisterNetEvent('qb-bbq:ShopMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Billy |",
            txt = "Hey Man hows it going?"
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Buy Items",
            txt = "Browse Goods",
            params = {
                event = "qb-bbq:shop"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)]]

RegisterNetEvent('qb-bbq:StartConvo', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Billy |",
            txt = "Hey Man hows it going?",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "Im feeling good, Thank you",
            txt = "",
            params = {
                event = "qb-bbq:FeelingGood"
            }
        },
        {
            
            header = "Im not having a good day today",
            txt = "",
            params = {
                event = "qb-bbq:FeelingBad"
            }
        },
       --[[ {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },]]
    })
end)

RegisterNetEvent('qb-bbq:FeelingGood', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| That is Great to hear Friend, you looking to buy some fresh BBQ products? |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "Yea i would love to browse your stuff",
            txt = "$ Buy $",
            params = {
                event = "qb-bbq:shop"
            }
        },
        {
            
            header = "No thank you, ill be going now",
            txt = "",
            params = {
            
            }
        },
       --[[ {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },]]
    })
end)

RegisterNetEvent('qb-bbq:FeelingBad', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Oh No that is a shame, can i interest you in some fresh BBQ products? |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "Sure, i guess so...",
            txt = "$ Buy $",
            params = {
                event = "qb-bbq:shop"
            }
        },
        {
            
            header = "No thank you, ill be going now",
            txt = "",
            params = {
        
            }
        },
        --[[{
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },]]
    })
end)

--buying--
RegisterNetEvent("qb-bbq:shop")
AddEventHandler("qb-bbq:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "bbq-products", Config.Items)
end)

Citizen.CreateThread(function()
    exports['qb-target']:SpawnPed({
        model = Config.BuyPed,
        coords = Config.BuyLocation, 
        minusOne = true, --may have to change this if your ped is in the ground
        freeze = true, 
        invincible = true, 
        blockevents = true,
        scenario = 'WORLD_HUMAN_DRUG_DEALER',
        target = { 
            options = {
                {
                    type="client",
                    event = "qb-bbq:StartConvo",
                    icon = "fas fa-smile",
                    label = "Greet"
                }
            },
          distance = 2.5,
        },
    })
end)

--Recipes--
RegisterNetEvent('qb-bbq:client:CookBurger', function() 
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasitem)
        if hasitem then
            TriggerEvent('animations:client:EmoteCommandStart', {"bbq"})
            QBCore.Functions.Progressbar("cook", "Cooking Burger", 10000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
                disableInventory = true,
            }, {}, {}, {}, function()
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerServerEvent('qb-bbq:server:CookBurger')
                QBCore.Functions.Notify("You Cooked a Burger!", "success", "20") 
            end, function() -- Cancel
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify("Canceled..", "error")
            end)
        else
            QBCore.Functions.Notify("You need some uncooked burgers!", "error")
        end
    end, "b-uc-burger")  
end)

RegisterNetEvent('qb-bbq:client:CookChicken', function() 
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasitem)
        if hasitem then
            TriggerEvent('animations:client:EmoteCommandStart', {"bbq"})
            QBCore.Functions.Progressbar("cook", "Cooking Chicken Burger", 10000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
                disableInventory = true,
            }, {}, {}, {}, function()
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerServerEvent('qb-bbq:server:CookChicken')
                QBCore.Functions.Notify("You Cooked a Chicken Burger!", "success", "20") 
            end, function() -- Cancel
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify("Canceled..", "error")
            end)
        else
            QBCore.Functions.Notify("You need an uncooked Chicken burger!", "error")
        end
    end, "b-uc-chicken")  
end)

RegisterNetEvent('qb-bbq:client:CookHotDog', function() 
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasitem)
        if hasitem then
            TriggerEvent('animations:client:EmoteCommandStart', {"bbq"})
            QBCore.Functions.Progressbar("cook", "Cooking Hot Dog", 7000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
                disableInventory = true,
            }, {}, {}, {}, function()
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerServerEvent('qb-bbq:server:CookHotDog')
                QBCore.Functions.Notify("You Cooked a HotDog!", "success", "20") 
            end, function() -- Cancel
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify("Canceled..", "error")
            end)
        else
            QBCore.Functions.Notify("You need some uncooked hotdog!", "error")
        end
    end, "b-uc-hotdog")  
end)

RegisterNetEvent('qb-bbq:client:CookRibs', function() 
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasitem)
        if hasitem then
            TriggerEvent('animations:client:EmoteCommandStart', {"bbq"})
            QBCore.Functions.Progressbar("cook", "Cooking Ribs", 10000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
                disableInventory = true,
            }, {}, {}, {}, function()
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerServerEvent('qb-bbq:server:CookRibs')
                QBCore.Functions.Notify("You Cooked Spare Ribs!", "success", "20") 
            end, function() -- Cancel
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify("Canceled..", "error")
            end)
        else
            QBCore.Functions.Notify("You need uncooked ribs!", "error")
        end
    end, "b-uc-ribs")  
end)

RegisterNetEvent('qb-bbq:client:CookBrisket', function() 
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasitem)
        if hasitem then
            TriggerEvent('animations:client:EmoteCommandStart', {"bbq"})
            QBCore.Functions.Progressbar("cook", "Cooking Brisket", 20000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
                disableInventory = true,
            }, {}, {}, {}, function()
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerServerEvent('qb-bbq:server:CookBrisket')
                QBCore.Functions.Notify("You Cooked Brisket!", "success", "20") 
            end, function() -- Cancel
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify("Canceled..", "error")
            end)
        else
            QBCore.Functions.Notify("You need uncooked brisket!", "error")
        end
    end, "b-uc-brisket")  
end)

RegisterNetEvent('qb-bbq:client:CookJacket', function() 
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasitem)
        if hasitem then
            TriggerEvent('animations:client:EmoteCommandStart', {"bbq"})
            QBCore.Functions.Progressbar("cook", "Cooking Jacket Potato", 10000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
                disableInventory = true,
            }, {}, {}, {}, function()
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerServerEvent('qb-bbq:server:CookJacket')
                QBCore.Functions.Notify("You Cooked a Jacket!", "success", "20") 
            end, function() -- Cancel
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify("Canceled..", "error")
            end)
        else
            QBCore.Functions.Notify("You need an uncooked Jacket!", "error")
        end
    end, "b-uc-jacket")  
end)

--Prop Model for target

--[[exports['qb-target']:AddTargetBones(Config.Objects, {
    options = {
        {
            type = "client",
            event = "qb-menu:BBQMenu",
            icon = "fas fa-burger",
            label = "Cook",
        },
    },
    distance = 2.5
}) ]]

