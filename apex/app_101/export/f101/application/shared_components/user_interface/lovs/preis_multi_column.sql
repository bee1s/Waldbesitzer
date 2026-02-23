prompt --application/shared_components/user_interface/lovs/preis_multi_column
begin
--   Manifest
--     PREIS_MULTI_COLUMN
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>5200439075611598
,p_default_application_id=>101
,p_default_id_offset=>10802910407445629
,p_default_owner=>'WG'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(19028057650615885)
,p_lov_name=>'PREIS_MULTI_COLUMN'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT ID ,',
'         GELTUNG_VON ,',
'         GELTUNG_BIS ,',
'         ERWERBART ,',
'         FM_MIN ,',
'         FM_MAX ',
'    FROM HOLZERWERB_PREISE;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ID'
,p_display_column_name=>'ID'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>139879877
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(19033454856651091)
,p_query_column_name=>'ID'
,p_heading=>'ID'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(19031465845651089)
,p_query_column_name=>'ERWERBART'
,p_heading=>'Erwerbart'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(19031838034651089)
,p_query_column_name=>'GELTUNG_VON'
,p_heading=>'Geltung Von'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(19032211966651089)
,p_query_column_name=>'GELTUNG_BIS'
,p_heading=>'Geltung Bis'
,p_display_sequence=>40
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(19032642680651089)
,p_query_column_name=>'FM_MIN'
,p_heading=>'Fm Min'
,p_display_sequence=>50
,p_format_mask=>'999G999G999G999G990D0'
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(19033103755651089)
,p_query_column_name=>'FM_MAX'
,p_heading=>'Fm Max'
,p_display_sequence=>60
,p_format_mask=>'999G999G999G999G990D0'
,p_data_type=>'NUMBER'
);
wwv_flow_imp.component_end;
end;
/
