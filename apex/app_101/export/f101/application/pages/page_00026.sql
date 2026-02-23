prompt --application/pages/page_00026
begin
--   Manifest
--     PAGE: 00026
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
 p_id=>26
,p_name=>'UMSATZ BEARBEITEN'
,p_alias=>'UMSATZ-BEARBEITEN'
,p_step_title=>'UMSATZ BEARBEITEN'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(33608279908063615)
,p_javascript_file_urls=>'#APP_FILES#main_cust#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30047526429782923)
,p_plug_name=>'UMSAETZE BEARBEITEN'
,p_region_name=>'report_betrag_region'
,p_region_css_classes=>'u-shadow-lg cust_div'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ID ,',
'         BUCHUNGSTAG ,',
'         VALUTADATUM ,',
'         TO_CHAR(VALUTADATUM, ''YYYY'') JAHR,',
'         NAME_ZAHLUNGSBETEILIGTER ,',
'         IBAN_ZAHLUNGSBETEILIGTER ,',
'         BUCHUNGSTEXT ,',
'         VERWENDUNGSZWECK ,',
'         BETRAG ,',
'         WAEHRUNG ,',
'         SALDO_NACH_BUCHUNG ,',
'COALESCE(BEMERKUNG, ''?'') BEMERKUNG ,',
'         KATEGORIE ,',
'         STEUERRELEVANT ',
'    FROM KONTOUMSAETZE',
'   WHERE TO_CHAR(VALUTADATUM, ''YYYY'') = :P26_VORGANGSJAHR',
'ORDER BY VALUTADATUM DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P26_VORGANGSJAHR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(25413589237088017)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ADM'
,p_internal_uid=>25413589237088017
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25413652520088018)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_link=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.::P28_ID:#ID#'
,p_column_linktext=>'#ID#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25413764772088019)
,p_db_column_name=>'BUCHUNGSTAG'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Buchungstag'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25413849537088020)
,p_db_column_name=>'VALUTADATUM'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valutadatum'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25413980310088021)
,p_db_column_name=>'JAHR'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Jahr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25414083683088022)
,p_db_column_name=>'NAME_ZAHLUNGSBETEILIGTER'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Name Zahlungsbeteiligter'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25414115693088023)
,p_db_column_name=>'IBAN_ZAHLUNGSBETEILIGTER'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Iban Zahlungsbeteiligter'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25414701801088029)
,p_db_column_name=>'BEMERKUNG'
,p_display_order=>80
,p_column_identifier=>'L'
,p_column_label=>'Bemerkung'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25414226778088024)
,p_db_column_name=>'BUCHUNGSTEXT'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'Buchungstext'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25414367967088025)
,p_db_column_name=>'VERWENDUNGSZWECK'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>'Verwendungszweck'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25414438929088026)
,p_db_column_name=>'BETRAG'
,p_display_order=>110
,p_column_identifier=>'I'
,p_column_label=>'Betrag'
,p_column_html_expression=>'<span class="betrag_column">#BETRAG#</span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25414529434088027)
,p_db_column_name=>'WAEHRUNG'
,p_display_order=>120
,p_column_identifier=>'J'
,p_column_label=>'Waehrung'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25414659594088028)
,p_db_column_name=>'SALDO_NACH_BUCHUNG'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>'Saldo Nach Buchung'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25414845529088030)
,p_db_column_name=>'KATEGORIE'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Kategorie'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25414943897088031)
,p_db_column_name=>'STEUERRELEVANT'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Steuerrelevant'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(30080816209107682)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'300809'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ID:VALUTADATUM:JAHR:NAME_ZAHLUNGSBETEILIGTER:BEMERKUNG:IBAN_ZAHLUNGSBETEILIGTER:BUCHUNGSTEXT:VERWENDUNGSZWECK:BETRAG:SALDO_NACH_BUCHUNG:WAEHRUNG:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25413404138088016)
,p_plug_name=>'Valutajahr'
,p_parent_plug_id=>wwv_flow_imp.id(30047526429782923)
,p_region_css_classes=>'status_container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>3
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(30053291516782926)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(30047526429782923)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:28:&APP_SESSION.::&DEBUG.:28::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25413020426088012)
,p_name=>'P26_VORGANGSJAHR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25413404138088016)
,p_item_default=>'SELECT TO_CHAR(SYSDATE, ''YYYY'') FROM DUAL'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Vorgangsjahr'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT TO_CHAR(VALUTADATUM, ''YYYY'') D, ',
'                TO_CHAR(VALUTADATUM, ''YYYY'') R ',
'           FROM KONTOUMSAETZE'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'%'
,p_cHeight=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25416300036088045)
,p_name=>'Refresh_Report'
,p_event_sequence=>5
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(30047526429782923)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25416465923088046)
,p_event_id=>wwv_flow_imp.id(25416300036088045)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Report_Refresh'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'setcolor_in_report();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(30053584395782926)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(30047526429782923)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(30054060201782928)
,p_event_id=>wwv_flow_imp.id(30053584395782926)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(30047526429782923)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25413222494088014)
,p_name=>'Refresh Report'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P26_VORGANGSJAHR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25413335457088015)
,p_event_id=>wwv_flow_imp.id(25413222494088014)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(30047526429782923)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25416506268088047)
,p_name=>'Refresh_Report_On_PageLoad'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25416643705088048)
,p_event_id=>wwv_flow_imp.id(25416506268088047)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setcolor_in_report();',
''))
);
wwv_flow_imp.component_end;
end;
/
