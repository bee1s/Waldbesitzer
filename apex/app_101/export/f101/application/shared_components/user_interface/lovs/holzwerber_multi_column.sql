prompt --application/shared_components/user_interface/lovs/holzwerber_multi_column
begin
--   Manifest
--     HOLZWERBER_MULTI_COLUMN
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
 p_id=>wwv_flow_imp.id(19042216031711589)
,p_lov_name=>'HOLZWERBER_MULTI_COLUMN'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT ID ,',
'         ANREDE_ID ,',
'         TITEL_ID ,',
'         NACHNAME ,',
'         VORNAME',
'    FROM HOLZWERBER;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ID'
,p_display_column_name=>'ID'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>12569513
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(19042659797713175)
,p_query_column_name=>'ID'
,p_heading=>'ID'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(19043860425713175)
,p_query_column_name=>'NACHNAME'
,p_heading=>'Nachname'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(19044301777713175)
,p_query_column_name=>'VORNAME'
,p_heading=>'Vorname'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
