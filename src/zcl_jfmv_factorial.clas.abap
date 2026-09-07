CLASS zcl_jfmv_factorial DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS: calculate_factorial IMPORTING i_number           TYPE i
                                       RETURNING VALUE(r_factorial) TYPE i
                                       RAISING   zcx_c_abapd_factorial_neg.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jfmv_factorial IMPLEMENTATION.
  METHOD calculate_factorial.
    IF i_number < 0.
      RAISE EXCEPTION TYPE zcx_c_abapd_factorial_neg.
    ENDIF.
    IF i_number = 0.
      r_factorial = 1.
    ELSE.
      TRY.
          r_factorial = 1.

          DO i_number TIMES.
            r_factorial = r_factorial * sy-index.
          ENDDO.

        CATCH cX_SY_ARITHMETIC_OVERFLOW INTO DATA(lx_arith).

      ENDTRY.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
