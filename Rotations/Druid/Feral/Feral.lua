function DruidFeral()
    if GetSpecializationInfo(GetSpecialization()) == 103 then
        if bb.player == nil or bb.player.profile ~= "Feral" then
            bb.player = cFeral:new("Feral")
            setmetatable(bb.player, {__index = cFeral})

            bb.player:createOptions()
            bb.player:createToggles()
            bb.player:update()
        end

        bb.player:update()
    end
end
