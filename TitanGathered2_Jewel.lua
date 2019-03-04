TITAN_Jewelcrafting_ID = "Jewelcrafting"
tgjPluginDb = {}

TitanGathered2_Jewel = {}
-- Reduce the chance of functions and variables colliding with another addon.
local tgj = TitanGathered2_Jewel
local infoBoardData = {}
local tg = TitanGathered2

tgj.id = TITAN_Jewelcrafting_ID
tgj.addon = "TitanGathered2_Jewelcrafting"
tgj.email = "bajtlamer@gmail.com"
tgj.www = "www.rrsoft.cz"

--  Get data from the TOC file.
tgj.version = tostring(GetAddOnMetadata(tgj.addon, "Version")) or "Unknown"
tgj.author = tostring(GetAddOnMetadata(tgj.addon, "Author")) or "Unknown"


for _, _category in pairs(TGJ_PLUGIN_CATEGORIES) do
    table.insert(TG_CATEGORIES, _category)
end


function tgj.Button_OnLoad(self)
	echo(tgj.addon.." ("..TitanUtils_GetGreenText(tgj.version).."|cffff8020) loaded! Created By "..tgj.author)
    tgj.registerPlugin()
    tgj.registerPluginMinable()
end


function tgj.registerPlugin()
    table.insert(tgPlugins, tgic)
end


function tgj.registerPluginMinable()
    for _, _m in pairs(TGJ_MINABLES)do
        table.insert(TG_MINABLES, _m)
    end
end

-- Event
function tgj.Button_OnEvent(self, event)
    -- EMPTY
end


function tgj.getGatherableSourceObject(objectId)
    for _, _m in pairs(TGJ_MINABLES) do
        if (_m.id == objectId) then
            return _m
        end
    end
    return {id = objectId, name = nil}
end
