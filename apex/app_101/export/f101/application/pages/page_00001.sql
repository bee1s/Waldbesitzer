prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'WG'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(16413730559112766)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16421284748112810)
,p_plug_name=>'WG'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2674017834225413037
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25415024823088032)
,p_plug_name=>'Rechnungen Content'
,p_region_css_classes=>'u-shadow-lg cust_div'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>3
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_result clob := ''<p>Aktuelle Zeit: '' || to_char(sysdate, ''HH24:MI:SS'') || ''</p>'';',
'begin',
'  l_result := l_result || ''<h4>Details:</h4>'';',
'  l_result := l_result || ''<ul>'';',
'',
'  for rechng in (',
'                 SELECT * FROM ',
'               (',
'                  SELECT ''Rechnungen im Kalenderjahr:'' Status, COUNT(*) Anzahl',
'                    FROM V_RECHNUNG_ZAHLUNG_CHECK',
'                   WHERE TO_CHAR(RECHNUNGSDATUM, ''YYYY'') = TO_CHAR(SYSDATE, ''YYYY'')',
'                UNION',
'                  SELECT ''Offene Rechnungen:'' Status, COUNT(WERBER_ID) Anzahl',
'                    FROM V_RECHNUNG_ZAHLUNG_CHECK',
'                   WHERE UPPER(GESAMT_STATUS) = ''OFFEN''',
'                UNION',
'                  SELECT ''Offene Posten:'' Status, COUNT(WERBER_ID) Anzahl',
'                    FROM V_RECHNUNG_ZAHLUNG_CHECK',
unistr('                   WHERE UPPER(TERMIN_STATUS) = ''R\00DCCKSTAND'' AND UPPER(GESAMT_STATUS) = ''OFFEN'''),
'                UNION',
unistr('                  SELECT ''F\00E4llige Forderung:'' Status, COUNT(WERBER_ID) Anzahl'),
'                    FROM V_RECHNUNG_ZAHLUNG_CHECK',
'                   WHERE UPPER(ZAHL_STATUS) = ''UNTERZAHLUNG''',
'               )',
'  ) loop',
'',
'        case when apex_escape.html(rechng.Status) = ''Offene Posten:'' and apex_escape.html(rechng.Anzahl) > 0 ',
'             then     l_result := l_result || ''<li><strong>'' || apex_escape.html(rechng.Status) || ''</strong>&nbsp&nbsp''',
'                          || ''<span style = color:red;>'' || apex_escape.html(rechng.Anzahl) || ''</span>'' || ''</li>'';',
unistr('             when apex_escape.html(rechng.Status) = ''F\00E4llige Forderung:'' and apex_escape.html(rechng.Anzahl) > 0 '),
'             then     l_result := l_result || ''<li><strong>'' || apex_escape.html(rechng.Status) || ''</strong>&nbsp&nbsp''',
'                          || ''<span style = color:red;>'' || apex_escape.html(rechng.Anzahl) || ''</span>'' || ''</li>'';',
'        else ',
'            l_result := l_result || ''<li><strong>'' || apex_escape.html(rechng.Status) || ''</strong>&nbsp&nbsp''',
'                          || apex_escape.html(rechng.Anzahl) || ''</li>'';',
'        end case;',
'',
'  end loop;',
'',
'  l_result := l_result || ''</ul>'';',
'',
'  return l_result;',
'end;',
'    '))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25415447801088036)
,p_plug_name=>'Kassen Content'
,p_region_css_classes=>'u-shadow-lg cust_div'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_result clob := ''<p>Aktuelle Zeit: '' || to_char(sysdate, ''HH24:MI:SS'') || ''</p>'';',
'begin',
'  l_result := l_result || ''<h4>Details:</h4>'';',
'  l_result := l_result || ''<ul>'';',
'',
'  for buch in (',
'         SELECT * FROM',
'             (',
'               SELECT ''Buchungen im Kalenderjahr: '' STATUS, TO_CHAR(COUNT(ID)) ANZAHL, COUNT(ID) DUMMY',
'                 FROM KONTOUMSAETZE',
'                WHERE TO_CHAR(VALUTADATUM, ''yyyy'') = TO_CHAR(SYSDATE, ''yyyy'')',
'                UNION',
'               SELECT ''Einnahmen: '' STATUS, TO_CHAR(SUM(BETRAG), ''999G999D09'') ANZAHL, SUM(BETRAG) DUMMY ',
'                 FROM KONTOUMSAETZE',
'                WHERE TO_CHAR(VALUTADATUM, ''yyyy'') = TO_CHAR(SYSDATE, ''yyyy'')',
'                  AND BETRAG > 0',
'                UNION     ',
'               SELECT ''Ausgaben: '' STATUS, TO_CHAR(SUM(BETRAG), ''999G999D09'') ANZAHL, SUM(BETRAG) DUMMY  ',
'                 FROM KONTOUMSAETZE',
'                WHERE TO_CHAR(VALUTADATUM, ''yyyy'') = TO_CHAR(SYSDATE, ''yyyy'')',
'                  AND BETRAG < 0',
'                UNION',
'               SELECT ''Saldo:'' STATUS, TO_CHAR(SALDO, ''999G999D09'') ANZAHL, SALDO DUMMY',
'                 FROM(',
'                      SELECT ',
'                        SUM(CASE WHEN BETRAG > 0 THEN BETRAG ELSE 0 END) -',
'                        SUM(CASE WHEN BETRAG < 0 THEN ABS(BETRAG) ELSE 0 END) AS SALDO',
'                      FROM KONTOUMSAETZE',
'               WHERE TO_CHAR(VALUTADATUM, ''yyyy'') = TO_CHAR(SYSDATE, ''yyyy'') ',
'                     )',
'             )',
'  ) loop',
'    --Falls der SALDO negativ, ',
'    case when apex_escape.html(buch.Status) = ''Saldo:'' and apex_escape.html(buch.DUMMY) < 0',
'      then  l_result := l_result || ''<li><strong>'' || apex_escape.html(buch.Status) || ''</strong>&nbsp&nbsp''',
'                --dann den Wert rot formatieren',
'                || ''<span style = color:red;>'' || apex_escape.html(buch.Anzahl) || ''</span>'' || ''</li>'';',
'    else',
'            l_result := l_result || ''<li><strong>'' || apex_escape.html(buch.Status) || ''</strong>&nbsp&nbsp''',
'                    || apex_escape.html(buch.Anzahl) || ''</li>'';',
'    end case;',
'',
'  end loop;',
'',
'  l_result := l_result || ''</ul>'';',
'',
'  return l_result;',
'end;',
'    '))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41818243543182301)
,p_plug_name=>unistr('DB Gr\00F6sse')
,p_region_css_classes=>'u-shadow-lg cust_div'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_result clob := ''<p>Aktuelle Zeit: '' || to_char(sysdate, ''HH24:MI:SS'') || ''</p>'';',
'begin',
'  l_result := l_result || ''<h4>Details:</h4>'';',
'  l_result := l_result || ''<ul>'';',
'',
'  for space in (',
'         SELECT * FROM',
'             (',
'		      SELECT ''Kritische Gesamt- Groesse in MB: '' STATUS, 45 GROESSE, 45 DUMMY FROM DUAL',
'        UNION        ',
'              SELECT ''Tabellen- Groesse in MB: '' STATUS, ROUND(SUM(bytes)/1024/1024, 2) GROESSE, ROUND(SUM(bytes)/1024/1024, 2) DUMMY',
'                FROM USER_SEGMENTS',
'               WHERE UPPER(SEGMENT_TYPE) = ''TABLE''    ',
'            GROUP BY SEGMENT_TYPE',
'		UNION',
'		      SELECT ''Index- Groesse in MB: '' STATUS, ROUND(SUM(bytes)/1024/1024, 2) GROESSE, ROUND(SUM(bytes)/1024/1024, 2) DUMMY',
'                FROM USER_SEGMENTS',
'               WHERE UPPER(SEGMENT_TYPE) = ''INDEX''    ',
'            GROUP BY SEGMENT_TYPE',
'		UNION',
'		      SELECT ''Gesamt- Groesse in MB: '' STATUS, ROUND(SUM(bytes)/1024/1024, 2) GROESSE, ROUND(SUM(bytes)/1024/1024, 2) DUMMY  ',
'                FROM USER_SEGMENTS     ',
'             )',
'  ) loop',
'    --wenn die Groesse des Tablespace > 40',
'    case when apex_escape.html(space.Status) = ''Saldo:'' and apex_escape.html(space.DUMMY) > 40',
'      then  l_result := l_result || ''<li><strong>'' || apex_escape.html(space.Status) || ''</strong>&nbsp&nbsp''',
'                --dann den Wert rot formatieren',
'                || ''<span style = color:red;>'' || apex_escape.html(space.GROESSE) || ''</span>'' || ''</li>'';',
'    else',
'            l_result := l_result || ''<li><strong>'' || apex_escape.html(space.Status) || ''</strong>&nbsp&nbsp''',
'                    || apex_escape.html(space.GROESSE) || ''</li>'';',
'    end case;',
'',
'  end loop;',
'',
'  l_result := l_result || ''</ul>'';',
'',
'  return l_result;',
'end;',
'    '))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25415137534088033)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(25415024823088032)
,p_button_name=>'Refresh'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Auffrischen'
,p_button_position=>'COPY'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(25415764897088039)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(25415447801088036)
,p_button_name=>'Refresh_2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Auffrischen'
,p_button_position=>'COPY'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41818533932182304)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(41818243543182301)
,p_button_name=>'Refresh_3'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Auffrischen'
,p_button_position=>'COPY'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25415266429088034)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(25415137534088033)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25415649709088038)
,p_event_id=>wwv_flow_imp.id(25415266429088034)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(25415024823088032)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25416061914088042)
,p_name=>'Refresh'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(25415764897088039)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25416158074088043)
,p_event_id=>wwv_flow_imp.id(25416061914088042)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(25415447801088036)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41818632496182305)
,p_name=>'Refresh_3'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41818533932182304)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41818848954182307)
,p_event_id=>wwv_flow_imp.id(41818632496182305)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(41818243543182301)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
