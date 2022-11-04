SELECT * FROM band b 
INNER JOIN band_i18n bi ON b.id = bi.row_id
INNER join band_params bp ON b.id = bp.band_id
INNER JOIN param_names pn ON bp.prm_id = pn.id
INNER JOIN param_names_i18n pni ON pn.id = pni.row_id AND bi.`language` = pni.`language`
INNER JOIN param_values pv on bp.prm_value = pv.id
INNER JOIN param_values_i18n pvi ON pv.id = pvi.row_id AND bi.`language` = pvi.`language`