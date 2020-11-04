--=========
-- Include
--=========

local Class = LibManager.getDepency('LuaClass')

--=======
-- Class
--=======

local DamageType = Class.new('DamageType')
---@class DamageType
local public = DamageType.public
---@class DamageTypeClass
local static = DamageType.static
---@type DamageTypeClass
local override = DamageType.override
local private = {}

--=========
-- Private
--=========

private.data = setmetatable({}, {__mode = 'k'})

---@param damage_type damagetype | nil
---@return DamageType
function private.new(name, damage_type)
    local self = Class.allocate(DamageType)

    local priv = {
        name = name,
        damage_type = damage_type
    }
    private.data[self] = priv

    return self
end

--========
-- Static
--========

override.enum = {
    UNKNOWN = private.new(DAMAGE_TYPE_UNKNOWN),
    NORMAL = private.new(DAMAGE_TYPE_NORMAL),
    ENHANCED = private.new(DAMAGE_TYPE_ENHANCED),
    FIRE = private.new(DAMAGE_TYPE_FIRE),
    COLD = private.new(DAMAGE_TYPE_COLD),
    LIGHTNING = private.new(DAMAGE_TYPE_LIGHTNING),
    POISON = private.new(DAMAGE_TYPE_POISON),
    DISEASE = private.new(DAMAGE_TYPE_DISEASE),
    DIVINE = private.new(DAMAGE_TYPE_DIVINE),
    MAGIC = private.new(DAMAGE_TYPE_MAGIC),
    SONIC = private.new(DAMAGE_TYPE_SONIC),
    ACID = private.new(DAMAGE_TYPE_ACID),
    FORCE = private.new(DAMAGE_TYPE_FORCE),
    DEATH = private.new(DAMAGE_TYPE_DEATH),
    MIND = private.new(DAMAGE_TYPE_MIND),
    PLANT = private.new(DAMAGE_TYPE_PLANT),
    DEFENSIVE = private.new(DAMAGE_TYPE_DEFENSIVE),
    DEMOLITION = private.new(DAMAGE_TYPE_DEMOLITION),
    SLOW_POISON = private.new(DAMAGE_TYPE_SLOW_POISON),
    SPIRIT_LINK = private.new(DAMAGE_TYPE_SPIRIT_LINK),
    SHADOW_STRIKE = private.new(DAMAGE_TYPE_SHADOW_STRIKE),
    UNIVERSAL = private.new(DAMAGE_TYPE_UNIVERSAL),
}

--========
-- Public
--========

---@return string
function public:getName()
    return private.data[self].name
end

---@return DamageType
function public:getData()
    return private.data[self].damage_type
end

return static