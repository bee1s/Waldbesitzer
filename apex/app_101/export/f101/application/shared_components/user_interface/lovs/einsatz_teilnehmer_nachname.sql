prompt --application/shared_components/user_interface/lovs/einsatz_teilnehmer_nachname
begin
--   Manifest
--     EINSATZ_TEILNEHMER.NACHNAME
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
 p_id=>wwv_flow_imp.id(21005551921752874)
,p_lov_name=>'EINSATZ_TEILNEHMER.NACHNAME'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'EINSATZ_TEILNEHMER'
,p_return_column_name=>'ID'
,p_display_column_name=>'NACHNAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'NACHNAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>34005232
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(21030518503861785)
,p_query_column_name=>'ID'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(21030955297861786)
,p_query_column_name=>'NACHNAME'
,p_heading=>'Nachname'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(21031383614861786)
,p_query_column_name=>'VORNAME'
,p_heading=>'Vorname'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
