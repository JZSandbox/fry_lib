FRYLIB.OX = {}


-- @param duration number The duration of the progress bar in milliseconds.
-- @param label string The label to display on the progress bar.
-- @param anim table (optional) The animation configuration table.
--   - dict: string The animation dictionary name.
--   - clip: string The animation clip name.
-- @param prop table (optional) The prop configuration table.
--   - model: string The model name of the prop.
--   - pos: vec3 The position of the prop.
--   - rot: vec3 The rotation of the prop.
FRYLIB.OX.PROGRESS = function(params)
    local type = params.type
    local duration = params.duration
    local label = params.label
    local dead = params.dead
    local cancel = params.cancel
    local cb_success = params.cb_success
    local cb_failed = params.cb_failed
    local anim = params.anim
    local prop = params.prop

    if type == 'bar' then

        local progressConfig = {
            duration = duration,
            label = label,
            useWhileDead = dead,
            canCancel = cancel,
            anim = anim,
            prop = prop,
        }

        if lib.progressBar(progressConfig) then cb_success() else cb_failed() end
        DEBUG.CREATEMESSAGE('PROGRESS BAR ACTIVE', 'OX')
    end

    if type == 'circle' then
        local progressConfig = {
            duration = duration,
            label = label,
            useWhileDead = dead,
            canCancel = cancel,
            anim = anim,
            prop = prop,
        }

        if lib.progressCircle(progressConfig) then cb_success() else cb_failed() end
        DEBUG.CREATEMESSAGE('CRICLE PROGRESS ACTIVE', 'OX')
    end
end

--- Show or hide the text UI.
-- - @params text: string (optional) The text to display in the UI.
-- - @params show: boolean Determines whether to show or hide the UI.
FRYLIB.OX.SHOWTEXTUI = function(text, show)
    if not show then
        lib.hideTextUI()
        DEBUG.CREATEMESSAGE('HIDE TEXT UI', 'OX')
        return
    end
    
    if text ~= nil and show then
        lib.showTextUI(text)
        DEBUG.CREATEMESSAGE('SHOW TEXT UI', 'OX')
    end
end