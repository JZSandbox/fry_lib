local translation = {}

translation["de"] = {
    ["wheel"] = {
        front = 'Vorderrad',
        back = 'Rad hinten',
        wheel_f_l = "Rad vorne (L)",
        wheel_f_r = "Rad vorne (R)",
        wheel_b_l = "Rad hinten (L)",
        wheel_b_r = "Rad hinten (R)",
        wheel_m_l = "Rad Mitte (L)",
        wheel_m_r = "Rad Mitte (R)",
    },
    ["door"] = {
        door_f_l = "",
        door_f_r = "",
        door_b_l = "",
        door_b_r = "",
        hood = "",
        trunk = "",
    },
    ["window"] = {
        window_f_l = "",
        window_f_r = "",
        window_b_l = "",
        window_b_r = "",
        window_widescreen_f  = "",
        window_widescreen_b = "",
    },
}


translation.getTrasnlation = function ()
    return translation[Config.LANGUAGE]
end