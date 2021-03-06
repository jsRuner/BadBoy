if select(2, UnitClass("player")) == "MONK" then
    local rotationName = "CuteOne"

---------------
--- Toggles ---
---------------
    local function createToggles()
    -- Rotation Button
        RotationModes = {
            [1] = { mode = "Auto", value = 1 , overlay = "Automatic Rotation", tip = "Swaps between Single and Multiple based on number of targets in range.", highlight = 1, icon = bb.player.spell.spinningCraneKick },
            [2] = { mode = "Mult", value = 2 , overlay = "Multiple Target Rotation", tip = "Multiple target rotation used.", highlight = 0, icon = bb.player.spell.spinningCraneKick },
            [3] = { mode = "Sing", value = 3 , overlay = "Single Target Rotation", tip = "Single target rotation used.", highlight = 0, icon = bb.player.spell.tigerPalm },
            [4] = { mode = "Off", value = 4 , overlay = "DPS Rotation Disabled", tip = "Disable DPS Rotation", highlight = 0, icon = bb.player.spell.effuse}
        };
        CreateButton("Rotation",1,0)
    -- Cooldown Button
        CooldownModes = {
            [1] = { mode = "Auto", value = 1 , overlay = "Cooldowns Automated", tip = "Automatic Cooldowns - Boss Detection.", highlight = 1, icon = bb.player.spell.invokeXuen },
            [2] = { mode = "On", value = 1 , overlay = "Cooldowns Enabled", tip = "Cooldowns used regardless of target.", highlight = 0, icon = bb.player.spell.invokeXuen },
            [3] = { mode = "Off", value = 3 , overlay = "Cooldowns Disabled", tip = "No Cooldowns will be used.", highlight = 0, icon = bb.player.spell.invokeXuen }
        };
        CreateButton("Cooldown",2,0)
    -- Defensive Button
        DefensiveModes = {
            [1] = { mode = "On", value = 1 , overlay = "Defensive Enabled", tip = "Includes Defensive Cooldowns.", highlight = 1, icon = bb.player.spell.dampenHarm },
            [2] = { mode = "Off", value = 2 , overlay = "Defensive Disabled", tip = "No Defensives will be used.", highlight = 0, icon = bb.player.spell.dampenHarm }
        };
        CreateButton("Defensive",3,0)
    -- Interrupt Button
        InterruptModes = {
            [1] = { mode = "On", value = 1 , overlay = "Interrupts Enabled", tip = "Includes Basic Interrupts.", highlight = 1, icon = bb.player.spell.spearHandStrike },
            [2] = { mode = "Off", value = 2 , overlay = "Interrupts Disabled", tip = "No Interrupts will be used.", highlight = 0, icon = bb.player.spell.spearHandStrike }
        };
        CreateButton("Interrupt",4,0)
    -- Storm, Earth, and Fire Button
        SEFModes = {
            [1] = { mode = "On", value = 2 , overlay = "Auto SEF Enabled", tip = "Will cast Storm, Earth, and Fire.", highlight = 1, icon = bb.player.spell.stormEarthAndFire},
            [2] = { mode = "Off", value = 1 , overlay = "Auto SEF Disabled", tip = "Will NOT cast Storm, Earth, and Fire.", highlight = 0, icon = bb.player.spell.stormEarthAndFireFixate}
        };
        CreateButton("SEF",5,0)
    -- Flying Serpent Kick Button
        FSKModes = {
            [1] = { mode = "On", value = 2 , overlay = "Auto FSK Enabled", tip = "Will cast Flying Serpent Kick.", highlight = 1, icon = bb.player.spell.flyingSerpentKick},
            [2] = { mode = "Off", value = 1 , overlay = "Auto FSK Disabled", tip = "Will NOT cast Flying Serpent Kick.", highlight = 0, icon = bb.player.spell.flyingSerpentKickEnd}
        };
        CreateButton("FSK",6,0)
    end

---------------
--- OPTIONS ---
---------------
    local function createOptions()
        local optionTable

        local function rotationOptions()
            -----------------------
            --- GENERAL OPTIONS ---
            -----------------------
            section = bb.ui:createSection(bb.ui.window.profile,  "General")
            -- APL
                bb.ui:createDropdownWithout(section, "APL Mode", {"|cffFFFFFFSimC","|cffFFFFFFAMR"}, 1, "|cffFFFFFFSet APL Mode to use.")
            -- Dummy DPS Test
                bb.ui:createSpinner(section, "DPS Testing",  5,  5,  60,  5,  "|cffFFFFFFSet to desired time for test in minuts. Min: 5 / Max: 60 / Interval: 5")
            -- Pre-Pull Timer
                bb.ui:createSpinner(section, "Pre-Pull Timer",  5,  1,  10,  1,  "|cffFFFFFFSet to desired time to start Pre-Pull (DBM Required). Min: 1 / Max: 10 / Interval: 1")
            -- Roll
                bb.ui:createCheckbox(section, "Roll")         
            bb.ui:checkSectionState(section)
            ------------------------
            --- COOLDOWN OPTIONS ---
            ------------------------
            section = bb.ui:createSection(bb.ui.window.profile,  "Cooldowns")
            -- Agi Pot
                bb.ui:createCheckbox(section,"Agi-Pot")
            -- Legendary Ring
                bb.ui:createCheckbox(section,"Legendary Ring")
            -- Flask / Crystal
                bb.ui:createCheckbox(section,"Flask / Crystal")
            -- Trinkets
                bb.ui:createCheckbox(section,"Trinkets")
            -- Touch of the Void
                bb.ui:createCheckbox(section,"Touch of the Void")
            -- Serenity
                bb.ui:createCheckbox(section,"Serenity")
            -- Xuen
                bb.ui:createCheckbox(section,"Xuen")
            bb.ui:checkSectionState(section)
            -------------------------
            --- DEFENSIVE OPTIONS ---
            -------------------------
             section = bb.ui:createSection(bb.ui.window.profile, "Defensive")
            -- Healthstone
                bb.ui:createSpinner(section, "Healthstone",  60,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
            -- Heirloom Neck
                bb.ui:createSpinner(section, "Heirloom Neck",  60,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
            -- Effuse
                bb.ui:createSpinner(section, "Effuse",  50,  0,  100,  5,  "|cffFFFFFFHealth Percent to Cast At")
            -- Healing Elixir
                bb.ui:createSpinner(section, "Healing Elixir", 50, 0, 100, 5, "|cffFFFFFFHealth Percent to Cast At")
            -- Leg Sweep
                bb.ui:createSpinner(section, "Leg Sweep - HP", 50, 0, 100, 5, "|cffFFFFFFHealth Percent to Cast At")
                bb.ui:createSpinner(section, "Leg Sweep - AoE", 5, 0, 10, 1, "|cffFFFFFFNumber of Units in 5 Yards to Cast At")
            -- Touch of Karma
                bb.ui:createSpinner(section, "Touch of Karma",  50,  0,  100,  5,  "|cffFFFFFFHealth Percent to Cast At")
            -- Diffuse Magic/Dampen Harm
                bb.ui:createSpinner(section, "Diffuse/Dampen",  50,  0,  100,  5,  "|cffFFFFFFHealth Percent to Cast At")
            bb.ui:checkSectionState(section)
            -------------------------
            --- INTERRUPT OPTIONS ---
            -------------------------
            section = bb.ui:createSection(bb.ui.window.profile, "Interrupts")
            --Quaking Palm
                bb.ui:createCheckbox(section, "Quaking Palm")
            -- Spear Hand Strike
                bb.ui:createCheckbox(section, "Spear Hand Strike")
            -- Paralysis
                bb.ui:createCheckbox(section, "Paralysis")
            -- Leg Sweep
                bb.ui:createCheckbox(section, "Leg Sweep")
            -- Interrupt Percentage
                bb.ui:createSpinner(section,  "InterruptAt",  0,  0,  95,  5,  "|cffFFBB00Cast Percentage to use at.")
            bb.ui:checkSectionState(section)
            ----------------------
            --- TOGGLE OPTIONS ---
            ----------------------
            section = bb.ui:createSection(bb.ui.window.profile,  "Toggle Keys")
            -- Single/Multi Toggle
                bb.ui:createDropdown(section,  "Rotation Mode", bb.dropOptions.Toggle,  4)
            --Cooldown Key Toggle
                bb.ui:createDropdown(section,  "Cooldown Mode", bb.dropOptions.Toggle,  3)
            --Defensive Key Toggle
                bb.ui:createDropdown(section,  "Defensive Mode", bb.dropOptions.Toggle,  6)
            -- Interrupts Key Toggle
                bb.ui:createDropdown(section,  "Interrupt Mode", bb.dropOptions.Toggle,  6)
            -- SEF Toggle
                bb.ui:createDropdown(section,  "SEF Mode", bb.dropOptions.Toggle,  5)
            -- FSK Toggle
                bb.ui:createDropdown(section,  "FSK Mode", bb.dropOptions.Toggle,  5)
            -- Pause Toggle
                bb.ui:createDropdown(section,  "Pause Mode", bb.dropOptions.Toggle,  6)
            bb.ui:checkSectionState(section)
        end
        optionTable = {{
            [1] = "Rotation Options",
            [2] = rotationOptions,
        }}
        return optionTable
    end

----------------
--- ROTATION ---
----------------
    local function runRotation()
        if bb.timer:useTimer("debugWindwalker", math.random(0.15,0.3)) then
            --print("Running: "..rotationName)

    ---------------
    --- Toggles ---
    ---------------
            UpdateToggle("Rotation",0.25)
            UpdateToggle("Cooldown",0.25)
            UpdateToggle("Defensive",0.25)
            UpdateToggle("Interrupt",0.25)
            UpdateToggle("SEF",0.25)
            UpdateToggle("FSK",0.25)
            
    --------------
    --- Locals ---
    --------------
            local agility           = UnitStat("player", 2)
            local artifact          = bb.player.artifact
            local baseAgility       = 0
            local baseMultistrike   = 0
            local buff              = bb.player.buff
            local canFlask          = canUse(bb.player.flask.wod.agilityBig)
            local cast              = bb.player.cast
            local castTimeFoF       = 4-(4*UnitSpellHaste("player")/100)
            local castTimeHS        = 2-(2*UnitSpellHaste("player")/100)
            local cd                = bb.player.cd
            local charges           = bb.player.charges
            local chi               = bb.player.chi
            local combatTime        = getCombatTime()
            local debuff            = bb.player.debuff
            local enemies           = bb.player.enemies
            local flaskBuff         = getBuffRemain("player",bb.player.flask.wod.buff.agilityBig) or 0
            local glyph             = bb.player.glyph
            local healthPot         = getHealthPot() or 0
            local inCombat          = bb.player.inCombat
            local inRaid            = select(2,IsInInstance())=="raid"
            local lastSpell         = lastSpellCast
            local level             = bb.player.level
            local mode              = bb.player.mode
            local php               = bb.player.health
            local power             = bb.player.power
            local powerMax          = bb.player.powerMax
            local pullTimer         = bb.DBM:getPulltimer()
            local race              = bb.player.race
            local racial            = bb.player.getRacial()
            local recharge          = bb.player.recharge
            local regen             = bb.player.powerRegen
            local solo              = select(2,IsInInstance())=="none"
            local spell             = bb.player.spell
            local t17_2pc           = bb.player.eq.t17_2pc
            local t18_2pc           = bb.player.eq.t18_2pc 
            local t18_4pc           = bb.player.eq.t18_4pc
            local talent            = bb.player.talent
            local thp               = getHP(bb.player.units.dyn5)
            local trinketProc       = false --bb.player.hasTrinketProc()
            local ttd               = getTTD(bb.player.units.dyn5)
            local ttm               = bb.player.timeToMax
            local units             = bb.player.units
            if lastSpell == nil then lastSpell = 0 end
            if leftCombat == nil then leftCombat = GetTime() end
            if profileStop == nil then profileStop = false end

            -- ChatOverlay(round2(getDistance3("target"),2))
    --------------------
    --- Action Lists ---
    --------------------
        -- Action List - Extras
            function actionList_Extras()
            -- Stop Casting
                if ((getDistance(units.dyn5) < 5 or (useFSK() and cd.flyingSerpentKick == 0)) and isCastingSpell(spell.cracklingJadeLightning)) 
                    or (not useAoE() and isCastingSpell(spell.spinningCraneKick)) 
                then
                    SpellStopCasting()
                end
            -- Tiger's Lust
                if hasNoControl() or (inCombat and getDistance("target") > 10 and ObjectExists("target") and not UnitIsDeadOrGhost("target")) then
                    if cast.tigersLust() then return end
                end
            -- Detox
                if canDispel("player",spell.detox) then
                    if cast.detox("player") then return end
                end
                if UnitIsPlayer("mouseover") and not UnitIsDeadOrGhost("mouseover") then
                    if canDispel("mouseover",spell.detox) then
                        if cast.detox("mouseover") then return end
                    end
                end
            -- Resuscitate
                if cast.resuscitate() then return end
            -- Provoke
                if not inCombat and select(3,GetSpellInfo(101545)) ~= "INTERFACE\\ICONS\\priest_icon_chakra_green" 
                    and cd.flyingSerpentKick > 1 and getDistance("target") > 10 and ObjectExists("target") 
                then
                    if solo or #bb.friend == 1 then
                        if cast.provoke() then return end
                    end
                end
            -- Flying Serpent Kick
                if useFSK() then
                    if cast.flyingSerpentKick() then return end 
                    if cast.flyingSerpentKickEnd() then return end
                end
            -- Roll
                if isChecked("Roll") and getDistance("target") > 10 and getFacingDistance() < 5 and getFacing("player","target",10) then
                    if cast.roll() then return end
                end
            -- Dummy Test
                if isChecked("DPS Testing") then
                    if ObjectExists("target") then
                        if combatTime >= (tonumber(getValue("DPS Testing"))*60) and isDummy() then
                            CancelUnitBuff("player", GetSpellInfo(bb.player.spell.stormEarthAndFire))
                            StopAttack()
                            ClearTarget()
                            StopAttack()
                            ClearTarget()
                            print(tonumber(getValue("DPS Testing")) .." Minute Dummy Test Concluded - Profile Stopped")
                        end
                    end
                end
            -- Crackling Jade Lightning
                -- if getDistance(units.dyn5) >= 5 and ((useFSK() and cd.flyingSerpentKick > 1) or not useFSK()) 
                --     and not isCastingSpell(spell.cracklingJadeLightning) and (hasThreat("target") or isDummy()) and not isMoving("player") 
                -- then
                --     if cast.cracklingJadeLightning() then return end
                -- end
            -- Touch of the Void
                if (useCDs() or useAoE()) and isChecked("Touch of the Void") and inCombat and getDistance(units.dyn5)<5 then
                    if hasEquiped(128318) then
                        if GetItemCooldown(128318)==0 then
                            useItem(128318)
                        end
                    end
                end
            -- Fixate - Storm, Earth, and Fire
                if isDummy("target") then
                    if cast.stormEarthAndFireFixate() then return end
                end
            end -- End Action List - Extras
        -- Action List - Defensive
            function actionList_Defensive()
                if useDefensive() then
            -- Pot/Stoned
                    if isChecked("Pot/Stoned") and getHP("player") <= getValue("Pot/Stoned") and inCombat then
                        if canUse(5512) then
                            useItem(5512)
                        elseif canUse(healthPot) then
                            useItem(healthPot)
                        end
                    end
            -- Heirloom Neck
                    if isChecked("Heirloom Neck") and php <= getOptionValue("Heirloom Neck") then
                        if hasEquiped(122668) then
                            if GetItemCooldown(122668)==0 then
                                useItem(122668)
                            end
                        end
                    end
            -- Diffuse Magic
                    if isChecked("Diffuse/Dampen") and ((php <= getValue("Diffuse Magic") and inCombat) or canDispel("player",bb.player.spell.diffuseMagic)) then
                        if cast.diffuseMagic() then return end
                    end
            -- Dampen Harm
                    if isChecked("Diffuse/Dampen") and php <= getValue("Dampen Harm") and inCombat then
                        if cast.dampenHarm() then return end
                    end
            -- Effuse
                    if isChecked("Effuse") and ((not inCombat and php <= getOptionValue("Effuse")) or (inCombat and php <= getOptionValue("Effuse") / 2)) then
                        if cast.effuse() then return end
                    end
            -- Healing Elixir
                    if isChecked("Healing Elixir") and php <= getValue("Healing Elixir") then
                        if cast.healingElixir() then return end
                    end
            -- Leg Sweep
                    if isChecked("Leg Sweep - HP") and php <= getValue("Leg Sweep - HP") and inCombat and #enemies.yards5 > 0 then
                        if cast.legSweep() then return end
                    end
                    if isChecked("Leg Sweep - AoE") and #enemies.yards5 >= getValue("Leg Sweep - AoE") then
                        if cast.legSweep() then return end
                    end
            -- Touch of Karma
                    if isChecked("Touch of Karma") and php <= getValue("Touch of Karma") and inCombat then
                        if cast.touchOfKarma() then return end
                    end
                end -- End Defensive Check
            end -- End Action List - Defensive
        -- Action List - Interrupts
            function actionList_Interrupts()
                if useInterrupts() then
            -- Quaking Palm
                    if isChecked("Quaking Palm") then
                        for i=1, #getEnemies("player",5) do
                            thisUnit = getEnemies("player",5)[i]
                            if canInterrupt(thisUnit,getOptionValue("InterruptAt")) then
                                if cast.quakingPalm(thisUnit) then return end
                            end
                        end
                    end
            -- Spear Hand Strike
                    if isChecked("Spear Hand Strike") then
                        for i=1, #getEnemies("player",5) do
                            thisUnit = getEnemies("player",5)[i]
                            if canInterrupt(thisUnit,getOptionValue("InterruptAt")) then
                                if cast.spearHandStrike(thisUnit) then return end
                            end
                        end
                    end
            -- Paralysis
                    if isChecked("Paralysis") then
                        for i=1, #getEnemies("player",20) do
                            thisUnit = getEnemies("player",20)[i]
                            if canInterrupt(thisUnit,getOptionValue("InterruptAt")) then
                                if cast.paralysis(thisUnit) then return end
                            end
                        end
                    end 
            -- Leg Sweep
                    if isChecked("Leg Sweep") then
                        for i=1, #getEnemies("player",5) do
                            thisUnit = getEnemies("player",5)[i]
                            if canInterrupt(thisUnit,getOptionValue("InterruptAt")) then
                                if cast.legSweep(thisUnit) then return end
                            end
                        end
                    end 
                end -- End Interrupt Check
            end -- End Action List - Interrupts
        -- Action List - Pre-Combat
            function actionList_PreCombat()
                if not inCombat then
            -- Flask / Crystal
                    -- flask,type=flask_of_the_seventh_demon
                    if isChecked("Flask / Crystal") then
                        if inRaid and canFlask and flaskBuff==0 and not UnitBuffID("player",188033) then
                            useItem(bb.player.flask.wod.agilityBig)
                            return true
                        end
                        if flaskBuff==0 then
                            if not UnitBuffID("player",188033) and canUse(118922) then --Draenor Insanity Crystal
                                useItem(118922)
                                return true
                            end
                        end
                    end
            -- Food 
                    -- food,type=salty_squid_roll
            -- Snapshot Stats
                    -- snapshot_stats
                    if baseAgility == 0 then
                        baseAgility = UnitStat("player", 2)
                    end
                    if baseMultistrike == 0 then
                        -- baseMultistrike = GetMultistrike()
                    end
            -- Potion
                    -- potion,name=draenic_agility
                    if useCDs() and canUse(109217) and inRaid and isChecked("Agi-Pot") and isChecked("Pre-Pull Timer") and pullTimer <= getOptionValue("Pre-Pull Timer") then
                        useItem(109217)
                    end
            -- Start Attack
                    -- auto_attack
                    if ObjectExists("target") and not UnitIsDeadOrGhost("target") and UnitCanAttack("target", "player") and getDistance("target") < 5 then
                        StartAttack()
                    end
                end -- End No Combat Check
            end --End Action List - Pre-Combat
        -- Action list - Opener
            function actionList_Opener() --Not Actually Used In Current SimC APL Despite Being Listed
            -- -- Legendary Ring
            --     -- use_item,name=maalus_the_blood_drinker
            --     if useCDs() and isChecked("Legendary Ring") then
            --         if hasEquiped(124636) and canUse(124636) then
            --             useItem(124636)
            --             return true
            --         end
            --     end
            -- -- Racial: Orc Blood Fury | Troll Berserking | Blood Elf Arcane Torrent
            --     -- blood_fury
            --     -- berserking
            --     -- arcane_torrent,if=chi.max-chi>=1 
            --     if useCDs() then
            --         if (bb.player.race == "Orc" or bb.player.race == "Troll") then
            --             if cast.racial() then return end
            --         end
            --         if bb.player.race == "Blood Elf" and chi.diff >= 1 then
            --             if cast.racial() then return end
            --         end
            --     end 
            -- -- Fists of Fury
            --     -- fists_of_fury,if=buff.serenity.up&buff.serenity.remains<1.5
            --     if buff.serenity and buff.remain.serenity < 1.5 then
            --         if cast.fistsOfFury() then return end
            --     end
            -- -- Rising Sun Kick
            --     -- rising_sun_kick
            --     if cast.risingSunKick() then return end
            -- -- Blackout Kick
            --     -- blackout_kick,if=chi.max-chi<=1&cooldown.chi_brew.up|buff.serenity.up
            --     if chi.diff <= 1 or buff.serenity then
            --         if cast.blackoutKick() then return end
            --     end
            -- -- Serenity
            --     -- serenity,if=chi.max-chi<=2
            --     if useCDs() and isChecked("Serenity") then
            --         if chi.diff <= 2 then
            --             if cast.serenity() then return end
            --         end
            --     end
            -- -- Tiger Palm
            --     -- tiger_palm,if=chi.max-chi>=2&!buff.serenity.up
            --     if chi.diff >= 2 and not buff.serenity then
            --         if cast.tigerPalm() then return end
            --     end
            end -- End Action List - Opener
        -- Action List - Single Target
            function actionList_SingleTarget()
            -- Rising Sun Kick
                -- rising_sun_kick
                if cast.risingSunKick() then return end
            -- Rushing Jade Wind
                -- rushing_jade_wind,if=chi>1&!prev_gcd.rushing_jade_wind
                if chi.count > 1 and lastSpell ~= spell.rushingJadeWind then
                    if cast.rushingJadeWind() then return end
                end
            -- Chi Wave
                -- chi_wave,if=energy.time_to_max>2&buff.serenity.down
                if ttm > 2 and not buff.serenity then
                    if cast.chiWave() then return end
                end
            -- Chi Burst
                -- chi_burst,if=energy.time_to_max>2&buff.serenity.down
                if ttm>2 and not buff.serenity then
                    if cast.chiBurst() then return end
                end
            -- Blackout Kick
                -- blackout_kick,if=(chi>1|buff.bok_proc.up)&buff.serenity.down&!prev_gcd.blackout_kick
                --if (chi.count > 1 or buff.comboBreaker) and not buff.serenity and (lastSpell ~= spell.blackoutKick or chi.count > 2) then
                if (chi.count > 1 or buff.blackoutKick) and not buff.serenity and lastSpell ~= spell.blackoutKick then
                    if cast.blackoutKick() then return end
                end
            -- Tiger Palm
                -- tiger_palm,if=(buff.serenity.down&chi<=2)&!prev_gcd.tiger_palm
                --if (not buff.serenity and chi.count <= 2) and (lastSpell ~= spell.tigerPalm or chi.count <= 2) then
                if (not buff.serenity and chi.count <= 2) and lastSpell ~= spell.tigerPalm then
                    if cast.tigerPalm() then return end
                end
            end -- End Action List - Single Target
 
        -- Action List - Multi-Target: No Rushing Jade Wind
            function actionList_MultiTarget()
            -- Spinning Crane Kick
                -- spinning_crane_kick
                -- spinning_crane_kick,if=!prev_gcd.spinning_crane_kick
                if lastSpell ~= spell.spinningCraneKick then
                    if cast.spinningCraneKick() then return end
                end
            -- Rising Sun Kick
                -- rising_sun_kick,cycle_targets=1
                for i = 1, #enemies.yards5 do
                    local thisUnit = enemies.yards5[i]
                    local markOfTheCraneDebuff = getDebuffRemain(thisUnit,spell.spec.debuffs.markOfTheCrane,"player") or 0
                    if markOfTheCraneDebuff < 1 then
                        if cast.risingSunKick(thisUnit) then return end
                    end
                end 
            -- Rushing Jade Wind
                -- rushing_jade_wind,if=chi>1&!prev_gcd.rushing_jade_wind
                if chi.count > 1 and lastSpell ~= spell.rushingJadeWind then
                    if cast.rushingJadeWind() then return end
                end
            -- Chi Wave
                -- chi_wave,if=energy.time_to_max>2|buff.serenity.down
                if ttm > 2 or not buff.serenity then
                    if cast.chiWave() then return end
                end
            -- Chi Burst
                -- chi_burst,if=energy.time_to_max>2|buff.serenity.down
                if ttm > 2 or not buff.serenity then
                    if cast.chiBurst() then return end
                end
                for i = 1, #enemies.yards5 do
                    local thisUnit = enemies.yards5[i]
                    local markOfTheCraneDebuff = getDebuffRemain(thisUnit,spell.spec.debuffs.markOfTheCrane,"player") or 0 
            -- Blackout Kick
                    -- blackout_kick,if=(chi>1|buff.bok_proc.up)&buff.serenity.down&!prev_gcd.blackout_kick,cycle_targets=1
                    --if (buff.comboBreaker or (chi.count > 0 and markOfTheCraneDebuff < 1)) and not buff.serenity and markOfTheCraneDebuff < 1 then
                    if (chi.count > 1 or buff.blackoutKick) and not buff.serenity and lastSpell ~= spell.blackoutKick then
                        if cast.blackoutKick(thisUnit) then return end
                    end
            -- Tiger Palm
                    -- tiger_palm,if=(buff.serenity.down&chi<=2)&!prev_gcd.tiger_palm,cycle_targets=1
                    --if not buff.serenity and (chi.count <= 2 or markOfTheCraneDebuff < 1) then
                    if (not buff.serenity and chi.count <= 2) and lastSpell ~= spell.tigerPalm then
                        if cast.tigerPalm(thisUnit) then return end
                    end
                end
            end -- End Action List - Multi-Target
    ---------------------
    --- Begin Profile ---
    ---------------------
        -- Profile Stop | Pause
            if not inCombat and not hastar and profileStop==true then
                profileStop = false
            elseif (inCombat and profileStop==true) or pause() or mode.rotation==4 then
                return true
            else
    -----------------------
    --- Extras Rotation ---
    -----------------------
                if actionList_Extras() then return end
    --------------------------
    --- Defensive Rotation ---
    --------------------------
                if actionList_Defensive() then return end
    ------------------------------
    --- Pre-Combat Rotation ---
    ------------------------------
                if actionList_PreCombat() then return end
    --------------------------
    --- In Combat Rotation ---
    --------------------------
            -- FIGHT!
                if inCombat and profileStop==false then 
        ------------------
        --- Interrupts ---
        ------------------
            -- Run Action List - Interrupts
                    if actionList_Interrupts() then return end
        ----------------------
        --- Start Rotation ---
        ----------------------
            -- Auto Attack
                    -- auto_attack
                    if getDistance(units.dyn5) < 5 then
                        StartAttack()
                    end
        ---------------------------------
        --- APL Mode: SimulationCraft ---
        ---------------------------------
                    if getOptionValue("APL Mode") == 1 then
                        if useCDs() then
            --  Invoke Xuen
                            -- invoke_xuen
                            if isChecked("Xuen") then
                                if cast.invokeXuen() then return end
                            end
            -- Legendary Ring
                            -- use_item,name=maalus_the_blood_drinker,if=buff.tigereye_brew_use.up|target.time_to_die<18
                            if isChecked("Legendary Ring") and (buff.tigereyeBrew or ttd<18) then
                                if hasEquiped(124636) and canUse(124636) then
                                    useItem(124636)
                                    return true
                                end
                            end
            -- Trinkets
                            if isChecked("Trinkets") and getDistance(units.dyn5) < 5 then
                                if canUse(13) then
                                    useItem(13)
                                end
                                if canUse(14) then
                                    useItem(14)
                                end
                            end
            -- Potion
                            -- potion,name=virmens_bite,if=buff.bloodlust.react|target.time_to_die<=60
                            if canUse(109217) and inRaid and isChecked("Agi-Pot") then
                                if hasBloodLust() or ttd <= 60 then
                                    useItem(109217)
                                end
                            end
            -- Touch of Death
                            -- touch_of_death,if=!artifact.gale_burst.enabled
                            -- touch_of_death,if=artifact.gale_burst.enabled&cooldown.strike_of_the_windlord.remains<8&cooldown.fists_of_fury.remains<=3&cooldown.rising_sun_kick.remains<8
                            if (not artifact.galeBurst or (artifact.galeBurst and cd.strikeOfTheWindlord < 8 and cd.fistsOfFury <= 3 and cd.risingSunKick < 8)) and ttd > 8 then
                                if cast.touchOfDeath() then return end
                            end
            -- Racial: Orc Blood Fury | Troll Berserking | Blood Elf Arcane Torrent
                            -- blood_fury
                            -- berserking
                            -- arcane_torrent,if=chi.max-chi>=1
                            if (bb.player.race == "Orc" or bb.player.race == "Troll") then
                                if castSpell("player",racial,false,false,false) then return end
                            end
                            if bb.player.race == "Blood Elf" and chi.diff>=1 then
                                if castSpell("player",racial,false,false,false) then return end
                            end
            -- Storm, Earth, and Fire
                            -- storm_earth_and_fire,if=artifact.strike_of_the_windlord.enabled&cooldown.strike_of_the_windlord.remains<14&cooldown.fists_of_fury.remains<=9&cooldown.rising_sun_kick.remains<=5
                            -- storm_earth_and_fire,if=!artifact.strike_of_the_windlord.enabled&cooldown.fists_of_fury.remains<=9&cooldown.rising_sun_kick.remains<=5
                            if useSEF() then
                                if (artifact.strikeOfTheWindlord and cd.strikeOfTheWindlord < 14 and cd.fistsOfFury <= 9 and cd.risingSunKick <= 5) 
                                    or (not artifact.strikeOfTheWindlord and cd.fistsOfFury <= 9 and cd.risingSunKick <=5)
                                then
                                    if cast.stormEarthAndFire() then return end
                                end
                                if #enemies.yards8 == 1 then
                                    if cast.stormEarthAndFireFixate() then return end
                                end
                            end
            -- Serenity
                            -- serenity,if=artifact.strike_of_the_windlord.enabled&cooldown.strike_of_the_windlord.remains<7&cooldown.fists_of_fury.remains<=3&cooldown.rising_sun_kick.remains<8
                            -- serenity,if=!artifact.strike_of_the_windlord.enabled&cooldown.fists_of_fury.remains<=3&cooldown.rising_sun_kick.remains<8
                            if (artifact.strikeOfTheWindlord and cd.strikeOfTheWindlord < 7 and cd.fistsOfFury <= 3 and cd.risingSunKick < 8)
                                or (not artifact.strikeOfTheWindlord and cd.fistsOfFury <= 3 and cd.risingSunKick < 8)
                            then
                                if cast.serenity() then return end
                            end
            -- Energizing Elixer
                            -- energizing_elixir,if=energy<energy.max&chi<=1&buff.serenity.down
                            if power < powerMax and chi.count <= 1 and not buff.serenity then
                                if cast.energizingElixir() then return end
                            end
                        end -- End Cooldown Check
            -- Rushing Jade Wind
                        -- rushing_jade_wind,if=buff.serenity.up&!prev_gcd.rushing_jade_wind
                        if buff.serenity and lastSpell ~= spell.rushingJadeWind then
                            if cast.rushingJadeWind() then return end
                        end
            -- Strike of the Windlord
                        -- strike_of_the_windlord
                        if cast.strikeOfTheWindlord() then return end
            -- Whirling Dragon Punch
                        -- whirling_dragon_punch
                        if cast.whirlingDragonPunch() then return end
            -- Fists of Fury
                        -- fists_of_fury
                        if cast.fistsOfFury() then return end
            -- Tiger Palm
                        if chi.count < 2 then
                            if cast.tigerPalm() then return end
                        end
            -- Call Action List - Single Target
                        -- call_action_list,name=st,if=active_enemies<3
                        if not useAoE() then
                            if actionList_SingleTarget() then return end
                        end
            -- Call Action List - Multi-Target
                        -- call_action_list,name=aoe,if=active_enemies>=3
                        if useAoE() then
                            if actionList_MultiTarget() then return end
                        end
                    end -- End Simulation Craft APL
        ----------------------------
        --- APL Mode: AskMrRobot ---
        ----------------------------
                    if getOptionValue("APL Mode") == 2 then
                        if useCDs() then
            -- Touch of Death
                            if cast.touchOfDeath() then return end
            -- Trinkets
                            if isChecked("Trinkets") and getDistance(units.dyn5) < 5 then
                                if canUse(13) then
                                    useItem(13)
                                end
                                if canUse(14) then
                                    useItem(14)
                                end
                            end
            -- Racial: Orc Blood Fury | Troll Berserking | Blood Elf Arcane Torrent
                            if (bb.player.race == "Orc" or bb.player.race == "Troll" or bb.player.race == "Blood Elf") then
                                if castSpell("player",racial,false,false,false) then return end
                            end
            -- Legendary Ring
                            if isChecked("Legendary Ring") then
                                if hasEquiped(124636) and canUse(124636) then
                                    useItem(124636)
                                    return true
                                end
                            end
            -- Potion
                            if canUse(109217) and inRaid and isChecked("Agi-Pot") then
                                if hasBloodLust() or ttd <= 60 then
                                    useItem(109217)
                                end
                            end
            --  Invoke Xuen
                            if isChecked("Xuen") then
                                if cast.invokeXuen() then return end
                            end
            -- Serenity
                            -- if CooldownSecRemaining(FistsOfFury) < 6 and CooldownSecRemaining(StrikeOfTheWindlord) < 5 and CooldownSecRemaining(WhirlingDragonPunch) < 5
                            if isChecked("Serenity") then
                                if cd.serenity < 6 and cd.strikeOfTheWindlord < 5 and cd.whirlingDragonPunch < 5 then
                                    if cast.serenity() then return end
                                end
                            end
            -- Energizing Elixir
                            -- if AlternatePower = 0 and Power < MaxPower and not HasBuff(Serenity)
                            if chi.count == 0 and power < powerMax and not buff.serenity then
                                if cast.energizingElixir() then return end
                            end
            -- Storm, Earth, and Fire
                            -- if not HasBuff(StormEarthAndFire) and CooldownSecRemaining(FistsOfFury) < 11 and CooldownSecRemaining(WhirlingDragonPunch) < 14 and CooldownSecRemaining(StrikeOfTheWindlord) < 14
                            if useSEF() then
                                if not buff.stormEarthAndFire and cd.fistsOfFury < 11 and cd.whirlingDragonPunch < 14 and cd.strikeOfTheWindlord < 14 then
                                    if cast.stormEarthAndFire() then return end
                                end
                            end
                        end -- End Cooldown Check
                        if useAoE() then
            -- Storm, Earth, and Fire
                            -- if not HasBuff(StormEarthAndFire) and CooldownSecRemaining(FistsOfFury) < 11 and CooldownSecRemaining(WhirlingDragonPunch) < 14 and CooldownSecRemaining(StrikeOfTheWindlord) < 14
                            if useSEF() then
                                if not buff.stormEarthAndFire and cd.fistsOfFury < 11 and cd.whirlingDragonPunch < 14 and cd.strikeOfTheWindlord < 14 then
                                    if cast.stormEarthAndFire() then return end
                                end
                            end
            -- Spinning Crane Kick
                            if cast.spinningCraneKick() then return end
                        end
            -- Fists of Fury
                        if cast.fistsOfFury() then return end
            -- Whirling Dragon Punch
                        if cast.whirlingDragonPunch() then return end
            -- Strike of the Windlord
                        if cast.strikeOfTheWindlord() then return end
            -- Tiger Palm
                        -- if not WasLastCast(TigerPalm) and AlternatePower < 4 and Power > (MaxPower*0.9)
                        if lastSpell ~= spell.tigerPalm and chi.count < 4 and power > (powerMax * 0.9) then
                            if cast.tigerPalm() then return end
                        end
            -- Rising Sun Kick
                        if cast.risingSunKick() then return end
            -- Rushing Jade Wind
                        -- if AlternatePower > 1 or HasBuff(Serenity)
                        if chi.count > 1 or buff.serenity then
                            if cast.rushingJadeWind() then return end
                        end
            -- Chi Burst
                        if cast.chiBurst() then return end
            -- Chi Wave
                        if cast.chiWave() then return end
            -- Blackout Kick
                        -- if not WasLastCast(BlackoutKick) and (HasBuff(ComboBreaker) or AlternatePower > 1 or HasBuff(Serenity))
                        if lastSpell ~= spell.blackoutKick and (buff.comboBreaker or chi.count > 1 or buff.serenity) then
                            if cast.blackoutKick() then return end
                        end
            -- Tiger Palm
                        -- if not WasLastCast(TigerPalm) or AlternatePower < 2
                        if lastSpell ~= spell.tigerPalm or chi.count < 2 then
                            if cast.tigerPalm() then return end
                        end
                    end -- End AskMrRobot APL  
                end -- End Combat Check
            end -- End Pause
        end -- End Timer
    end -- End runRotation
    tinsert(cWindwalker.rotations, {
        name = rotationName,
        toggles = createToggles,
        options = createOptions,
        run = runRotation,
    })
end -- End Class Check
