prompt --application/pages/page_00112
begin
--   Manifest
--     PAGE: 00112
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>5200439075611598
,p_default_application_id=>101
,p_default_id_offset=>10802910407445629
,p_default_owner=>'WG'
);
wwv_flow_imp_page.create_page(
 p_id=>112
,p_name=>'HOLZVERMARKTUNG'
,p_alias=>'HOLZVERMARKTUNG'
,p_step_title=>'HOLZVERMARKTUNG'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18203572799706746)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp.component_end;
end;
/
