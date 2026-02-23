prompt --application/pages/page_00025
begin
--   Manifest
--     PAGE: 00025
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
 p_id=>25
,p_name=>'RECHNUNG_ZAHLUNG_CHECK'
,p_alias=>'RECHNUNG-ZAHLUNG-CHECK'
,p_step_title=>'RECHNUNG_ZAHLUNG_CHECK'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18203572799706746)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22409010749065290)
,p_plug_name=>'RECHNUNG_ZAHLUNG_CHECK'
,p_region_name=>'zahl_check'
,p_region_css_classes=>'u-shadow-lg cust_div'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    l_sql_query VARCHAR2(4000);',
'BEGIN',
'',
'    l_sql_query := ',
'    ''SELECT WERBER_ID, VORNAME, NACHNAME, RECHNUNG_ID, RECHNUNGSDATUM, TO_CHAR(RECHNUNGSDATUM, ''''YYYY'''') AS RECHNUNGSJAHR, ZAHLUNGSZIEL || '''' Tage'''' AS ZAHLUNGSZIEL, '' ||',
'    ''MAX_ZIELDATUM, ZAHLUNGSEINGANG, RECHNUNGSBETRAG, ZAHLUNGBETRAG,  FLOOR(ZAHLFRIST_DIFF) ZAHLFRIST_DIFF, '' ||',
'    ''ZAHLBETRAG_DIFF, TERMIN_STATUS , ZAHL_STATUS ''||',
'    ''FROM V_RECHNUNG_ZAHLUNG_CHECK '' ||',
'    ''WHERE INSTR('''':''''||NVL(:P25_TERMIN_STATUS, TERMIN_STATUS)||'''':'''', '''':''''||TERMIN_STATUS||'''':'''') > 0 '' ||',
'    ''AND   INSTR('''':''''||NVL(:P25_ZAHL_STATUS,   ZAHL_STATUS)  ||'''':'''', '''':''''||ZAHL_STATUS  ||'''':'''') > 0 '' ',
'    ;',
' ',
' IF :P25_REJAHR IS NOT NULL THEN',
'     l_sql_query := l_sql_query || '' AND TO_CHAR(RECHNUNGSDATUM, ''''YYYY'''') = :P25_REJAHR'';',
' ',
' ELSE NULL;',
' ',
' END IF;',
'',
'   RETURN l_sql_query;',
'',
'END;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P25_TERMIN_STATUS,P25_REJAHR,P25_ZAHL_STATUS'
,p_prn_page_header=>'RECHNUNG_ZAHLUNG_CHECK'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(22409124431065290)
,p_name=>'RECHNUNG_ZAHLUNG_CHECK'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ADM'
,p_internal_uid=>22409124431065290
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22409808442065295)
,p_db_column_name=>'WERBER_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Werber ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22410693101065296)
,p_db_column_name=>'RECHNUNG_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Rechnung ID'
,p_column_link=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.::P27_RECHNUNG_ID:#RECHNUNG_ID#'
,p_column_linktext=>'#RECHNUNG_ID#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22411009289065296)
,p_db_column_name=>'RECHNUNGSDATUM'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Rechnungsdatum'
,p_column_type=>'DATE'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DD.MM.YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22411875229065298)
,p_db_column_name=>'MAX_ZIELDATUM'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Max Zieldatum'
,p_column_type=>'DATE'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22412287734065300)
,p_db_column_name=>'ZAHLUNGSEINGANG'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Zahlungseingang'
,p_column_type=>'DATE'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22412625939065300)
,p_db_column_name=>'RECHNUNGSBETRAG'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Rechnungsbetrag'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22413083864065300)
,p_db_column_name=>'ZAHLUNGBETRAG'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Zahlungsbetrag'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22413896318065300)
,p_db_column_name=>'ZAHLBETRAG_DIFF'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Zahlbetrag Diff'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_static_id=>'zahl_diff'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22439873391276809)
,p_db_column_name=>'ZAHL_STATUS'
,p_display_order=>21
,p_column_identifier=>'L'
,p_column_label=>'Zahl Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22440722659276818)
,p_db_column_name=>'VORNAME'
,p_display_order=>31
,p_column_identifier=>'M'
,p_column_label=>'Vorname'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22440861533276819)
,p_db_column_name=>'NACHNAME'
,p_display_order=>41
,p_column_identifier=>'N'
,p_column_label=>'Nachname'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22440931837276820)
,p_db_column_name=>'RECHNUNGSJAHR'
,p_display_order=>51
,p_column_identifier=>'O'
,p_column_label=>'Rechnungsjahr'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22441525572276826)
,p_db_column_name=>'ZAHLUNGSZIEL'
,p_display_order=>61
,p_column_identifier=>'R'
,p_column_label=>'Zahlungsziel'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22441725119276828)
,p_db_column_name=>'TERMIN_STATUS'
,p_display_order=>81
,p_column_identifier=>'T'
,p_column_label=>'Termin Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25416276246088044)
,p_db_column_name=>'ZAHLFRIST_DIFF'
,p_display_order=>101
,p_column_identifier=>'W'
,p_column_label=>'Zahlfrist Diff'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(22420092590115210)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'224201'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RECHNUNG_ID:VORNAME:NACHNAME:RECHNUNGSJAHR:RECHNUNGSDATUM:ZAHLUNGSZIEL:MAX_ZIELDATUM:ZAHLUNGSEINGANG:ZAHLFRIST_DIFF:RECHNUNGSBETRAG:ZAHLUNGBETRAG:ZAHLBETRAG_DIFF:TERMIN_STATUS:ZAHL_STATUS:'
,p_sort_column_1=>'RECHNUNG_ID'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22439912873276810)
,p_plug_name=>'Filter'
,p_parent_plug_id=>wwv_flow_imp.id(22409010749065290)
,p_region_css_classes=>'c-filter-container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22442328632276834)
,p_plug_name=>'Terminstatus'
,p_parent_plug_id=>wwv_flow_imp.id(22439912873276810)
,p_region_css_classes=>'status_container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22442475691276835)
,p_plug_name=>'Zahlungsstatus'
,p_parent_plug_id=>wwv_flow_imp.id(22439912873276810)
,p_region_css_classes=>'status_container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22442510334276836)
,p_plug_name=>'Rechnungsjahr'
,p_parent_plug_id=>wwv_flow_imp.id(22439912873276810)
,p_region_css_classes=>'status_container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>2
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22440069890276811)
,p_name=>'P25_TERMIN_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(22442328632276834)
,p_prompt=>'Terminstatus:'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>unistr('SELECT ''F\00E4llige Forderungen (R\00FCckstand)'' D, ''R\00FCckstand'' R FROM DUAL')
,p_colspan=>7
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '4')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22441037226276821)
,p_name=>'P25_REJAHR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(22442510334276836)
,p_prompt=>'Rechnungsjahr:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT DISTINCT TO_CHAR(RECHNUNGSDATUM, ''YYYY'') D, TO_CHAR(RECHNUNGSDATUM, ''YYYY'') R FROM V_RECHNUNG_ZAHLUNG_CHECK'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'%'
,p_cHeight=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22441866305276829)
,p_name=>'P25_ZAHL_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(22442475691276835)
,p_prompt=>'Zahlungsstatus:'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'SELECT ''Offene Posten (Unterzahlung)'' D, ''Unterzahlung'' R FROM DUAL'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '4')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(22440333716276814)
,p_name=>'Refresh Reprt'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P25_TERMIN_STATUS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(22440419508276815)
,p_event_id=>wwv_flow_imp.id(22440333716276814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(22409010749065290)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(22441121362276822)
,p_name=>'Refresh 2 Report'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P25_REJAHR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(22441206381276823)
,p_event_id=>wwv_flow_imp.id(22441121362276822)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh 2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(22409010749065290)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(22442113286276832)
,p_name=>'Refresh_ Report'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P25_ZAHL_STATUS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(22442214773276833)
,p_event_id=>wwv_flow_imp.id(22442113286276832)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(22409010749065290)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(22442894665276839)
,p_name=>'Refresh Report'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P25_FINAL_STATUS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp.component_end;
end;
/
