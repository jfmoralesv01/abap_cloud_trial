CLASS LHC_ZR_ZJFMVTRAVEL DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrZjfmvtravel
        RESULT result,
      setInitialStatus FOR DETERMINE ON SAVE
            keys FOR ZrZjfmvtravel~setInitialStatus.
ENDCLASS.

CLASS LHC_ZR_ZJFMVTRAVEL IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD setInitialStatus.

    READ ENTITIES OF zr_zjfmvtravel IN LOCAL MODE
        ENTITY ZrZjfmvtravel
          FIELDS ( Status )
          WITH CORRESPONDING #( keys )
        RESULT DATA(travels).

    DELETE travels WHERE Status IS NOT INITIAL.
    CHECK travels IS NOT INITIAL.

    MODIFY ENTITIES OF zr_zjfmvtravel IN LOCAL MODE
      ENTITY ZrZjfmvtravel
        UPDATE FIELDS ( Status )
        WITH VALUE #( FOR travel IN travels
                      ( %tky   = travel-%tky
                        Status = 'N' ) )
      REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).

  ENDMETHOD.

ENDCLASS.
