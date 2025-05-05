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

    READ ENTITIES OF ZR_TBET_UPL_FILE1 IN LOCAL MODE
      ENTITY file
      ALL FIELDS WITH
      CORRESPONDING #( keys )
      RESULT DATA(lt_inv).





  ENDMETHOD.

ENDCLASS.
