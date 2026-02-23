prompt --application/shared_components/user_interface/lovs/einsatz_termine
begin
--   Manifest
--     EINSATZ_TERMINE
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
 p_id=>wwv_flow_imp.id(13938103778878170)
,p_lov_name=>'EINSATZ_TERMINE'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'ARBEITS_TERMINE'
,p_return_column_name=>'ID'
,p_display_column_name=>'TERMIN'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>59695000
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(13938499132878170)
,p_query_column_name=>'ID'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(13941719373898887)
,p_query_column_name=>'TERMIN'
,p_heading=>'Termin'
,p_display_sequence=>20
,p_data_type=>'DATE'
);
wwv_flow_imp.component_end;
end;
/
