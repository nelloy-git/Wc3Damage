--=========
-- Include
--=========

---@type Wc3Utils
local Wc3Utils = LibManager.getDepency('Wc3Utils')
local isTypeErr = Wc3Utils.isTypeErr or error('')

---@type DamageTypeClass
local DamageType = require('Type') or error('')

--========
-- Module
--========

---@class DamageFunctions
local DamageFunctions = {}

---@param dmg number
---@param dmg_type DamageType
---@param is_attack boolean
---@param targ unit
---@param src unit
---@param sound weapontype
function DamageFunctions.damageUnit(dmg, dmg_type, is_attack, targ, src, sound)
    isTypeErr(dmg, 'number', 'dmg')
    isTypeErr(dmg_type, DamageType, 'dmg_type')
    isTypeErr(targ, 'unit', 'targ')
    isTypeErr(src, 'unit', 'src')
    isTypeErr(sound, 'weapontype', 'sound')

    UnitDamageTarget(src, targ, dmg, is_attack,
                     false, ATTACK_TYPE_CHAOS, dmg_type:getData(), sound)
end

return DamageFunctions