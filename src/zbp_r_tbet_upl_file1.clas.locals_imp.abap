CLASS lhc_File DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR File RESULT result.
    METHODS saveDetails FOR DETERMINE ON SAVE
      IMPORTING keys FOR File~saveDetails.


ENDCLASS.

CLASS lhc_File IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD saveDetails.

    DATA: rows            TYPE STANDARD TABLE OF string,
          content         TYPE string,
          conv            TYPE REF TO cl_abap_conv_codepage,
          ls_excel_data   TYPE zr_tbet_upl_file1,
          lt_excel_data   TYPE STANDARD TABLE OF zr_tbet_upl_file1,
          lv_quantity     TYPE c LENGTH 10,
          lt_split        TYPE TABLE OF c,
          wa_res          TYPE ztbet_file_det1,
          lt_res          TYPE STANDARD TABLE OF ztbet_file_det1,
          lt_child        TYPE TABLE FOR CREATE zc_tbet_upl_file1\_fileres,
          wa_new_child    LIKE LINE OF lt_child,
          lt_child_target LIKE wa_new_child-%target,
          lv_date type c LENGTH 10.

    READ ENTITIES OF zr_tbet_upl_file1 IN LOCAL MODE
                 ENTITY file
                 ALL FIELDS WITH
                 CORRESPONDING #( keys )
                 RESULT DATA(lt_inv).

    DATA(lv_attachment) = lt_inv[ 1 ]-attachment.


    content = cl_abap_conv_codepage=>create_in( )->convert( lv_attachment ).

*    FINAL(xstr) =
*      cl_abap_conv_codepage=>create_out( codepage = `UTF-8`
*        )->convert( source = content ).

    SPLIT content AT cl_abap_char_utilities=>newline INTO TABLE lt_split.

** Split the string table to rows
    SPLIT content AT cl_abap_char_utilities=>cr_lf INTO TABLE rows.

    LOOP AT rows INTO DATA(wa_split).

      " EVITAR QUE HAGA EL APPEND DE LAS ETIQUETAS DE LA PRIMER LINEA DEL CSV = "BUKRS;BELNR;GJAHR;BUZEI;BLART;BLDAT;USNAM"
      IF sy-tabix EQ 1.
        CONTINUE.
      ENDIF.

      SPLIT wa_split AT ';' INTO wa_res-bukrs
                                                            wa_res-belnr
                                                            wa_res-gjahr
                                                            wa_res-buzei
                                                            wa_res-blart
                                                            lv_date
                                                            wa_res-usnam
                                                            wa_res-kostl.

      wa_res-id_upload = lt_inv[ 1 ]-idupload.

      data(lv_day) = segment( val = lv_date sep = '.' index = 1 ).
      data(lv_month) = segment( val = lv_date sep = '.' index = 2 ).
      data(lv_year) = segment( val = lv_date sep = '.' index = 3 ).

      wa_res-bldat = |{ lv_year }{ lv_month }{ lv_day }|.

      APPEND wa_res TO lt_res.

      MOVE-CORRESPONDING lt_res TO wa_new_child-%target.



    ENDLOOP.

    LOOP AT wa_new_child-%target ASSIGNING FIELD-SYMBOL(<fs_child>).
      <fs_child>-%cid = |child-{ sy-tabix }|.
      <fs_child>-IdUpload = lt_inv[ 1 ]-%key-IdUpload.
      <fs_child>-%control-IdUpload =  if_abap_behv=>mk-on.
      <fs_child>-%control-Bukrs =  if_abap_behv=>mk-on.
      <fs_child>-%control-Buzei =  if_abap_behv=>mk-on.
      <fs_child>-%control-Blart =  if_abap_behv=>mk-on.
      <fs_child>-%control-Gjahr =  if_abap_behv=>mk-on.
      <fs_child>-%control-Belnr =  if_abap_behv=>mk-on.
      <fs_child>-%control-Usnam =  if_abap_behv=>mk-on.
      <fs_child>-%control-Kostl =  if_abap_behv=>mk-on.
      <fs_child>-%control-Bldat =  if_abap_behv=>mk-on.
    ENDLOOP.
    UNASSIGN <fs_child>.

    lt_child = VALUE #( (
*                            %cid_ref = 'Root'
                            %key-IdUpload = lt_inv[ 1 ]-%key-IdUpload
                            %target = wa_new_child-%target ) ).


    MODIFY ENTITY zc_tbet_upl_file1
        CREATE BY \_fileres
        FROM  lt_child
        FAILED DATA(ls_failed_crt)
        REPORTED DATA(ls_reported_crt)
        MAPPED DATA(ls_mapped_crt).

    IF 1 = 2. ENDIF.


  ENDMETHOD.

ENDCLASS.
