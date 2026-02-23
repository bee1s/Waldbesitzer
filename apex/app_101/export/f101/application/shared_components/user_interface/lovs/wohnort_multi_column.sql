prompt --application/shared_components/user_interface/lovs/wohnort_multi_column
begin
--   Manifest
--     WOHNORT_MULTI_COLUMN
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
 p_id=>wwv_flow_imp.id(18417474922704386)
,p_lov_name=>'WOHNORT_MULTI_COLUMN'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'POSTLEITZAHLEN'
,p_return_column_name=>'ID'
,p_display_column_name=>'ORT'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'PLZ'
,p_default_sort_direction=>'ASC'
,p_version_scn=>7372179
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(18417747405704388)
,p_query_column_name=>'ID'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(18418209057704388)
,p_query_column_name=>'PLZ'
,p_heading=>'Plz'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(18418601294704388)
,p_query_column_name=>'ORT'
,p_heading=>'Ort'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(18418996902704388)
,p_query_column_name=>'ORTSTEIL'
,p_heading=>'Ortsteil'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
