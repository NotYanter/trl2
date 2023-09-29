CLASS lhc_ZR_YW1503_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZR_YW1503_Travel RESULT result.
    METHODS show_test_message FOR MODIFY
      IMPORTING keys FOR ACTION travel~show_test_message.
    METHODS cancel_booking FOR MODIFY
      IMPORTING keys FOR ACTION travel~cancel_booking.
    METHODS maintain_booking_fees FOR MODIFY
      IMPORTING keys FOR ACTION travel~maintain_booking_fees.

ENDCLASS.

CLASS lhc_ZR_YW1503_Travel IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD show_test_message.

  DATA(message) = new zcm_YW1503_travel(
        i_textid     = ZCM_YW1503_Travel=>test_message
       i_severity   = if_abap_behv_message=>severity-information

       i_user_name = sy-uname ).

     APPEnd message to reported-%other.

  ENDMETHOD.

  METHOD cancel_booking.

    "Ausgewählte Daten (Reisen) lesen
    READ ENTITY IN LOCAL MODE ZR_YW1503_Travel
        FIELDS ( TravelUuid Status )
        WITH CORRESPONDING #( keys )
        RESULT DATA(travels).


    "Validierung

          LOOP AT travels REFERENCE INTO data(travel).
            if travel->Status = 'X'.
             DATA(MESSAGE) = new zcm_yw1503_travel(
             i_textid    = zcm_yw1503_travel=>travel_cancelled_successfully
             i_severity  =  if_abap_behv_message=>severity-success
             i_travel = travel->Description ).
             APPEND VALUE #( %tky = travel->%tky %msg = message ) to reported-travel.
             APPEND value #( %tky = travel->%tky ) TO failed-travel.
          CONTINUE.
          ENDIF.

        "Daten (Reisen) ändern und ggf. Nachrichten erzeugen
         travel->Status = 'X'.


        "DAten (Reisen) ändern und ggbfs. nachrichten erzeugen
        travel->Status = 'X'.

        MESSAGE = new zcm_yw1503_travel(
        i_textid    = zcm_yw1503_travel=>travel_cancelled_successfully
          i_severity  =  if_abap_behv_message=>severity-success
        i_travel = travel->Description ).
        APPEND VALUE #( %tky = travel->%tky %msg = message ) to reported-travel.






        "Daten (Reisen) zurückschreiben
        MODIFY ENTITY IN LOCAL MODE ZR_YW1503_Travel
            UPDate FIELDS (  Status )
            WITH VALUE #( ( %tky = travel->%tky Status = travel->Status ) ).

    ENDLOOP.


  ENDMETHOD.

  METHOD maintain_booking_fees.

    READ ENTITY IN LOCAL MODE ZR_YW1503_Travel
        FIELDS (  TravelUuid )
        WITH CORRESPONDING #( keys )
        RESULT DATA(travels).


        LOOP AT travels REference INTO DATA(travel).

            travel->BookingFee = keys[ sy-tabix ]-%param-BookingFee.
            travel->CurrencyCode = keys[ sy-tabix ]-%param-CurrencyCode.

            MODIFY entity in local mode ZR_YW1503_Travel
                update fields (  BookingFee CurrencyCode )
                with value #(  ( %tky = travel->%tky
                                 BookingFee = travel->BookingFee
                                 CurrencyCode = travel->CurrencyCode  ) ).

        ENDLOOP.


  ENDMETHOD.

ENDCLASS.
