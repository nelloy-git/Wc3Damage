--=========
-- Include
--=========

---@type Wc3Utils
local Wc3Utils = LibManager.getDepency('Wc3Utils')
local isTypeErr = Wc3Utils.isTypeErr or error('')

--========
-- Module
--========

---@class DamageFunctions
local DamageFunctions = {}

---@param dmg number
---@param dmg_type damagetype
---@param targ unit
---@param src unit
---@param sound weapontype
function DamageFunctions.damageUnit(dmg, dmg_type, targ, src, sound)
    isTypeErr(dmg, 'number', 'dmg')
    isTypeErr(dmg_type, 'damagetype', 'dmg_type')
    isTypeErr(targ, 'unit', 'targ')
    isTypeErr(src, 'unit', 'src')
    isTypeErr(sound, 'weapontype', 'sound')

    UnitDamageTarget(src, targ, dmg, false, false,
                     ATTACK_TYPE_CHAOS, dmg_type, sound)
end

return DamageFunctions