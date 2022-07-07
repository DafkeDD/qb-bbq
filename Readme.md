
Discord - https://discord.gg/XPuqBVtyqX

# A BBQ Script for QBCore Framework

## Please note

- Please make sure u use the latest dependencies aswell as core for this in order to work.

- This Job has been tested on the latest build as of 07/07/2022.


## Dependencies :

QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target

qb-input - https://github.com/qbcore-framework/qb-input

qb-menu - https://github.com/qbcore-framework/qb-menu

qb-shops - https://github.com/qbcore-framework/qb-shops 

## Known Issues 
```
Prop sometimes stays in hand after emote is done. i believe this is an issue with dpemotes but i will look into this more
```

## Credits : 

- BerkieB for his qb-target.
- Breadlord as this was his original idea and he gave me permission to do it instead. 

## Insert into @qb-core/shared/items.lua 

```
QBShared.Items = {
--qb-bbq
	['b-burger'] 			        = {['name'] = 'b-burger', 		        	   	['label'] = 'Beef Burger', 		    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'b-burger.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Juicy Beef Burger'},
    ['b-uc-burger'] 			    = {['name'] = 'b-uc-burger', 		           	['label'] = 'Raw Burger', 	        ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'b-uc-burger.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Raw Patty of Beef'},
    ['b-chicken'] 			        = {['name'] = 'b-chicken', 		        	   	['label'] = 'Chicken Burger', 	    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'b-chicken.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Tender Chicken Burger'},
    ['b-uc-chicken'] 			    = {['name'] = 'b-uc-chicken', 		           	['label'] = 'Raw Chicken Burger',   ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'b-uc-chicken.png', 	       	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Raw Chicken Patty'},
    ['b-hotdog'] 			        = {['name'] = 'b-hotdog', 		        	   	['label'] = 'HotDog', 		        ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'b-hotdog.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Topped HotDog'},
    ['b-uc-hotdog'] 			    = {['name'] = 'b-uc-hotdog', 		           	['label'] = 'Raw HotDog', 	        ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'b-uc-hotdog.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Raw HotDog'},
    ['b-ribs'] 			            = {['name'] = 'b-ribs', 		        	   	['label'] = 'Spare Ribs', 		    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'b-ribs.png', 	            	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Tangy Rack of Ribs'},
    ['b-uc-ribs'] 	     		    = {['name'] = 'b-uc-ribs', 		             	['label'] = 'Raw Ribs', 	        ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'b-uc-ribs.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Raw Rack of Ribs'},
    ['b-brisket'] 			        = {['name'] = 'b-brisket', 		        	   	['label'] = 'Brisket Joint', 	    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'b-brisket.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Nicely Cooked Brisket'},
    ['b-uc-brisket'] 			    = {['name'] = 'b-uc-brisket', 		           	['label'] = 'Raw Brisket', 	        ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'b-uc-brisket.png', 	       	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Raw Brisket Joint'},
    ['b-jacket'] 			        = {['name'] = 'b-jacket', 		        	   	['label'] = 'Loaded Jacket', 	    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'b-jacket.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Fully Loaded Jacket Potato'},
    ['b-uc-jacket'] 			    = {['name'] = 'b-uc-jacket', 		           	['label'] = 'Raw Jacket', 	        ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'b-uc-jacket.png', 	        	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Raw Jacket Potato'},
    
}

```

## Insert Contents of @qb-bbq/Images into @qb-inventory/HTML/Images

## Insert into @qb-smallresources/Config/ConsumeablesEat

``` 
    ["b-hotdog"] = math.random(35, 54),
    ["b-burger"] = math.random(35, 54),
    ["b-brisket"] = math.random(35, 54),
    ["b-chicken"] = math.random(35, 54),
    ["b-ribs"] = math.random(35, 54),
    ["b-jacket"] = math.random(35, 54),

```

## Insert into @qb-smallresources/Server/Consumeables

```
QBCore.Functions.CreateUseableItem("b-burger", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("b-chicken", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("b-hotdog", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("b-ribs", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("b-brisket", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("b-jacket", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

```
## Add into Qb-target/init.lua/Config.TargetModels
``` 
["qb-bbq"] = {
        models = {
            1903501406,
            286252949,
            519797612,
            -476379988
        },
        options = {
            {
                type = "client", 
                event = "qb-bbq:BBQMenu", 
                icon = 'fas fa-burger', 
                label = 'Cook', 
            }
        },
        distance = 2.5,
    },
}

```