local interruptFrame = CreateFrame("Frame", nil, UIParent)
interruptFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
local function interruptEvent(self, event, ...)
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local timestamp, eventType, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, _, spellID, spellName, _, extraSkillID, extraSkillName = ...
        if eventType == "SPELL_INTERRUPT" and sourceName == UnitName("player") then
            SendChatMessage("我打断了 >> " .. GetSpellLink(extraSkillID), "SAY") --喊话
        end
    end
end
interruptFrame:SetScript("onEvent", interruptEvent)