-----------------------
-- Command Interface --
-----------------------

SLASH_HUNTERSWISSKNIFE1 = "/hsk";
SLASH_HUNTERSWISSKNIFE2 = "/hunterswissknife";

function HSK_OnCmd(argument)
    HSK_UI_MainMenu_OnShow();
end


---------------------------
-- Event-based functions --
---------------------------

function HSK_OnLoad()
    HSK_Module_AspectsAntiDaze_OnLoad(this);
    HSK_Module_AimedShotCastbar_OnLoad(this);
    HSK_Module_AutoShotCastbar_OnLoad(this);

    SlashCmdList["HUNTERSWISSKNIFE"] = HSK_OnCmd;

    HSK_Core_PrintToChat(HSK_MESSAGE_ADDONLOADED);
end


function HSK_OnUpdate()
    if HSK_Settings.AimedShotCastbar.Enabled then
        HSK_Module_AimedShotCastbar_OnUpdate();
    end
    if HSK_Settings.AutoShotCastbar.Enabled then
        HSK_Module_AutoShotCastbar_OnUpdate();
    end
end


function HSK_OnEvent()
    if HSK_Settings.AspectsAntiDaze.Enabled and HSK_Module_AspectsAntiDaze_OnEvent[event] then
        HSK_Module_AspectsAntiDaze_OnEvent[event](arg1);
    end
    if HSK_Settings.AimedShotCastbar.Enabled and HSK_Module_AimedShotCastbar_OnEvent[event] then
        HSK_Module_AimedShotCastbar_OnEvent[event]();
    end
    if HSK_Settings.AutoShotCastbar.Enabled and HSK_Module_AutoShotCastbar_OnEvent[event] then
        HSK_Module_AutoShotCastbar_OnEvent[event]();
    end
end




