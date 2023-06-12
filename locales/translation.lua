TRANSLATION = {}

TRANSLATION["de"] = {
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
        door_f_l = "Tür vorne (L)",
        door_f_r = "Tür vorne (R)",
        door_b_l = "Tür hinten (L)",
        door_b_r = "Tür hinten (R)",
        hood = "Motorhaube",
        trunk = "Kofferraum",
    },
    ["window"] = {
        window_f_l = "Fenster vorne (L)",
        window_f_r = "Fenster vorne (R)",
        window_b_l = "Fenster hinten (L)",
        window_b_r = "Fenster hinten (R)",
        window_widescreen_f  = "Windschutzscheibe (V)",
        window_widescreen_b = "Windschutzscheibe (H)",
    },
}


TRANSLATION.getTrasnlation = function ()
    return TRANSLATION[Config.LANGUAGE]
end