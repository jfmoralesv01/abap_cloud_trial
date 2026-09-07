CLASS zcl_jfmv_agency_model DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   METHODS get_agency
      IMPORTING i_agency_id     TYPE /dmo/agency_id
      RETURNING VALUE(r_agency) TYPE /dmo/agency
      RAISING   zcx_jfmv_no_agency.
ENDCLASS.



CLASS zcl_jfmv_agency_model IMPLEMENTATION.

  METHOD get_agency.

    SELECT SINGLE FROM /dmo/agency
      FIELDS *
      WHERE  agency_id = @i_agency_id
      INTO @r_agency.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcx_jfmv_no_agency
        EXPORTING textid    = zcx_jfmv_no_agency=>no_agency
                  agency_id = i_agency_id.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
