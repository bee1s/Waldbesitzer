prompt --application/shared_components/user_interface/lovs/arbeitsstunden_saetze_id
begin
--   Manifest
--     ARBEITSSTUNDEN_SAETZE.ID
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
 p_id=>wwv_flow_imp.id(21006220968752879)
,p_lov_name=>'ARBEITSSTUNDEN_SAETZE.ID'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'ARBEITSSTUNDEN_SAETZE'
,p_return_column_name=>'ID'
,p_display_column_name=>'STUNDENSATZ'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'ID'
,p_default_sort_direction=>'DESC_NULLS_FIRST'
,p_version_scn=>34019028
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(21040356236930841)
,p_query_column_name=>'ID'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(21040709260930841)
,p_query_column_name=>'GUELTIG_AB'
,p_heading=>'Gueltig Ab'
,p_display_sequence=>20
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(21041092227930841)
,p_query_column_name=>'STUNDENSATZ'
,p_heading=>unistr('Stundensatz (\20AC)')
,p_display_sequence=>30
,p_data_type=>'NUMBER'
);
wwv_flow_imp.component_end;
end;
/
