create or replace PACKAGE      "XLIB_HTTP"
AS
/*=========================================================================

  Purpose  : Make http callouts

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14

 Version Date        Author           Comment
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         19.02.2007  D. Aust          initial creation
         07.08.2008  D. Aust          - added check_get_request
                                      - display_url_raw: pass all request headers
                                          to the client
         05.08.2012  D. Aust		      suppress mime header TRANSFER-ENCODING,
                                        causes lots of problems with XMLDB listener
                                        and others choking.
 2.3.0.0 19.05.2014  D. Aust          - #294 - Fix chunked encoding problem in
                                          xlib_http.get_report
                                      - added version information to this package
 2.3.0.0 09.05.2015  D. Aust          pass JSESSIONID from backend J2EE server to client
                                        for image rendering in html reports
 2.6.1   28.09.2020  D. Aust          #40 - APEX 20.1 security bundle (PSE 30990551)
                                        rejects response header "Cache-Control: private"
 2.6.2   13.10.2020  D. Aust          - added function check_acl()
 2.8.0   08.02.2022  D. Aust          #79: XLIB_HTTP http_version
                                        - added optional parameter for http version
 2.10.1  16.01.2023  D. Aust          #123: Backport constant for Oracle 11
 2.11.0  25.01.2023  D. Aust          - Tested and fixed on Oracle11g - %Type works on variables-not constants

=========================================================================*/

   c_success   CONSTANT CHAR (1) := '1';
   c_fail      CONSTANT CHAR (1) := '0';

  -- version of this package
  version_c constant varchar2(20 char) := '2.10.1';
  HTTP_VERSION_1_1 VARCHAR2(64) := 'HTTP/1.1'; -- #123

  TYPE vc_arr_t IS TABLE OF VARCHAR2 (32767) INDEX BY BINARY_INTEGER;
  g_empty_vc_arr vc_arr_t;

/* Function: display_url_raw
 *
 * Parameters:
 *
 *    x - Description of x.
 *    y - Description of y.
 *    z - Description of z.
 */
   PROCEDURE display_url_raw (
      p_url                       VARCHAR2,
      p_mime_type_override   IN   VARCHAR2 DEFAULT NULL,
      p_charset              IN   VARCHAR2 DEFAULT NULL,
      p_header_name_arr      IN   vc_arr_t default g_empty_vc_arr,
      p_header_value_arr     IN   vc_arr_t default g_empty_vc_arr,
      p_http_version         IN   xlib_http.http_version_1_1%type default xlib_http.http_version_1_1
   );

/* Procedure: retrieve_blob_from_url

   Multiplies two integers.

   Parameters:

      p_url - url to be called

      o_blob - output: the resulting out blob
      o_mime_type - output: the resulting out mime type from the call

   Returns:

      The two integers multiplied together.
      o_blob - the resulting out blob

   See Also:

      <escape_form_data>
*/
   PROCEDURE retrieve_blob_from_url (
      p_url             IN   VARCHAR2,
      o_blob            OUT  BLOB,
      o_mime_type       OUT  VARCHAR2,
      p_http_version    IN   xlib_http.http_version_1_1%type default xlib_http.http_version_1_1
   );

/*
Function: escape_form_data
Here is some describing text ...

--- SQL
declare
  l_i number;
begin
  null;

  Select count(*)
    into l_count
    from dual;
end;
---


Parameters:
  s - string to be escaped

Returns:
the escaped data
*/
   FUNCTION escape_form_data (s VARCHAR2)
      RETURN VARCHAR2;

/*
Function: check_get_request

Parameters:
   p_url    the url to be called

Returns:
   Returns c_fail or c_success

*/
   FUNCTION check_get_request (p_url VARCHAR2)
      RETURN CHAR;

/*
Function: check_acl

Parameters:
   p_url    the url to be called

Returns:
   Returns c_fail or c_success
*/
   FUNCTION check_acl (p_url VARCHAR2)
      RETURN CHAR;
END;
/
create or replace PACKAGE "XLIB_JASPERREPORTS"
AS
/*=========================================================================
  Purpose  :

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14

  $LastChangedDate: 2018-09-30 09:00:44 +0200 (So, 30 Sep 2018) $
  $LastChangedBy: dietmar.aust $

  Version  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           06.01.2010  D. Aust   Initial creation
           06.05.2011  D. Aust   added constants for xlsx and docx
           05.08.2012  D. Aust   added version 2.0.0 features:
                                 - direct printing
                                 - save file on server
           11.05.2013  D. Aust   added support for tunneling images for html
                                   exports only
  2.3.0.0  19.05.2014  D. Aust   - #294 - Fix chunked encoding problem in
                                     xlib_http.get_report
                                 - added version information to this package
  2.4.0.0  15.10.2017  D. Aust   FEATURE: #3941 - Support for timeZones
                                 (report parameter REPORT_TIME_ZONE)
  2.5.0.0  29.09.2018  D. Aust   FEATURE: #9 - Ability to set Printjob name (programmatically)
  2.5.0.1  30.09.2018  D. Aust     fix bool2string issue
  2.6.1    01.10.2020  D. Aust   add get_default_configuration() and set_default_configuration()
  2.6.2    13.10.2020  D. Aust   #54 - Timeout value from default table not working
  2.8.0    08.02.2022  D. Aust   #79: XLIB_HTTP http_version
                                   - added optional parameter for http version
 2.10.1  16.01.2023  D. Aust          #123: Backport constant for Oracle 11
=========================================================================*/

  -- version of this package
  version_c constant varchar2(20 char) := '2.10.1';

   -- constants
   -- supported formats
   c_rep_format_pdf    CONSTANT VARCHAR2 (20) := 'pdf';
   c_rep_format_rtf    CONSTANT VARCHAR2 (20) := 'rtf';
   c_rep_format_xls    CONSTANT VARCHAR2 (20) := 'xls';
   c_rep_format_html   constant varchar2 (20) := 'html';
   c_rep_format_html2   CONSTANT VARCHAR2 (20) := 'html2';
   c_rep_format_csv    CONSTANT VARCHAR2 (20) := 'csv';
   c_rep_format_docx    CONSTANT VARCHAR2 (20) := 'docx';
   c_rep_format_pptx    CONSTANT VARCHAR2 (20) := 'pptx';
   c_rep_format_xlsx    CONSTANT VARCHAR2 (20) := 'xlsx';

   -- images uri
   --c_images_uri_tunnel constant varchar2(100 char)
   --       := 'xlib_jasperreports_img.get_image?p_url=#REPORT_URL#&p_image=';
   -- #IMAGE_NAME# and #J2EE_CONTEXT# will be substituted on the J2EE server side
   m_jri_cookie_name_c      CONSTANT VARCHAR2 (50) := 'JRI_SESSIONID';
   m_jri_path_cookie_name_c CONSTANT VARCHAR2 (50) := 'JRI_PATH';
   c_images_uri_tunnel constant varchar2(500 char) := 'wwv_flow.show?p_request=APPLICATION_PROCESS%3DJRI_SHOW_IMAGE&p_flow_id=#APP_ID#&p_flow_step_id=0&p_instance=#APP_SESSION#&x01=#IMAGE_NAME#';
   c_images_uri_no_tunnel constant varchar2(500 char) := '#J2EE_CONTEXT_PATH#/report_image?image=#IMAGE_NAME#';

   -- exceptions
   report_url_not_defined       EXCEPTION;

----------------------------------------------------------------------------
-- sets the url for the report server for all requests in the
-- current session
----------------------------------------------------------------------------
   PROCEDURE set_report_url (p_report_url IN VARCHAR2);

   FUNCTION get_report_url
      RETURN VARCHAR2;

----------------------------------------------------------------------------
-- set the image uri for html reports only!
----------------------------------------------------------------------------
   PROCEDURE set_images_uri (p_images_uri IN VARCHAR2 default null);
   procedure use_images_no_tunnel (p_server_uri in varchar2 default null, p_cookie_path varchar2 default null);
   function get_use_images_no_tunnel return boolean;

   FUNCTION get_images_uri
      return varchar2;
   FUNCTION get_cookie_path_no_tunnel
      RETURN VARCHAR2;


/**  make a callout with utl_http to the j2ee container running the
 *   JasperReportsIntegration web application
 *   => return the results
 *
 * @param p_rep_name      name of the report (needs a name.jasper file deployed on the server)
 * @param p_rep_format    report format, e.g. pdf, rtf, etc, see constants
 * @param p_data_source   data source name, needs to be configured in J2EE application
 * @param p_out_filename  filename if the file should be downloaded
 * @param p_rep_locale    report locale setting, e.g. de_DE or en_US
 * @param p_rep_encoding  encoding, e.g. UTF-8
 * @param p_additional_params additional parameters, e.g.: p1=1&p2=2
 * @param p_print_is_enabled shall the report be sent to the printer directly?
 * @param p_print_printer_name  name or substring of printer name
 * @param p_print_media   media used, either the paper size or the tray
 * @param p_print_copies  number of copies to be printed
 * @param p_print_duplex  duplex printing?
 * @param p_print_collate sorting the print output?
 * @param p_save_is_enabled shall the generated file be saved on the server?
 * @param p_rep_time_zone "time zone" parameter for the execution of the report,
                          a list of valid entries can be found here:
                          https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
                          E.g.: Europe/Berlin, UCT, US/Central, US/Pacific,
                          Etc/Greenwich, Europe/London
 * @param p_save_filename filename for the file to be saved on the server
 * @param p_print_job_name name of the print job name, by default it uses: JasperReports - <report name>
 * @param p_http_version http protocol used. Default is utl_http.http_version_1_1, you can downgrade to utl_http.http_version_1_0
 *
 */
   PROCEDURE show_report (
      p_rep_name            IN   VARCHAR2 DEFAULT 'test',
      p_rep_format          IN   VARCHAR2 DEFAULT c_rep_format_pdf,
      p_data_source         IN   VARCHAR2 DEFAULT 'default',
      p_out_filename        IN   VARCHAR2 DEFAULT NULL,
      p_rep_locale          in   varchar2 default 'de_DE',
      p_rep_encoding        in   varchar2 default 'UTF-8',
      p_additional_params   in   varchar2 default null,
      p_print_is_enabled    in   boolean default false,
      p_print_printer_name  in   varchar2 default null,
      p_print_media         in   varchar2 default null,
      p_print_copies        in   number default 1,
      p_print_duplex        in   boolean default false,
      p_print_collate       in   boolean default false,
      p_save_is_enabled     in   boolean default false,
      p_save_filename       in   varchar2 default null,
      p_rep_time_zone       in   varchar2 default null,
      p_print_job_name      in   varchar2 default null,
      p_http_version        IN   xlib_http.http_version_1_1%type default xlib_http.http_version_1_1
   );

   /* tunnels images for html reports */
   procedure show_image(
      p_image_name IN   VARCHAR2,
      p_http_version        IN   xlib_http.http_version_1_1%type default xlib_http.http_version_1_1);


/**  run the report and return the result as a blob
 *
 * @param p_rep_name      name of the report (needs a name.jasper file deployed on the server)
 * @param p_rep_format    report format, e.g. pdf, rtf, etc, see constants
 * @param p_data_source   data source name, needs to be configured in J2EE application
 * @param p_out_filename  filename if the file should be downloaded
 * @param p_rep_locale    report locale setting, e.g. de_DE or en_US
 * @param p_rep_encoding  encoding, e.g. UTF-8
 * @param p_additional_params additional parameters, e.g.: p1=1&p2=2
 * @param p_print_is_enabled shall the report be sent to the printer directly?
 * @param p_print_printer_name  name or substring of printer name
 * @param p_print_media   media used, either the paper size or the tray
 * @param p_print_copies  number of copies to be printed
 * @param p_print_duplex  duplex printing?
 * @param p_print_collate sorting the print output?
 * @param p_save_is_enabled shall the generated file be saved on the server?
 * @param p_save_filename filename for the file to be saved on the server
 * @param p_rep_time_zone "time zone" parameter for the execution of the report,
                          a list of valid entries can be found here:
                          https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
                          E.g.: Europe/Berlin, UCT, US/Central, US/Pacific,
                          Etc/Greenwich, Europe/London
 * @param p_out_blob      the blob will be returned here
 * @param p_out_mime_type the proper mime type of the generated file
 * @param p_print_job_name name of the print job name, by default it uses: JasperReports - <report name>
 * @param p_http_version http protocol used. Default is utl_http.http_version_1_1, you can downgrade to utl_http.http_version_1_0
 *
 */
   PROCEDURE get_report (
      p_rep_name            IN   VARCHAR2 DEFAULT 'test',
      p_rep_format          in   varchar2 default c_rep_format_pdf,
      p_data_source         IN   VARCHAR2 DEFAULT 'default',
      p_rep_locale          in   varchar2 default 'de_DE',
      p_rep_encoding        IN   VARCHAR2 DEFAULT 'UTF-8',
      p_additional_params   in   varchar2 default null,
      p_print_is_enabled    in   boolean default  false,
      p_print_printer_name  in   varchar2 default null,
      p_print_media         in   varchar2 default null,
      p_print_copies        in   number default 1,
      p_print_duplex        in   boolean default false,
      p_print_collate       in   boolean default false,
      p_save_is_enabled     in   boolean default false,
      p_save_filename       in   varchar2 default null,
      p_rep_time_zone       in   varchar2 default null,
      p_out_blob            IN OUT   BLOB,
      p_out_mime_type       IN OUT   VARCHAR2,
      p_print_job_name      in   varchar2 default null,
      p_http_version        IN   xlib_http.http_version_1_1%type default xlib_http.http_version_1_1
   );

----------------------------------------------------------------------------
-- get default configuration
----------------------------------------------------------------------------
   FUNCTION get_default_configuration
      return xlib_jasperreports_conf%rowtype;

----------------------------------------------------------------------------
-- set default configuration
----------------------------------------------------------------------------
    PROCEDURE set_default_configuration(p_conf in out xlib_jasperreports_conf%rowtype);

    PROCEDURE set_default_configuration (
    p_protocol                IN xlib_jasperreports_conf.conf_protocol%TYPE default 'http',
    p_server                  IN xlib_jasperreports_conf.conf_server%TYPE default 'localhost',
    p_port                    IN xlib_jasperreports_conf.conf_port%TYPE default '80',
    p_context_path            IN xlib_jasperreports_conf.conf_context_path%TYPE default 'jri',
    p_wallet_path             IN xlib_jasperreports_conf.conf_wallet_path%TYPE default null,
    p_wallet_pwd              IN xlib_jasperreports_conf.conf_wallet_pwd%TYPE default null,
    p_http_transfer_timeout   IN xlib_jasperreports_conf.conf_http_transfer_timeout%TYPE default 60);


END;
/
create or replace PACKAGE XLIB_JASPERREPORTS_IMG AS
/*

 2.8.0   08.02.2022  D. Aust          #79: XLIB_HTTP http_version
                                        - added optional parameter for http version
 2.10.1  16.01.2023  D. Aust          #123: Backport constant for Oracle 11
*/
----------------------------------------------------------------------------
-- get_image: retrieves a report image from the server
----------------------------------------------------------------------------
   PROCEDURE get_image (
      p_url in varchar2,
      p_image IN VARCHAR2,
      p_http_version        IN   xlib_http.http_version_1_1%type default xlib_http.http_version_1_1);

   procedure test;


END XLIB_JASPERREPORTS_IMG;
/
create or replace PACKAGE "XLIB_LOG"
IS
/*=========================================================================

  Purpose  : Application Logging

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration

  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation
  13.05.2012  D. Aust         insert fails when created_by user value too large

=========================================================================*/

PROCEDURE m (
      p_module      IN   VARCHAR2,
      p_msg         IN   VARCHAR2,
      p_type    IN   VARCHAR2 DEFAULT 'DEBUG',
      p_level        PLS_INTEGER DEFAULT 15
   );
END;
/
create or replace PACKAGE BODY      "XLIB_HTTP"
AS
/*=========================================================================

  Purpose  : Make http callouts

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration

 Version Date        Author           Comment
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         19.02.2007  D. Aust          initial creation
         07.08.2008  D. Aust          - added check_get_request
                                      - display_url_raw: pass all request headers
                                          to the client
         05.08.2012  D. Aust		      suppress mime header TRANSFER-ENCODING,
                                        causes lots of problems with XMLDB listener
                                        and others choking.
 2.3.0.0 19.05.2014  D. Aust          - #294 - Fix chunked encoding problem in
                                          xlib_http.get_report
                                      - added version information to this package
 2.3.0.0 09.05.2015  D. Aust          pass JSESSIONID from backend J2EE server to client
                                        for image rendering in html reports
 2.6.1   28.09.2020  D. Aust          #40 - APEX 20.1 security bundle (PSE 30990551)
                                        rejects response header "Cache-Control: private"
 2.6.2   13.10.2020  D. Aust          - added function check_acl()
 2.8.0   08.02.2022  D. Aust          #79: XLIB_HTTP http_version
                                        - added optional parameter for http version
 2.10.1  16.01.2023  D. Aust          #123: Backport constant for Oracle 11

=========================================================================*/

   m_module   VARCHAR2 (50) := 'XLIB_HTTP';

   PROCEDURE display_url_raw (
      p_url                       VARCHAR2,
      p_mime_type_override   IN   VARCHAR2 DEFAULT NULL,
      p_charset              IN   VARCHAR2 DEFAULT NULL,
      p_header_name_arr      IN   vc_arr_t default g_empty_vc_arr,
      p_header_value_arr     IN   vc_arr_t default g_empty_vc_arr,
      p_http_version         IN   xlib_http.http_version_1_1%type default xlib_http.http_version_1_1
   )
   IS
      l_http_request       UTL_HTTP.req;
      l_http_response      UTL_HTTP.resp;
      l_blob               BLOB;
      l_raw                RAW (32767);
      l_buffer_size        NUMBER          := 32767;
      --
      l_proc               VARCHAR2 (100)  := m_module || '.DISPLAY_URL_RAW';
      --
      l_mime_type          VARCHAR2 (100);
      l_header_name        VARCHAR2 (256);
      l_header_value       VARCHAR2 (1024);
      l_jsession           VARCHAR2 (256);
      l_path               VARCHAR2 (1024);
      --
      l_header_name_arr    vc_arr_t;
      l_header_value_arr   vc_arr_t;
      --
      l_msg                varchar2(32767);
   BEGIN
      xlog (l_proc, 'show url: ' || p_url);
      --htp.flush();
      --htp.init();

      -- Initialize the BLOB.
      DBMS_LOB.createtemporary (l_blob, FALSE);

      l_http_request := UTL_HTTP.begin_request (url          => p_url,
                                                method       => 'GET',
                                                http_version => p_http_version);

      utl_http.set_header (l_http_request, 'Connection', 'Keep-Alive');

      -- pass additional headers to the target service
      for i in 1..p_header_name_arr.count loop
        xlog(l_proc, 'pass additional headers to target service: '|| p_header_name_arr(i) ||': '||p_header_value_arr(i));
        utl_http.set_header(l_http_request, p_header_name_arr(i), p_header_value_arr(i));
      end loop;

      -- get response from target service
      l_http_response := UTL_HTTP.get_response (l_http_request);

      FOR i IN 1 .. UTL_HTTP.get_header_count (l_http_response)
      LOOP
         UTL_HTTP.get_header (l_http_response,
                              i,
                              l_header_name,
                              l_header_value
                             );
         -- store header value in arr
         l_header_name_arr (i) := l_header_name;
         l_header_value_arr (i) := l_header_value;

         IF LOWER (l_header_name) = 'content-type'
         THEN
            l_mime_type := l_header_value;
            xlog(l_proc, 'content-type from server: ' || l_mime_type);
         END IF;
      END LOOP;

      -- override mime type
      IF p_mime_type_override IS NOT NULL
      THEN
         l_mime_type := p_mime_type_override;
      END IF;

      -- Copy the response into the BLOB.
      BEGIN
         LOOP
            UTL_HTTP.read_raw (l_http_response, l_raw, l_buffer_size);
            DBMS_LOB.writeappend (l_blob, UTL_RAW.LENGTH (l_raw), l_raw);
         END LOOP;
      EXCEPTION
         WHEN UTL_HTTP.end_of_body
         THEN
            UTL_HTTP.end_response (l_http_response);
      END;

      xlog(l_proc, 'set content-type: ' || l_mime_type);
      OWA_UTIL.mime_header (ccontent_type      => l_mime_type,
                            bclose_header      => FALSE,
                            ccharset           => p_charset
                           );

      FOR i IN 1 .. l_header_name_arr.COUNT
      LOOP
         IF UPPER (l_header_name_arr (i)) IN
                              ('CONTENT-LENGTH', 'CONTENT-TYPE', 'MIME-TYPE', 'TRANSFER-ENCODING',
                               'STRICT-TRANSPORT-SECURITY', 'CACHE-CONTROL', 'PRAGMA', 'EXPIRES')
         THEN
            --xlog (l_proc, 'skip header ' || l_header_name_arr (i));
            null;
         ELSE
            if upper(l_header_name_arr(i)) = 'SET-COOKIE' and l_header_value_arr (i) like 'JSESSIONID%' then
              xlog(l_proc , 'JSESSION_ID found !!!:'||l_header_value_arr (i));
              --extract path
              l_jsession := regexp_substr(l_header_value_arr (i), 'JSESSIONID=(.*);[ ]*Path',1, 1,'i',1);
              l_path := regexp_substr(l_header_value_arr (i), ';[ ]*Path=(.*)',1, 1,'i',1);

              xlog(l_proc, 'xx:full:'||l_header_value_arr (i)|| '; xx:session:'||l_jsession || '; xx:path:'||l_path);
            else
              l_header_value := l_header_value_arr (i);
            end if;
            xlog (l_proc,
                  'set header:'
               || l_header_name_arr (i)
               || ': '
               || l_header_value
              );
            HTP.p (l_header_name_arr (i) || ': ' || l_header_value);
         END IF;
      END LOOP;

      -- JSESSION Cookies ausgeben
      -- if using tunnel, then the cookie is JRI_JSESSIONID
      -- if not using tunnel, then cookie is JSESSIONID directly
      --
      if xlib_jasperreports.get_use_images_no_tunnel=false then
          l_msg := 'Set-Cookie: ' || xlib_jasperreports.m_jri_cookie_name_c || '=' || l_jsession;
          xlog (l_proc, 'set header:' || l_msg );
          HTP.p (l_msg);
          l_msg := 'Set-Cookie: ' || xlib_jasperreports.m_jri_path_cookie_name_c || '=' || l_path;
          xlog (l_proc, 'set header:' || l_msg );
          HTP.p (l_msg);
      else
          l_msg := 'Set-Cookie: JSESSIONID=' || l_jsession;
          if xlib_jasperreports.get_cookie_path_no_tunnel is not null then
            l_msg := l_msg || '; Path=' || xlib_jasperreports.get_cookie_path_no_tunnel;
          end if;
          xlog (l_proc, 'set header:' || l_msg );
          HTP.p (l_msg);
      end if;

      -- set content length
      HTP.p ('Content-length: ' || DBMS_LOB.getlength (l_blob));
      OWA_UTIL.http_header_close;
      WPG_DOCLOAD.download_file (l_blob);
      -- Relase the resources associated with the temporary LOB.
      DBMS_LOB.freetemporary (l_blob);
   EXCEPTION
      WHEN UTL_HTTP.end_of_body
      THEN
         UTL_HTTP.end_response (l_http_response);
         DBMS_LOB.freetemporary (l_blob);
         RAISE;
      WHEN OTHERS
      THEN
         xlog (l_proc, 'Error: ' || SQLERRM, 'ERROR');
         RAISE;
   END;

   PROCEDURE retrieve_blob_from_url (
      p_url             IN   VARCHAR2,
      o_blob            OUT  BLOB,
      o_mime_type       OUT  VARCHAR2,
      p_http_version    IN   xlib_http.http_version_1_1%type default xlib_http.http_version_1_1
   )
   IS
      l_http_request    UTL_HTTP.req;
      l_http_response   UTL_HTTP.resp;
      l_raw             RAW (32767);
      --
      l_proc            VARCHAR2 (100)
                                     := m_module || '.RETRIEVE_BLOB_FROM_URL';
      --
      l_header_name     VARCHAR2 (256);
      l_header_value    VARCHAR2 (1024);
   BEGIN
      -- Initialize the BLOB.
      dbms_lob.createtemporary (o_blob, false);
      l_http_request := utl_http.begin_request (url          => p_url,
                                                method       => 'GET',
                                                http_version => p_http_version);

      l_http_response := UTL_HTTP.get_response (l_http_request);

      FOR i IN 1 .. UTL_HTTP.get_header_count (l_http_response)
      LOOP
         UTL_HTTP.get_header (l_http_response,
                              i,
                              l_header_name,
                              l_header_value
                             );

         IF LOWER (l_header_name) = 'content-type'
         THEN
            o_mime_type := l_header_value;
         END IF;
      END LOOP;

      -- Copy the response into the BLOB.
      BEGIN
         LOOP
            UTL_HTTP.read_raw (l_http_response, l_raw, 32767);
            DBMS_LOB.writeappend (o_blob, UTL_RAW.LENGTH (l_raw), l_raw);
         END LOOP;
      EXCEPTION
         WHEN UTL_HTTP.end_of_body
         THEN
            UTL_HTTP.end_response (l_http_response);
      END;
   -- Relase the resources associated with the temporary LOB.
   --DBMS_LOB.freetemporary (l_blob);
   EXCEPTION
      WHEN OTHERS
      THEN
         UTL_HTTP.end_response (l_http_response);
         DBMS_LOB.freetemporary (o_blob);
         xlog (l_proc, 'Error: ' || SQLERRM, 'ERROR');
         RAISE;
   END;

   FUNCTION escape_form_data (s VARCHAR2)
      RETURN VARCHAR2
   IS
      l_s   VARCHAR2 (500 CHAR);

      FUNCTION r (s VARCHAR2, c VARCHAR2)
         RETURN VARCHAR2
      IS
      BEGIN
         RETURN REPLACE (s, c, '%' || TRIM (TO_CHAR (ASCII (c), 'XX')));
      END;
   BEGIN
      l_s := s;
      l_s := REPLACE (l_s, ' ', '+');
      l_s := r (l_s, chr(37));  -- %
      l_s := r (l_s, chr(37));  -- /
      l_s := r (l_s, chr(63));  -- ?
      l_s := r (l_s, chr(38));  -- &
      l_s := r (l_s, chr(228));  -- ‰
      l_s := r (l_s, chr(196));  -- ƒ
      l_s := r (l_s, chr(246));  -- ˆ
      l_s := r (l_s, chr(214));  -- ÷
      l_s := r (l_s, chr(252));  -- ¸
      l_s := r (l_s, chr(220));  -- ‹
      l_s := r (l_s, chr(223));  -- ﬂ
      RETURN l_s;
   END;

   FUNCTION check_get_request (p_url VARCHAR2)
      RETURN CHAR
   IS
      l_clob   CLOB;
   BEGIN
      IF p_url IS NULL
      THEN
         RETURN c_fail;
      END IF;

      SELECT HTTPURITYPE (p_url).getclob ()
        INTO l_clob
        FROM DUAL;

      /*SELECT c_success
        INTO l_ret
        FROM DUAL
       WHERE EXISTS (SELECT HTTPURITYPE (p_url).getclob ()
                       FROM DUAL);
                       */
      RETURN c_success;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN c_fail;
   END;

   FUNCTION check_acl (p_url VARCHAR2)
      RETURN CHAR
   IS
      l_clob   CLOB;
   BEGIN
      IF p_url IS NULL
      THEN
         RETURN c_fail;
      END IF;

      SELECT HTTPURITYPE (p_url).getclob ()
        INTO l_clob
        FROM DUAL;

      /*SELECT c_success
        INTO l_ret
        FROM DUAL
       WHERE EXISTS (SELECT HTTPURITYPE (p_url).getclob ()
                       FROM DUAL);
                       */
      RETURN c_success;
   EXCEPTION
      WHEN OTHERS
      THEN
         -- acl problem
         if sqlcode=24247 then
           RETURN c_fail;
         else
            -- no acl problem
            return c_success;
         end if;
   END;
END;
/
create or replace PACKAGE BODY "XLIB_JASPERREPORTS"
AS
/*=========================================================================
  Purpose  :

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14

  $LastChangedDate: 2018-09-30 09:00:44 +0200 (So, 30 Sep 2018) $
  $LastChangedBy: dietmar.aust $

  Version  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           06.01.2010  D. Aust   Initial creation
           06.05.2011  D. Aust   added constants for xlsx and docx
           05.08.2012  D. Aust   added version 2.0.0 features:
                                 - direct printing
                                 - save file on server
           11.05.2013  D. Aust   added support for tunneling images for html
                                   exports only
  2.3.0.0  19.05.2014  D. Aust   - #294 - Fix chunked encoding problem in
                                     xlib_http.get_report
                                 - added version information to this package
  2.4.0.0  15.10.2017  D. Aust   FEATURE: #3941 - Support for timeZones
                                 (report parameter REPORT_TIME_ZONE)
  2.5.0.0  29.09.2018  D. Aust   FEATURE: #9 - Ability to set Printjob name (programmatically)
  2.5.0.1  30.09.2018  D. Aust     fix bool2string issue
  2.6.1    01.10.2020  D. Aust   add get_default_configuration() and set_default_configuration()
  2.6.2    13.10.2020  D. Aust   #54 - Timeout value from default table not working
  2.8.0    08.02.2022  D. Aust   #79: XLIB_HTTP http_version
                                   - added optional parameter for http version
 2.10.1  16.01.2023  D. Aust          #123: Backport constant for Oracle 11
=========================================================================*/


   m_module       constant varchar2 (100) := $$plsql_unit;
   m_report_url   VARCHAR2 (32767) := NULL;
   m_images_uri   VARCHAR2 (32767) := NULL;
   m_use_images_no_tunnel boolean := false;
   m_cookie_path_no_tunnel varchar2(200 char) := null;

   -- convert boolean to 'true' or 'false'
   FUNCTION bool2string (b IN BOOLEAN)
      RETURN VARCHAR2
   IS
   BEGIN
      IF b
      THEN
         RETURN 'true';
      ELSE
         RETURN 'false';
      END IF;
   END;

    procedure setup_configuration_defaults
    is
      l_conf xlib_jasperreports_conf%rowtype;
      l_timeout PLS_INTEGER;
    begin
        l_conf := get_default_configuration();

        -- override report url if not defined
        if m_report_url is null then
          m_report_url := l_conf.conf_protocol || '://'||l_conf.conf_server||':'||l_conf.conf_port||'/'||l_conf.conf_context_path||'/report';
          xlog(p_module => m_module, p_msg => 'Override report url from defaults: '|| m_report_url, p_type=> 'DEBUG');
        end if;

        -- set wallet path and pwd
        -- will ALWAYS override the settings, will ignore previous calls to set_wallet
        -- at least we check whether the config table has an entry for the wallet or not.
        -- thus it could work relying on the wallet set by APEX through the internal workspace! :)
        if lower(m_report_url) like 'https%' and l_conf.conf_wallet_path is not null then
            utl_http.set_wallet(l_conf.conf_wallet_path, l_conf.conf_wallet_pwd);
            xlog(p_module => m_module, p_msg => 'Override wallet location/pwd from defaults', p_type=> 'DEBUG');
        end if;

        -- override http transfer timeout it not defined
        utl_http.get_transfer_timeout( timeout => l_timeout );
        --xlog(p_module => m_module, p_msg => 'Current setting of transfer_timeout: '||l_timeout, p_type=> 'DEBUG');
        if (l_timeout is null or l_timeout=60 /*60 is the default*/) then
            utl_http.set_transfer_timeout(l_conf.conf_http_transfer_timeout);
            xlog(p_module => m_module, p_msg => 'Override http transfer timeout ('||l_timeout||'s) from defaults: '|| l_conf.conf_http_transfer_timeout ||'s', p_type=> 'DEBUG');
        end if;

    end;

   PROCEDURE dump_all_cookies
   IS
      l_proc       VARCHAR2 (100) := m_module || '.dump_all_cookies';
      l_name_arr   OWA_COOKIE.vc_arr;
      l_vals_arr   OWA_COOKIE.vc_arr;
      l_vals_ret   INTEGER;
   BEGIN
      xlog (l_proc, 'start');
      OWA_COOKIE.get_all (names => l_name_arr, vals => l_vals_arr, num_vals => l_vals_ret);

      xlog (l_proc, '#num of cookies: ' || l_vals_ret);

      FOR i IN 1 .. l_name_arr.COUNT
      LOOP
         xlog (l_proc, i || ':' || l_name_arr (i) || '=' || l_vals_arr (i));
      END LOOP;

      xlog (l_proc, 'end');
   END;

   ----------------------------------------------------------------------------
   -- sets the url for the report server for all requests in the
   -- current session
   ----------------------------------------------------------------------------
   PROCEDURE set_report_url (p_report_url IN VARCHAR2)
   IS
   BEGIN
      xlog ('set_report_url:', p_report_url);
      m_report_url := p_report_url;
   END;

   FUNCTION get_report_url
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN m_report_url;
   END;

   ----------------------------------------------------------------------------
   -- sets the images_uri only for http reports!
   ----------------------------------------------------------------------------
   PROCEDURE set_images_uri (p_images_uri IN VARCHAR2)
   IS
   BEGIN
      m_images_uri := p_images_uri;
   END;

   /* use the images from the application server when both /ords and /jri are
      installed on the same application server

      the p_server_uri parameter is rarely used, only when they are not run on the same application server
      and the uri differs. But that comes with a lot of CORS and other cookie issues.
    */
   procedure use_images_no_tunnel (p_server_uri in varchar2 default null, p_cookie_path varchar2 default null)
   is
   begin
     m_use_images_no_tunnel := true;
     m_cookie_path_no_tunnel := p_cookie_path;

     -- the placeholders #J2EE_CONTEXT_PATH# and #IMAGE_NAME# will be replaced
     -- inside the J2EE application with the current values of the deployment
     set_images_uri( p_images_uri => p_server_uri || '#J2EE_CONTEXT_PATH#/report_image?image=#IMAGE_NAME#');
   end;

   function get_use_images_no_tunnel return boolean
   is
   begin
     return m_use_images_no_tunnel;
   end;

    FUNCTION get_cookie_path_no_tunnel
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN m_cookie_path_no_tunnel;
   END;


   FUNCTION get_images_uri
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN m_images_uri;
   END;

   FUNCTION compute_images_uri_tunnel
      RETURN VARCHAR2
   IS
      l_uri   VARCHAR2 (32767 CHAR);
   BEGIN
      --l_uri := sys_context( 'userenv', 'current_schema' )
      --                                  || '.' || c_images_uri_tunnel;

      /*
          c_images_uri_tunnel
              :='xlib_jasperreports_img.get_image?p_url=#REPORT_URL#&p_image=';
       */

      --l_uri := replace(l_uri, '#REPORT_URL#', APEX_UTIL.URL_ENCODE(m_report_url));
      --l_uri := replace(l_uri, '#REPORT_URL#', m_report_url);

      --   c_images_uri_tunnel constant varchar2(100 char) := 'wwv_flow.show?p_request=APPLICATION_PROCESS%3DJRI_SHOW_IMAGE&p_flow_id=#APP_ID#&p_flow_step_id=0&p_instance=#APP_SESSION#&x01=#IMG_NAME#';
      l_uri := c_images_uri_tunnel;
      l_uri := REPLACE (l_uri, '#APP_ID#', v ('APP_ID'));
      l_uri := REPLACE (l_uri, '#APP_SESSION#', v ('APP_SESSION'));

      xlog ('compute tunnel', l_uri);

      RETURN l_uri;
   END;

   ----------------------------------------------------------------------------
   -- displays an image for html reports
   ----------------------------------------------------------------------------
   PROCEDURE show_image (
      p_image_name IN VARCHAR2,
      p_http_version        IN   xlib_http.http_version_1_1%type default xlib_http.http_version_1_1)
   IS
      l_proc               VARCHAR2 (100) := m_module || '.show_image';
      l_url                VARCHAR2 (32767);

      l_header_name_arr    xlib_http.vc_arr_t;
      l_header_value_arr   xlib_http.vc_arr_t;

      PROCEDURE get_headers_to_pass2j2ee (p_header_name_arr    OUT xlib_http.vc_arr_t,
                                          p_header_value_arr   OUT xlib_http.vc_arr_t)
      IS
         l_proc                 VARCHAR2 (100) := m_module || '.get_headers_to_pass2j2ee';
         jsession_cookie        OWA_COOKIE.cookie;
         jsession_path_cookie   OWA_COOKIE.cookie;
      BEGIN
         jsession_cookie := OWA_COOKIE.get (name => m_jri_cookie_name_c);
         jsession_path_cookie := OWA_COOKIE.get (name => m_jri_path_cookie_name_c);

         xlog (l_proc, 'show jsession_id and path: ');
         xlog (l_proc, jsession_cookie.vals (1));
         xlog (l_proc, jsession_path_cookie.vals (1));


         p_header_name_arr (p_header_name_arr.COUNT + 1) := 'Cookie';
         p_header_value_arr (p_header_value_arr.COUNT + 1) :=
            'JSESSIONID=' || jsession_cookie.vals (1) || ';Path=' || jsession_path_cookie.vals (1);
      --xlog(l_proc, 'end');
      EXCEPTION
         WHEN OTHERS
         THEN
            xlog (l_proc, DBMS_UTILITY.format_error_backtrace, 'ERROR');
      END;
   BEGIN
      xlog (l_proc, 'start: ### SHOW IMAGE: ' || p_image_name);
      dump_all_cookies;

      -- pick up defaults from table xlib_jasperreports_conf
      setup_configuration_defaults();

      -------------------------------------------------------
      -- assert valid values for the input variables
      -------------------------------------------------------
      IF m_report_url IS NULL
      THEN
         RAISE report_url_not_defined;
      END IF;

      -------------------------------------------------------
      -- construct URL
      -------------------------------------------------------
      -- _image?image=img_0_0_15&uuid=b41eb881-7ca5-4919-bd8f-5afa8d10b398
      l_url := m_report_url || '_image';
      l_url := l_url || '?image=' || p_image_name;
      l_url := l_url || '&JSESSIONID=' || OWA_COOKIE.get (name => m_jri_cookie_name_c).vals (1);

      -------------------------------------------------------
      -- determine cookies for calling the j2ee server
      -- JSESSIONID needs to be passed, the path needs to
      -- be modified for the j2ee server context
      -------------------------------------------------------
      get_headers_to_pass2j2ee (p_header_name_arr => l_header_name_arr, p_header_value_arr => l_header_value_arr);

      -------------------------------------------------------
      -- call J2EE server
      -------------------------------------------------------
      xlib_http.
       display_url_raw (
          p_url => l_url,
          p_header_name_arr => l_header_name_arr,
          p_header_value_arr => l_header_value_arr,
          p_http_version => p_http_version
          );
   END;



   ----------------------------------------------------------------------------
   -- make a callout with utl_http to the j2ee container running the
   -- JasperReportsIntegration webapp
   -- => return the results
   ----------------------------------------------------------------------------
   PROCEDURE show_report (p_rep_name             IN VARCHAR2 DEFAULT 'test',
                          p_rep_format           IN VARCHAR2 DEFAULT c_rep_format_pdf,
                          p_data_source          IN VARCHAR2 DEFAULT 'default',
                          p_out_filename         IN VARCHAR2 DEFAULT NULL,
                          p_rep_locale           IN VARCHAR2 DEFAULT 'de_DE',
                          p_rep_encoding         IN VARCHAR2 DEFAULT 'UTF-8',
                          p_additional_params    IN VARCHAR2 DEFAULT NULL,
                          p_print_is_enabled     IN BOOLEAN DEFAULT FALSE,
                          p_print_printer_name   IN VARCHAR2 DEFAULT NULL,
                          p_print_media          IN VARCHAR2 DEFAULT NULL,
                          p_print_copies         IN NUMBER DEFAULT 1,
                          p_print_duplex         IN BOOLEAN DEFAULT FALSE,
                          p_print_collate        IN BOOLEAN DEFAULT FALSE,
                          p_save_is_enabled      IN BOOLEAN DEFAULT FALSE,
                          p_save_filename        IN VARCHAR2 DEFAULT NULL,
                          p_rep_time_zone        IN VARCHAR2 DEFAULT NULL,
                          p_print_job_name       IN VARCHAR2 DEFAULT NULL,
                          p_http_version         IN   xlib_http.http_version_1_1%type default xlib_http.http_version_1_1)
   IS
      l_proc   VARCHAR2 (100) := m_module || '.SHOW_REPORT';
      l_url    VARCHAR2 (32767);
   BEGIN
      -- pick up defaults from table xlib_jasperreports_conf
      setup_configuration_defaults();

      -------------------------------------------------------
      -- assert valid values for the input variables
      -------------------------------------------------------
      IF m_report_url IS NULL
      THEN
         xlog(p_module => m_module, p_msg => 'The report url is empty', p_type=> 'ERROR');

         RAISE report_url_not_defined;
      END IF;

      -------------------------------------------------------
      -- construct URL
      -------------------------------------------------------
      l_url := m_report_url;
      l_url := l_url || '?_repName=' || p_rep_name;
      l_url := l_url || '&_repFormat=' || p_rep_format;
      l_url := l_url || '&_dataSource=' || p_data_source;
      l_url := l_url || '&_outFilename=' || p_out_filename;
      l_url := l_url || '&_repLocale=' || p_rep_locale;
      l_url := l_url || '&_repEncoding=' || p_rep_encoding;
      l_url := l_url || '&_repTimeZone=' || APEX_UTIL.URL_ENCODE (p_rep_time_zone);

      -- per default use the tunnel through the database
      IF m_images_uri IS NULL OR m_images_uri = c_images_uri_tunnel
      THEN
         -- tunnel through database
         l_url := l_url || '&_imagesURI=' || APEX_UTIL.URL_ENCODE (compute_images_uri_tunnel);
      ELSE
         -- use parameter, mostly for direct access to servlet
         l_url := l_url || '&_imagesURI=' || APEX_UTIL.URL_ENCODE (m_images_uri);
      END IF;

      -- direct printing
      l_url := l_url || '&_printIsEnabled=' || bool2string (p_print_is_enabled);
      l_url := l_url || '&_printPrinterName=' || p_print_printer_name;
      l_url := l_url || '&_printPrinterTray=' || p_print_media;
      l_url := l_url || '&_printCopies=' || p_print_copies;
      l_url := l_url || '&_printDuplex=' || bool2string (p_print_duplex);
      l_url := l_url || '&_printCollate=' || bool2string (p_print_collate);
      l_url := l_url || '&_printJobName=' || p_print_job_name;

      -- save file on server
      l_url := l_url || '&_saveIsEnabled=' || bool2string (p_save_is_enabled);
      l_url := l_url || '&_saveFileName=' || p_save_filename;


/*
      Each additional parameter needs to be escaped using utl_url.escape()
       utl_url.escape(
        url                    => p_additional_params,
        escape_reserved_chars  => true,
                   url_charset            => 'UTF-8'
        );
*/

      -- additional report parameter passed?
      IF (p_additional_params IS NOT NULL)
      THEN
--         l_url := l_url || '&' || p_additional_params;
         l_url := l_url || '&' || utl_url.escape(
                                        url                    => p_additional_params,
                                        escape_reserved_chars  => false,
                                                   url_charset            => 'UTF-8'
        );
      END IF;

      -------------------------------------------------------
      -- call J2EE server
      -------------------------------------------------------
      xlib_http.display_url_raw (
        p_url => l_url,
        p_http_version => p_http_version);
   END;

   ----------------------------------------------------------------------------
   -- run the report and return the result as a blob
   ----------------------------------------------------------------------------
   PROCEDURE get_report (p_rep_name             IN     VARCHAR2 DEFAULT 'test',
                         p_rep_format           IN     VARCHAR2 DEFAULT c_rep_format_pdf,
                         p_data_source          IN     VARCHAR2 DEFAULT 'default',
                         p_rep_locale           IN     VARCHAR2 DEFAULT 'de_DE',
                         p_rep_encoding         IN     VARCHAR2 DEFAULT 'UTF-8',
                         p_additional_params    IN     VARCHAR2 DEFAULT NULL,
                         p_print_is_enabled     IN     BOOLEAN DEFAULT FALSE,
                         p_print_printer_name   IN     VARCHAR2 DEFAULT NULL,
                         p_print_media          IN     VARCHAR2 DEFAULT NULL,
                         p_print_copies         IN     NUMBER DEFAULT 1,
                         p_print_duplex         IN     BOOLEAN DEFAULT FALSE,
                         p_print_collate        IN     BOOLEAN DEFAULT FALSE,
                         p_save_is_enabled      IN     BOOLEAN DEFAULT FALSE,
                         p_save_filename        IN     VARCHAR2 DEFAULT NULL,
                         p_rep_time_zone        IN     VARCHAR2 DEFAULT NULL,
                         p_out_blob             IN OUT BLOB,
                         p_out_mime_type        IN OUT VARCHAR2,
                         p_print_job_name       IN     VARCHAR2 DEFAULT NULL,
                         p_http_version         IN   xlib_http.http_version_1_1%type default xlib_http.http_version_1_1)
   IS
      l_proc   VARCHAR2 (100) := m_module || '.GET_REPORT';
      l_url    VARCHAR2 (32767);
   BEGIN
      -- pick up defaults from table xlib_jasperreports_conf
      setup_configuration_defaults();

      -------------------------------------------------------
      -- assert valid values for the input variables
      -------------------------------------------------------
      IF m_report_url IS NULL
      THEN
         RAISE report_url_not_defined;
      END IF;

      -------------------------------------------------------
      -- construct URL
      -------------------------------------------------------
      l_url := m_report_url;
      l_url := l_url || '?_repName=' || p_rep_name;
      l_url := l_url || '&_repFormat=' || p_rep_format;
      l_url := l_url || '&_dataSource=' || p_data_source;
      l_url := l_url || '&_repLocale=' || p_rep_locale;
      l_url := l_url || '&_repEncoding=' || p_rep_encoding;
      l_url := l_url || '&_repTimeZone=' || APEX_UTIL.URL_ENCODE (p_rep_time_zone);

      -- per default use the tunnel through the database
      IF m_images_uri IS NULL OR m_images_uri = c_images_uri_tunnel
      THEN
         -- tunnel through database
         l_url := l_url || '&_imagesURI=' || APEX_UTIL.URL_ENCODE (compute_images_uri_tunnel);
      ELSE
         -- use parameter, mostly for direct access to servlet
         l_url := l_url || '&_imagesURI=' || APEX_UTIL.URL_ENCODE (m_images_uri);
      END IF;

      -- direct printing
      l_url := l_url || '&_printIsEnabled=' || bool2string (p_print_is_enabled);
      l_url := l_url || '&_printPrinterName=' || p_print_printer_name;
      l_url := l_url || '&_printPrinterTray=' || p_print_media;
      l_url := l_url || '&_printCopies=' || p_print_copies;
      l_url := l_url || '&_printDuplex=' || bool2string (p_print_duplex);
      l_url := l_url || '&_printCollate=' || bool2string (p_print_collate);
      l_url := l_url || '&_printJobName=' || p_print_job_name;

      -- save file on server
      l_url := l_url || '&_saveIsEnabled=' || bool2string (p_save_is_enabled);
      l_url := l_url || '&_saveFileName=' || p_save_filename;

      -- additional report parameter passed?
      IF (p_additional_params IS NOT NULL)
      THEN
--         l_url := l_url || '&' || p_additional_params;
         l_url := l_url || '&' || utl_url.escape(
                                        url                    => p_additional_params,
                                        escape_reserved_chars  => false,
                                                   url_charset            => 'UTF-8'
        );
      END IF;

      -------------------------------------------------------
      -- call Tomcat
      -------------------------------------------------------
      xlib_http.retrieve_blob_from_url (
         p_url => l_url,
         o_blob => p_out_blob,
         o_mime_type => p_out_mime_type,
         p_http_version=> p_http_version);
   END;

   ----------------------------------------------------------------------------
   -- get default configuration
   ----------------------------------------------------------------------------
   FUNCTION get_default_configuration
      RETURN xlib_jasperreports_conf%ROWTYPE
   IS
      l_conf   xlib_jasperreports_conf%ROWTYPE;
   BEGIN
      SELECT *
        INTO l_conf
        FROM xlib_jasperreports_conf
       WHERE conf_id = 'MAIN';

      RETURN l_conf;
   END;

   ----------------------------------------------------------------------------
   -- set default configuration
   ----------------------------------------------------------------------------
   PROCEDURE set_default_configuration (p_conf IN OUT xlib_jasperreports_conf%ROWTYPE)
   IS
   BEGIN
      p_conf.conf_id := 'MAIN';

      UPDATE xlib_jasperreports_conf
         SET row = p_conf
       WHERE conf_id = p_conf.conf_id;
   END;


   PROCEDURE set_default_configuration (
      p_protocol                IN xlib_jasperreports_conf.conf_protocol%TYPE default 'http',
      p_server                  IN xlib_jasperreports_conf.conf_server%TYPE default 'localhost',
      p_port                    IN xlib_jasperreports_conf.conf_port%TYPE default '80',
      p_context_path            IN xlib_jasperreports_conf.conf_context_path%TYPE default 'jri',
      p_wallet_path             IN xlib_jasperreports_conf.conf_wallet_path%TYPE default null,
      p_wallet_pwd              IN xlib_jasperreports_conf.conf_wallet_pwd%TYPE default null,
      p_http_transfer_timeout   IN xlib_jasperreports_conf.conf_http_transfer_timeout%TYPE default 60)
   IS
   BEGIN
      UPDATE xlib_jasperreports_conf
         SET conf_protocol = p_protocol,
             conf_server = p_server,
             conf_port = p_port,
             conf_context_path = p_context_path,
             conf_wallet_path = p_wallet_path,
             conf_wallet_pwd = p_wallet_pwd,
             conf_http_transfer_timeout = p_http_transfer_timeout
       WHERE conf_id = 'MAIN';
   END;
END;
/
create or replace package body xlib_jasperreports_img as
/*

 2.8.0   08.02.2022  D. Aust          #79: XLIB_HTTP http_version
                                        - added optional parameter for http version
 2.10.1  16.01.2023  D. Aust          #123: Backport constant for Oracle 11
*/
   m_module       constant varchar2 (100) := $$plsql_unit;


----------------------------------------------------------------------------
-- get_image: retrieves a report image from the server
----------------------------------------------------------------------------
   procedure get_image (
      p_url in varchar2,
      p_image in varchar2,
      p_http_version        IN   xlib_http.http_version_1_1%type default xlib_http.http_version_1_1)
   is
      l_url         varchar2 (32767);
      l_proc   VARCHAR2 (100)   := m_module || '.GET_IMAGE';
   begin

      -------------------------------------------------------
      -- construct URL
      -------------------------------------------------------
      l_url := p_url;
      -- use image servlet
      l_url := l_url || '_image?image=' || p_image;
      -- use images directory /report_tmp/
      --l_url := l_url || '_tmp/' || p_image;

      -------------------------------------------------------
      -- call J2EE server
      -------------------------------------------------------
      xlog(l_proc, l_url);
      xlib_http.display_url_raw (p_url => l_url, p_http_version => p_http_version);

   end;

procedure test
is
begin
  htp.p('test');
end;


END XLIB_JASPERREPORTS_IMG;
/
create or replace PACKAGE BODY "XLIB_LOG"
IS

   PROCEDURE m (
      p_module      IN   VARCHAR2,
      p_msg         IN   VARCHAR2,
      p_type    IN   VARCHAR2 DEFAULT 'DEBUG',
      p_level   IN   PLS_INTEGER DEFAULT 15
   )
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      INSERT INTO xlib_logs
                  (log_module, log_msg, log_type, log_level, log_created_on, log_created_by
                  )
           values (   substr(p_module,1,100)
                    , substr(p_msg,1,4000)
                    , substr(p_type,1,20)
                    , p_level
                    , sysdate
                    , substr(nvl(v('APP_USER'), user),1,100)
                  );
      COMMIT;
   END;
END;
/