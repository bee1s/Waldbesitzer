prompt --application/shared_components/user_interface/lovs/werbeart
begin
--   Manifest
--     WERBEART
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
 p_id=>wwv_flow_imp.id(18016165894247566)
,p_lov_name=>'WERBEART'
,p_lov_query=>'.'||wwv_flow_imp.id(18016165894247566)||'.'
,p_location=>'STATIC'
,p_version_scn=>119915288
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(18016486247247577)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Selbstwerbung'
,p_lov_return_value=>'Selbstwerbung'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(18016851993247579)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Polter'
,p_lov_return_value=>'Polter'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(19007947612134356)
,p_lov_disp_sequence=>99
,p_lov_disp_value=>'Pauschale'
,p_lov_return_value=>'Pauschale'
);
wwv_flow_imp.component_end;
end;
/
