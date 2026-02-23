prompt --application/shared_components/user_interface/lovs/titel
begin
--   Manifest
--     TITEL
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
 p_id=>wwv_flow_imp.id(18405757094547230)
,p_lov_name=>'TITEL'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT TITEL D,',
'         ID R',
'    FROM TITEL;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>7357234
);
wwv_flow_imp.component_end;
end;
/
