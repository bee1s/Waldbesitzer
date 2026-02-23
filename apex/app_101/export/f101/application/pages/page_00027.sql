prompt --application/pages/page_00027
begin
--   Manifest
--     PAGE: 00027
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
 p_id=>27
,p_name=>'HOLZWERBER_VIEW'
,p_alias=>'HOLZWERBER-VIEW'
,p_step_title=>'HOLZWERBER_VIEW'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18203572799706746)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22415006483078153)
,p_plug_name=>'HOLZWERBER RECHNUNG'
,p_region_name=>'cust_div'
,p_region_css_classes=>'u-shadow-lg cust_div'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>9
,p_plug_display_column=>2
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT ID ,',
'         RE_NUM ,',
'         HOLZWERBER_ID ,',
'         VORNAME ,',
'         NACHNAME ,',
'         PLZ ,',
'         ORT ,',
'         STRASSE ,',
'         NR ,',
'         RECHNUNGSDATUM ,',
'         RECHNUNGSJAHR ,',
'         ZAHLUNGSZIEL',
'    FROM V_RECHNUNGEN_KOPF',
'   WHERE RE_NUM = :P27_RECHNUNG_ID;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P27_RECHNUNG_ID'
,p_prn_page_header=>'HOLZWERBER_VIEW'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(22415151808078153)
,p_name=>'HOLZWERBER_VIEW'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ADM'
,p_internal_uid=>22415151808078153
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22415837136078153)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22417417852078154)
,p_db_column_name=>'VORNAME'
,p_display_order=>11
,p_column_identifier=>'E'
,p_column_label=>'Vorname'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22417054900078154)
,p_db_column_name=>'NACHNAME'
,p_display_order=>21
,p_column_identifier=>'D'
,p_column_label=>'Nachname'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22418280876078154)
,p_db_column_name=>'STRASSE'
,p_display_order=>41
,p_column_identifier=>'G'
,p_column_label=>'Strasse'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22443208168276843)
,p_db_column_name=>'RE_NUM'
,p_display_order=>51
,p_column_identifier=>'I'
,p_column_label=>'Re Num'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22443351538276844)
,p_db_column_name=>'HOLZWERBER_ID'
,p_display_order=>61
,p_column_identifier=>'J'
,p_column_label=>'Holzwerber ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22443465048276845)
,p_db_column_name=>'PLZ'
,p_display_order=>71
,p_column_identifier=>'K'
,p_column_label=>'Plz'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22443526630276846)
,p_db_column_name=>'ORT'
,p_display_order=>81
,p_column_identifier=>'L'
,p_column_label=>'Ort'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22443697633276847)
,p_db_column_name=>'NR'
,p_display_order=>91
,p_column_identifier=>'M'
,p_column_label=>'Nr'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22443734138276848)
,p_db_column_name=>'RECHNUNGSDATUM'
,p_display_order=>101
,p_column_identifier=>'N'
,p_column_label=>'Rechnungsdatum'
,p_column_type=>'DATE'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DD.MM.YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22443820940276849)
,p_db_column_name=>'RECHNUNGSJAHR'
,p_display_order=>111
,p_column_identifier=>'O'
,p_column_label=>'Rechnungsjahr'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22443903018276850)
,p_db_column_name=>'ZAHLUNGSZIEL'
,p_display_order=>121
,p_column_identifier=>'P'
,p_column_label=>'Zahlungsziel'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(22420636807115526)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'224207'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:HOLZWERBER_ID:NACHNAME:VORNAME:STRASSE:NR:ORT:PLZ:RE_NUM:RECHNUNGSDATUM:RECHNUNGSJAHR:ZAHLUNGSZIEL:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(20657421226025416)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(22415006483078153)
,p_button_name=>'Return'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Return'
,p_button_position=>'COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:25::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20657316850025415)
,p_name=>'P27_RECHNUNG_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(22415006483078153)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
