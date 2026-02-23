prompt --application/pages/page_00013
begin
--   Manifest
--     PAGE: 00013
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
 p_id=>13
,p_name=>'KASSENBUCH PDF'
,p_alias=>'KASSENBUCH-PDF'
,p_step_title=>'KASSENBUCH PDF'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(33608279908063615)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25412594390088007)
,p_plug_name=>'Selektion Buchungsjahr'
,p_region_css_classes=>'u-shadow-lg cust_div'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_column=>3
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25412694768088008)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(25412594390088007)
,p_button_name=>'PDF'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'<span> Erstellen </span>'
,p_button_position=>'EDIT'
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25412781047088009)
,p_name=>'P13_BUCHJAHR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25412594390088007)
,p_prompt=>'Buchjahr'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT DISTINCT TO_CHAR(VALUTADATUM, ''YYYY'') D, ',
'                  TO_CHAR(VALUTADATUM, ''YYYY'') R ',
'             FROM KONTOUMSAETZE',
'            WHERE TO_CHAR(VALUTADATUM, ''YYYY'') > (SELECT TO_CHAR(SYSDATE, ''YYYY'') -11 FROM DUAL) ',
'         ORDER BY TO_CHAR(VALUTADATUM, ''YYYY'') DESC;'))
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25412914245088011)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Kassenbuch Druck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_additional_parameters varchar2(32767);',
'begin',
'  xlib_jasperreports.set_report_url(''http://localhost:8888/jri/report'');',
'',
'--  Merge parameters in l_additional_parameters variable',
'  --l_additional_parameters := ''VONDAT='' || apex_util.url_encode(TO_CHAR(:P11_VONDAT, ''YYYY-MM-DD''));',
'  --l_additional_parameters := l_additional_parameters || ''&BISDAT='' || apex_util.url_encode(TO_CHAR(:P11_BISDAT, ''YYYY-MM-DD''));',
'  l_additional_parameters := ''BUCHJAHR='' || apex_util.url_encode(:P13_BUCHJAHR);',
'  --l_additional_parameters := l_additional_parameters || ''&BUCHUNGSJAHR='' || apex_util.url_encode(:P13_BUCHJAHR);',
'',
'',
'',
'  xlib_jasperreports.show_report (p_rep_name => ''kassenbuch'',',
'                                  p_rep_format => ''pdf'',',
'                                  p_data_source => ''default'',',
'                                  p_rep_locale => ''en-US'',',
'                                  p_out_filename => ''kassenbuch.PDF'',',
'                                  p_additional_params => l_additional_parameters);',
'  apex_application.g_unrecoverable_error := true;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25412914245088011
);
wwv_flow_imp.component_end;
end;
/
