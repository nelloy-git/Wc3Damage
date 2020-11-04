LibManager.startLib('Wc3Damage')

--===========
-- Depencies
--===========

LibManager.addDepency('Wc3Utils', 'https://github.com/nelloy-git/Wc3Utils.git')

--=====
-- API
--=====

---@class Wc3Damage
local Wc3Damage = {}

---@type DamageEvent
local DamageEvent = require('Event') or error('')
Wc3Damage.addAction = DamageEvent.addAction or error('')
Wc3Damage.removeAction = DamageEvent.removeAction or error('')
---@type DamageFunctions
local DamageFunctions = require('Functions') or error('')
Wc3Damage.damage = DamageFunctions.damageUnit

LibManager.endLib()

return Wc3Damage