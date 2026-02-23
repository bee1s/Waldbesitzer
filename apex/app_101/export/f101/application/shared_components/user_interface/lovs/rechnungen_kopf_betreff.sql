prompt --application/shared_components/user_interface/lovs/rechnungen_kopf_betreff
begin
--   Manifest
--     RECHNUNGEN_KOPF.BETREFF
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
 p_id=>wwv_flow_imp.id(22017661985059582)
,p_lov_name=>'RECHNUNGEN_KOPF.BETREFF'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'RECHNUNGEN_KOPF'
,p_return_column_name=>'ID'
,p_display_column_name=>'BETREFF'
,p_default_sort_column_name=>'BETREFF'
,p_default_sort_direction=>'ASC'
,p_version_scn=>137856583
);
wwv_flow_imp.component_end;
end;
/
