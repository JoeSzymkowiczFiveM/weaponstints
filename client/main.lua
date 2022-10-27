local mk2Weapons = { --I'm sure there are more mk2 weapons than this, but quick search yielded these. Always open to PRs.
    [1432025498] = true,
    [961495388] = true,
    [-86904375] = true,
    [-1768145561] = true,
    [-2066285827] = true,
    [-608341376] = true,
    [177293209] = true,
    [1785463520] = true,
    [4208062921] = true,
}

--Tint indexes provided by https://docs.fivem.net/natives/?_0x50969B9B89ED5738
local origTints = {
    "Default", "Green", "Gold", "Pink", "Camo", "LSPD", "Orange", "Platinum", 
}

local mk2Tints = {
    'Classic Black',
    'Classic Gray',
    'Classic Two-Tone',
    'Classic White',
    'Classic Beige',
    'Classic Green',
    'Classic Blue',
    'Classic Earth',
    'Classic Brown & Black',
    'Red Contrast',
    'Blue Contrast',
    'Yellow Contrast',
    'Orange Contrast',
    'Bold Pink',
    'Bold Purple & Yellow',
    'Bold Orange',
    'Bold Green & Purple',
    'Bold Red Features',
    'Bold Green Features',
    'Bold Cyan Features',
    'Bold Yellow Features',
    'Bold Red & White',
    'Bold Blue & White',
    'Metallic Gold',
    'Metallic Platinum',
    'Metallic Gray & Lilac',
    'Metallic Purple & Lime',
    'Metallic Red',
    'Metallic Green',
    'Metallic Blue',
    'Metallic White & Aqua',
    'Metallic Orange & Yellow',
    'Mettalic Red and Yellow',
}

local function TintsMenu()
    local weaponhash = GetSelectedPedWeapon(cache.ped)
    if weaponhash == `WEAPON_UNARMED` then return end
    local mk2Weapon = false
    if mk2Weapons[weaponhash] then mk2Weapon = true end

    local resgisterMe = {
        id = 'tints_menu',
        title = 'Weapons Tints',
        options = {}
    }
    local options = {}

    if mk2Weapon then 
        for i = 1, #mk2Tints do
            options[#options+1] = {
                title = v .. ' Weapon Tint',
                description = 'Apply this tint',
                onSelect = function(args)
                    SetPedWeaponTintIndex(cache.ped, weaponhash, k+1)
                end,
            }
        end
    else
        for i = 1, #origTints do
            options[#options+1] = {
                title = v .. ' Weapon Tint',
                description = 'Apply this tint',
                onSelect = function(args)
                    SetPedWeaponTintIndex(cache.ped, weaponhash, k+1)
                end,
            }
        end
    end

    resgisterMe["options"] = options
    lib.registerContext(resgisterMe)
    lib.showContext('tints_menu')
end

RegisterCommand("weapontints", TintsMenu)
