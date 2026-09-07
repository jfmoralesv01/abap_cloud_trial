CLASS zcl_jfmv_passenger_flight DEFINITION
  PUBLIC
  INHERITING FROM zcl_jfmv_flight
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: constructor IMPORTING carrier_Id    TYPE /dmo/carrier_id
                                   connection_Id TYPE /dmo/connection_id
                                   plane_type    TYPE /dmo/plane_type_id
                         RAISING   zcx_c_abapd_no_connection.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA seats_max TYPE /dmo/plane_seats_max.
ENDCLASS.



CLASS zcl_jfmv_passenger_flight IMPLEMENTATION.
  METHOD constructor.

    super->constructor( carrier_id = carrier_id connection_id = connection_id plane_type = plane_type ).

    SELECT SINGLE
        FROM zi_cabapd_passenger
        FIELDS MaximumSeats
        WHERE PlaneType = @plane_type
        INTO @seats_max.

    IF sy-subrc NE 0.
      RAISE EXCEPTION TYPE zcx_c_abapd_no_connection
        MESSAGE e002(zcm_abap_jfmv) WITH plane_type.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
