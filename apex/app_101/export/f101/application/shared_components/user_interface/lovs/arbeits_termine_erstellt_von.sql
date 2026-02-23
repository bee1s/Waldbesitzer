prompt --application/shared_components/user_interface/lovs/arbeits_termine_erstellt_von
begin
--   Manifest
--     ARBEITS_TERMINE.ERSTELLT_VON
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
 p_id=>wwv_flow_imp.id(21006971437752880)
,p_lov_name=>'ARBEITS_TERMINE.ERSTELLT_VON'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'ARBEITS_TERMINE'
,p_return_column_name=>'ID'
,p_display_column_name=>'ERSTELLT_VON'
,p_default_sort_column_name=>'ERSTELLT_VON'
,p_default_sort_direction=>'ASC'
,p_version_scn=>33996243
);
wwv_flow_imp.component_end;
end;
/
