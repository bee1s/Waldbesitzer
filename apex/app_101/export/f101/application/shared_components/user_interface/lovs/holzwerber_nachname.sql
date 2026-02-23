prompt --application/shared_components/user_interface/lovs/holzwerber_nachname
begin
--   Manifest
--     HOLZWERBER.NACHNAME
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
 p_id=>wwv_flow_imp.id(19617464128385792)
,p_lov_name=>'HOLZWERBER.NACHNAME'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'HOLZWERBER'
,p_return_column_name=>'ID'
,p_display_column_name=>'NACHNAME'
,p_default_sort_column_name=>'NACHNAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>123047769
);
wwv_flow_imp.component_end;
end;
/
