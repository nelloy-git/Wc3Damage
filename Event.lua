--=========
-- Include
--=========

---@type Wc3Utils
local Wc3Utils = LibManager.getDepency('Wc3Utils')
local ActionList = Wc3Utils.ActionList or error('')
local isTypeErr = Wc3Utils.isTypeErr or error('')
local pairsByKeys = Wc3Utils.pairsByKeys or error('')

---@type DamageTypeClass
local DamageType = require('Type') or error('')

--========
-- Module
--========

---@class DamageEvent
local DamageEvent = {}

DamageEvent.priority_list = {}
for name, dmg_type in pairs(DamageType.enum) do
    DamageEvent.priority_list[dmg_type] = {}
end

---@alias DamageModificator fun(dmg:number, dmg_type:damagetype, targ:Unit, src:Unit):number

--- Actions with same priority can will be executed in random order.
---@param dmg_type DamageType
---@param priority integer
---@param modificator DamageModificator
---@return Action
function DamageEvent.addAction(dmg_type, priority, modificator)
    isTypeErr(dmg_type, DamageType, 'dmg_type')
    isTypeErr(priority, 'number', 'priority')
    isTypeErr(modificator, 'function', 'modificator')

    local list = DamageEvent.priority_list[dmg_type]
    if not list[priority] then
        list[priority] = ActionList.new(DamageEvent)
    end
    local actions = list[priority]
    return actions:add(modificator)
end

---@param action Action
---@return boolean
function DamageEvent.removeAction(action)
    for dmg_type, list in pairs(DamageEvent.priority_list) do
        for priority, actions in pairs(list) do
            if actions:remove(action) then return true end
        end
    end
    return false
end

local function runActions()
    local dmg = GetEventDamage()
    local dmg_type = BlzGetEventDamageType()
    local targ = BlzGetEventDamageTarget()
    local src = GetEventDamageSource()

    local function sort(k1, k2)
        return k1 > k2
    end

    local list = DamageEvent.priority_list[dmg_type]
    for priority, actions in pairsByKeys(list, sort) do
        -- Apply damage modificators one by one.
        local count = actions:count()
        for i = 1, count do
            dmg = actions:get(i):run(dmg, dmg_type, targ, src)
        end
    end

    BlzSetEventDamage(dmg < 0 and 0 or dmg)
end

if IsGame() then
    local trigger = CreateTrigger()
    TriggerAddAction(trigger, runActions)

    for i = 0, bj_MAX_PLAYER_SLOTS - 1 do
        local pl = Player(i)
        TriggerRegisterPlayerUnitEvent(trigger, pl, EVENT_PLAYER_UNIT_DAMAGING)
    end
end

return DamageEvent