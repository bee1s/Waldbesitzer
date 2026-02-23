prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
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
 p_id=>11
,p_name=>'RECHNUNG PDF'
,p_alias=>'HOLZ-RECHNUNGEN'
,p_step_title=>'HOLZ_RECHNUNGEN'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18203572799706746)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13891468380418739)
,p_plug_name=>'RECHNUNG'
,p_title=>'RECHNUNGSBEREICH FESTLEGEN'
,p_region_name=>'re_export_div'
,p_region_css_classes=>'u-shadow-lg cust_div'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_column=>4
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(25412153730088003)
,p_name=>'NUMMERNBEREICH NACH KALENDERJAHR'
,p_region_name=>'renum_report'
,p_parent_plug_id=>wwv_flow_imp.id(13891468380418739)
,p_template=>4501440665235496320
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_display_column=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT MIN(ID) KLEINSTE_RE_NR,',
unistr('         MAX(ID) GR\00D6SSTE_RE_NR,'),
' TO_CHAR(RECHNUNGSDATUM, ''YYYY'') RECHNUNGSJAHR',
'    FROM RECHNUNGEN_KOPF',
'GROUP BY TO_CHAR(RECHNUNGSDATUM, ''YYYY'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25412207840088004)
,p_query_column_id=>1
,p_column_alias=>'KLEINSTE_RE_NR'
,p_column_display_sequence=>10
,p_column_heading=>'Kleinste Re Nr'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25412397886088005)
,p_query_column_id=>2
,p_column_alias=>unistr('GR\00D6SSTE_RE_NR')
,p_column_display_sequence=>20
,p_column_heading=>unistr('Gr\00F6sste Re Nr')
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25412464264088006)
,p_query_column_id=>3
,p_column_alias=>'RECHNUNGSJAHR'
,p_column_display_sequence=>30
,p_column_heading=>'Rechnungsjahr'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13891359928418738)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(13891468380418739)
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
 p_id=>wwv_flow_imp.id(13891167924418736)
,p_name=>'P11_VONNUM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(13891468380418739)
,p_prompt=>'Von RE_Num'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_grid_column=>2
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13891249055418737)
,p_name=>'P11_BISNUM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(13891468380418739)
,p_prompt=>'Bis RE_Num'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13891512056418740)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Rechnung Druck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_additional_parameters varchar2(32767);',
'begin',
'  xlib_jasperreports.set_report_url(''http://localhost:8888/jri/report'');',
'',
'--  Merge parameters in l_additional_parameters variable',
'  --l_additional_parameters := ''VONDAT='' || apex_util.url_encode(TO_CHAR(:P11_VONDAT, ''YYYY-MM-DD''));',
'  --l_additional_parameters := l_additional_parameters || ''&BISDAT='' || apex_util.url_encode(TO_CHAR(:P11_BISDAT, ''YYYY-MM-DD''));',
'  l_additional_parameters := ''VONRENUM='' || apex_util.url_encode(:P11_VONNUM);',
'  l_additional_parameters := l_additional_parameters || ''&BISRENUM='' || apex_util.url_encode(:P11_BISNUM);',
'',
'',
'',
'  xlib_jasperreports.show_report (p_rep_name => ''holzrechnung'',',
'                                  p_rep_format => ''pdf'',',
'                                  p_data_source => ''default'',',
'                                  p_rep_locale => ''en-US'',',
'                                  p_out_filename => ''holzrechnung.PDF'',',
'                                  p_additional_params => l_additional_parameters);',
'  apex_application.g_unrecoverable_error := true;',
'',
'end;',
'',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>13891512056418740
);
wwv_flow_imp.component_end;
end;
/
