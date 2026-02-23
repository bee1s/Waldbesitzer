prompt --application/shared_components/user_interface/lovs/arbeits_termine_id
begin
--   Manifest
--     ARBEITS_TERMINE.ID
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
 p_id=>wwv_flow_imp.id(13881927595344610)
,p_lov_name=>'ARBEITS_TERMINE.ID'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'ARBEITS_TERMINE'
,p_return_column_name=>'ID'
,p_display_column_name=>'TERMIN'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ID'
,p_default_sort_direction=>'DESC_NULLS_FIRST'
,p_version_scn=>59688260
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(13882243981344610)
,p_query_column_name=>'ID'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(13883842970350782)
,p_query_column_name=>'TERMIN'
,p_heading=>'Termin'
,p_display_sequence=>20
,p_data_type=>'DATE'
);
wwv_flow_imp.component_end;
end;
/
