prompt --application/pages/page_00020
begin
--   Manifest
--     PAGE: 00020
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
 p_id=>20
,p_name=>'ARBEITSSTUNDEN'
,p_alias=>'ARBEITSSTUNDEN1'
,p_step_title=>'ARBEITSSTUNDEN'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(33608173285062110)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function(){',
'  $("#P20_SUCHE").on("keyup", function() {',
'    var value = $(this).val().toLowerCase();',
'    $("#stunden-archiv tr").filter(function() {',
'      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)',
'    });',
'  });',
'});'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#stunden-archiv{',
'  padding-left: 60px;',
'  }',
'',
'#P20_SUCHE{',
'      max-width: 833px;',
'}',
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11091442022809548)
,p_plug_name=>'ARBEITSSTUNDEN ARCHIV'
,p_region_css_classes=>'u-shadow-lg cust_div'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_location=>null
,p_plug_column_width=>'text-align: center;'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11088876697809522)
,p_name=>'ARBEITSSTUNDEN ARCHIV'
,p_region_name=>'stunden-archiv'
,p_parent_plug_id=>wwv_flow_imp.id(11091442022809548)
,p_template=>2100526641005906379
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc:margin-left-lg'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_column=>1
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT AV.ID ,',
'         AV.ET_ID ,',
'         ET.NACHNAME ,',
'         ET.VORNAME ,',
'         AV.EINSATZ_TERMIN_ID ,',
'         AT.TERMIN ,',
' TO_CHAR(AT.TERMIN , ''YYYY_MM'') JAHR_MON ,         ',
'         AV.STUNDEN ,',
'         AV.ERSTELLT ARCHIVIERT_AM,',
'         AV.ERSTELLT_VON ARCHIVIERT_VON  ',
'    FROM ARBEITSSTUNDEN_ARCHIV AV LEFT OUTER JOIN EINSATZ_TEILNEHMER ET',
'      ON ET.ID=AV.ET_ID           LEFT OUTER JOIN ARBEITS_TERMINE AT',
'      ON AT.ID=AV.EINSATZ_TERMIN_ID',
'ORDER BY ID DESC;'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>100000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11091571457809549)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_column_heading=>'Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11091643361809550)
,p_query_column_id=>2
,p_column_alias=>'ET_ID'
,p_column_display_sequence=>20
,p_column_heading=>'Et Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14606453127233601)
,p_query_column_id=>3
,p_column_alias=>'NACHNAME'
,p_column_display_sequence=>30
,p_column_heading=>'Nachname'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14606580994233602)
,p_query_column_id=>4
,p_column_alias=>'VORNAME'
,p_column_display_sequence=>40
,p_column_heading=>'Vorname'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14606640784233603)
,p_query_column_id=>5
,p_column_alias=>'EINSATZ_TERMIN_ID'
,p_column_display_sequence=>50
,p_column_heading=>'Einsatz Termin Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14606799606233604)
,p_query_column_id=>6
,p_column_alias=>'TERMIN'
,p_column_display_sequence=>60
,p_column_heading=>'Termin'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20656981556025411)
,p_query_column_id=>7
,p_column_alias=>'JAHR_MON'
,p_column_display_sequence=>70
,p_column_heading=>'Jahr Mon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14606856556233605)
,p_query_column_id=>8
,p_column_alias=>'STUNDEN'
,p_column_display_sequence=>80
,p_column_heading=>'Stunden'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14606940480233606)
,p_query_column_id=>9
,p_column_alias=>'ARCHIVIERT_AM'
,p_column_display_sequence=>90
,p_column_heading=>'Archiviert Am'
,p_column_format=>'&APP_DATE_TIME_FORMAT.'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14607023293233607)
,p_query_column_id=>10
,p_column_alias=>'ARCHIVIERT_VON'
,p_column_display_sequence=>100
,p_column_heading=>'Archiviert Von'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21018517396752891)
,p_plug_name=>'ARBEITSSTUNDEN'
,p_region_css_classes=>'u-shadow-lg cust_div'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT APEX_ITEM.CHECKBOX(1, A.ID) SELECTED ,',
'         A.ID ,',
'         A.ET_ID ,',
'         ET.NACHNAME ,',
'         ET.VORNAME ,',
'         ET.VORNAME || '' '' || ET.NACHNAME EMPFAENGER ,',
'         A.SATZ_ID ,',
'         HS.STUNDENSATZ ,',
'         A.TERMIN_ID ,',
'         AT.TERMIN ,',
'         A.STUNDEN ,',
'         HS.STUNDENSATZ * A.STUNDEN ERSTATTUNG ,',
'         ET.IBAN IBAN ,',
'         ''Entgeld Waldgen. '' || TO_CHAR(AT.TERMIN, ''MM YYYY'') VERWENDUNG ,',
'         A.BEMERKUNG ,',
'         A.ERSTELLT ,',
'         A.ERSTELLT_VON ,',
'         A.GEAENDERT ,',
'         A.GEAENDERT_VON ',
'    FROM ARBEITSSTUNDEN A LEFT OUTER JOIN EINSATZ_TEILNEHMER ET',
'      ON ET.ID=A.ET_ID    LEFT OUTER JOIN ARBEITSSTUNDEN_SAETZE HS',
'      ON HS.ID=A.SATZ_ID  LEFT OUTER JOIN ARBEITS_TERMINE AT',
'      ON AT.ID=A.TERMIN_ID;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'ARBEITSSTUNDEN'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(21018686405752891)
,p_name=>'ARBEITSSTUNDEN'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_base_pk1=>'ID'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:21:&APP_SESSION.::&DEBUG.:RP:P21_ID:\#ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'ADM'
,p_internal_uid=>10215775998307262
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21019330282752896)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11088015874809514)
,p_db_column_name=>'SELECTED'
,p_display_order=>20
,p_column_identifier=>'V'
,p_column_label=>'<input type="checkbox" id="selectunselectall">'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18242273102892049)
,p_db_column_name=>'ET_ID'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Teilnehmer ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18242338932892050)
,p_db_column_name=>'SATZ_ID'
,p_display_order=>40
,p_column_identifier=>'L'
,p_column_label=>'Satz Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18242418466892051)
,p_db_column_name=>'TERMIN_ID'
,p_display_order=>50
,p_column_identifier=>'M'
,p_column_label=>'Termin Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18242513590892052)
,p_db_column_name=>'NACHNAME'
,p_display_order=>60
,p_column_identifier=>'N'
,p_column_label=>'Nachname'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18242648893892053)
,p_db_column_name=>'VORNAME'
,p_display_order=>70
,p_column_identifier=>'O'
,p_column_label=>'Vorname'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7441093513446437)
,p_db_column_name=>'EMPFAENGER'
,p_display_order=>80
,p_column_identifier=>'W'
,p_column_label=>unistr('Empf\00E4nger')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18242728739892054)
,p_db_column_name=>'STUNDENSATZ'
,p_display_order=>90
,p_column_identifier=>'P'
,p_column_label=>'Stundensatz'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18242815686892055)
,p_db_column_name=>'TERMIN'
,p_display_order=>100
,p_column_identifier=>'Q'
,p_column_label=>'Termin'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21020989734752896)
,p_db_column_name=>'STUNDEN'
,p_display_order=>110
,p_column_identifier=>'E'
,p_column_label=>'Stunden'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'ir_stunden_column'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18242912885892056)
,p_db_column_name=>'ERSTATTUNG'
,p_display_order=>120
,p_column_identifier=>'R'
,p_column_label=>'Erstattung'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FML999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21021377961752897)
,p_db_column_name=>'BEMERKUNG'
,p_display_order=>140
,p_column_identifier=>'F'
,p_column_label=>'Bemerkung'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21021802724752897)
,p_db_column_name=>'ERSTELLT'
,p_display_order=>150
,p_column_identifier=>'G'
,p_column_label=>'Erstellt'
,p_column_type=>'DATE'
,p_format_mask=>'&APP_DATE_TIME_FORMAT.'
,p_tz_dependent=>'N'
,p_static_id=>'ir_audit_column'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21022203677752897)
,p_db_column_name=>'ERSTELLT_VON'
,p_display_order=>160
,p_column_identifier=>'H'
,p_column_label=>'Erstellt Von'
,p_column_type=>'STRING'
,p_static_id=>'ir_audit_column'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21022539857752897)
,p_db_column_name=>'GEAENDERT'
,p_display_order=>170
,p_column_identifier=>'I'
,p_column_label=>'Geaendert'
,p_column_type=>'DATE'
,p_format_mask=>'&APP_DATE_TIME_FORMAT.'
,p_tz_dependent=>'N'
,p_static_id=>'ir_audit_column'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21022949075752897)
,p_db_column_name=>'GEAENDERT_VON'
,p_display_order=>180
,p_column_identifier=>'J'
,p_column_label=>'Geaendert Von'
,p_column_type=>'STRING'
,p_static_id=>'ir_audit_column'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18243162698892058)
,p_db_column_name=>'IBAN'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Iban'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18243278855892059)
,p_db_column_name=>'VERWENDUNG'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Verwendung'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(21024940669753529)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'102221'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'SELECTED:ET_ID:EMPFAENGER:TERMIN:STUNDEN:STUNDENSATZ:BEMERKUNG:ERSTATTUNG:IBAN:VERWENDUNG:ERSTELLT:ERSTELLT_VON:GEAENDERT:GEAENDERT_VON'
,p_sort_column_1=>'ET_ID'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'NACHNAME'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'TERMIN'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(13406744682394056)
,p_report_id=>wwv_flow_imp.id(21024940669753529)
,p_group_by_columns=>'NACHNAME:VORNAME:IBAN:VERWENDUNG'
,p_function_01=>'SUM'
,p_function_column_01=>'ERSTATTUNG'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Erstattung Aggr'
,p_function_format_mask_01=>'FML999G999G999G999G990D00'
,p_function_sum_01=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(21023493963752897)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(21018517396752891)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Neu'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:21:&APP_SESSION.::&DEBUG.:21::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7440929440446436)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(21018517396752891)
,p_button_name=>'CREATE_ARCHIV_DATA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Archivieren'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11088128600809515)
,p_name=>'P20_SUM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(21018517396752891)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_prompt=>'<span id="P20_SUM_LABEL">Summe: <span id="P20_SUM">0.00</span></span>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11088785865809521)
,p_name=>'P20_AUSGABE_TRENNER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(21018517396752891)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_prompt=>'/'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11091374285809547)
,p_name=>'P20_INSERT_COUNTER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(21018517396752891)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_prompt=>unistr('Archivierte Datens\00E4tze:')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20656838066025410)
,p_name=>'P20_SUCHE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11088876697809522)
,p_prompt=>'Suche'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(21023783971752899)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(21018517396752891)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21024257043752899)
,p_event_id=>wwv_flow_imp.id(21023783971752899)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(21018517396752891)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7440574516446432)
,p_name=>'DA Select Unselect Checkboxes'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#selectunselectall'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7440668049446433)
,p_event_id=>wwv_flow_imp.id(7440574516446432)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'SELECT'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($(''#selectunselectall'').prop(''checked'')) {',
'    $("input[type=checkbox][name=''f01'']").prop(''checked'', true);',
'} else {',
'    $("input[type=checkbox][name=''f01'']").prop(''checked'', false);',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11088282886809516)
,p_event_id=>wwv_flow_imp.id(7440574516446432)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'COMPUTE SUM ERSTATTUNG'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_SUM'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function calculateSum() {',
'    console.log("calculateSum() wurde aufgerufen.");',
'    let sum = 0;',
'    ',
'    // Gehe durch alle Checkboxen mit dem Namen ''f01''',
'    $("input[type=checkbox][name=''f01'']:checked").each(function() {',
'        console.log("Checkbox gefunden und aktiviert.");',
'        ',
unistr('        // Hole die n\00E4chste Zeile der Tabelle (tr) relativ zur Checkbox'),
'        let row = $(this).closest("tr");',
'        ',
'        if (row.length === 0) {',
'            console.log("Keine Tabellenzeile gefunden.");',
'            return;',
'        }',
'',
'        // Hole den Wert der Spalte ''ERSTATTUNG'' (entsprechende Spalte in der Zeile anpassen)',
'        let erstattung = row.find("td").eq(8).text().trim().replace(/[^0-9.,-]/g, ""); ',
'        ',
'        console.log("Erstattung Wert aus Zeile: ", erstattung);',
'        ',
unistr('        // Falls der Wert numerisch ist, zur Summe hinzuf\00FCgen'),
'        let amount = parseFloat(erstattung.replace('','', ''.''));',
'        if (!isNaN(amount)) {',
'            sum += amount;',
'        } else {',
unistr('            console.log("Kein g\00FCltiger Zahlenwert: ", erstattung);'),
'        }',
'    });',
'    ',
unistr('    console.log("Gesamtsumme der ausgew\00E4hlten Zeilen: ", sum.toFixed(2));'),
'    ',
'    // Setze das Ergebnis in das Span-Element P20_SUM',
'    $("#P20_SUM").text(sum.toFixed(2));',
'}',
'',
unistr('// Event-Listener f\00FCr Checkbox-Klick hinzuf\00FCgen'),
'$(document).on("click", "input[type=checkbox][name=''f01'']", function() {',
'    console.log("Checkbox wurde angeklickt.");',
'    calculateSum();',
'});',
'',
'// Auch das Select/Unselect-All Event mit der Berechnung verbinden',
'$(document).on("click", "#selectunselectall", function() {',
'    console.log("Select/Unselect-All wurde angeklickt.");',
'    if ($(this).prop(''checked'')) {',
'        $("input[type=checkbox][name=''f01'']").prop(''checked'', true);',
'    } else {',
'        $("input[type=checkbox][name=''f01'']").prop(''checked'', false);',
'    }',
'    calculateSum();',
'});',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11091115586809545)
,p_name=>'CLEAR P20_SUM'
,p_event_sequence=>30
,p_bind_type=>'live'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11091265161809546)
,p_event_id=>wwv_flow_imp.id(11091115586809545)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'CLEAR'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P20_SUM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7440869989446435)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Archivierung Arbeitsstunden'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    L_ERROR_COUNT INTEGER := 0;',
'    L_ET_ID       ARBEITSSTUNDEN_ARCHIV.ET_ID%TYPE;',
'    L_TERMIN_ID   ARBEITSSTUNDEN_ARCHIV.EINSATZ_TERMIN_ID%TYPE;',
'    L_STUNDEN     ARBEITSSTUNDEN_ARCHIV.STUNDEN%TYPE;',
'',
'    L_PREV_COUNTER PLS_INTEGER  := 0;',
'    L_LATER_COUNTER PLS_INTEGER := 0;',
'BEGIN',
'',
unistr('    --zur Z\00E4hlung der eingef\00FCgten Records, wird zun\00E4chst die Anzahl der Records vor dem Insert ermittelt.'),
'	SELECT COUNT(*) INTO L_PREV_COUNTER FROM ARBEITSSTUNDEN_ARCHIV;',
'',
'    FOR i IN 1..APEX_APPLICATION.G_F01.COUNT LOOP',
'        BEGIN',
'            SELECT ET_ID, TERMIN_ID, STUNDEN',
'            INTO   L_ET_ID, L_TERMIN_ID, L_STUNDEN',
'            FROM   ARBEITSSTUNDEN A',
'            WHERE  A.ID = APEX_APPLICATION.G_F01(i);',
'',
'            INSERT INTO ARBEITSSTUNDEN_ARCHIV (ET_ID, EINSATZ_TERMIN_ID, STUNDEN) ',
'                VALUES (L_ET_ID, L_TERMIN_ID, L_STUNDEN)',
'                ;',
'',
'        EXCEPTION',
'            WHEN OTHERS THEN',
'                L_ERROR_COUNT := L_ERROR_COUNT + 1;',
'        END;',
'        ',
'        BEGIN',
'            DELETE FROM ARBEITSSTUNDEN WHERE ID = APEX_APPLICATION.G_F01(i);',
'        END; ',
'    END LOOP;',
'',
unistr('    --zur Z\00E4hlung der eingef\00FCgten Records, wird nach dem Insert erneut die Anzahl der Records ermittelt.'),
'	SELECT COUNT(*) INTO L_LATER_COUNTER FROM ARBEITSSTUNDEN_ARCHIV;',
'',
unistr('    --Das Textfeld wird mit der Differenz (Anz. der gespeicherten Records) der beiden Z\00E4hlervariablen gef\00FCllt.'),
'	:P20_INSERT_COUNTER := L_LATER_COUNTER - L_PREV_COUNTER;',
'',
'    IF L_ERROR_COUNT > 0 THEN',
'        RAISE_APPLICATION_ERROR(-20001, ''Error occurred during update'');',
'    END IF;',
'   COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>7440869989446435
);
wwv_flow_imp.component_end;
end;
/
