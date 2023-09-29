CLASS zcl_yw1503_travel_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_yw1503_travel_generator IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "Deklaration

    DATA travel TYPE zyw1503_atravel.
    DATA travels TYPE TABLE OF zyw1503_atravel.
    DATA booking TYPE zyw1503_abooking.
    DATA bookings TYPE TABLE OF zyw1503_abooking.

    "DBT löschen

    DELETE FROM zyw1503_atravel.
    DELETE FROM zyw1503_abooking.

    out->write( 'hdgfhgdhf' ).

    "Reisedaten erstellen
    travel-client = sy-mandt.
    travel-travel_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
    travel-agency_id = '000001'.
    travel-customer_id = '000064'.
    travel-begin_date = '20230707'.
    travel-end_date = '20230707'.
    travel-description = 'Tagesausflug Hamburg'.
    travel-status = 'B'.
    travel-createdby = sy-uname.
    GET TIME STAMP FIELD travel-createdat.
    travel-lastchangedby = sy-uname.
    GET TIME STAMP FIELD travel-lastchangedat.
    APPEND travel to travels.

    travel-client = sy-mandt.
    travel-travel_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
    travel-agency_id = '000027'.
    travel-customer_id = '000099'.
    travel-begin_date = '20230801'.
    travel-end_date = '20230815'.
    travel-description = 'New York'.
    travel-status = 'B'.
    APPEND travel to travels.

    travel-travel_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
    travel-agency_id = '000012'.
    travel-customer_id = '000099'.
    travel-begin_date = '20231230'.
    travel-end_date = '20240107'.
    travel-description = 'Silvesterausflug nach New York'.
    travel-status = 'P'.
    APPEND travel to travels.

    travel-travel_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
    travel-agency_id = '000026'.
    travel-customer_id = '000099'.
    travel-begin_date = '20231230'.
    travel-end_date = '20240107'.
    travel-description = 'Europareise'.
    travel-status = 'N'.
    APPEND travel to travels.

    "Buchungsdaten erstellen

    booking-client = sy-mandt.
    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    booking-travel_uuid = travels[ 2 ]-travel_uuid.
    booking-booking_date = '20230706'.
    booking-customer_id = travels[ 2 ]-customer_id.
    booking-carrier_id = 'LH'.
    booking-connection_id = '0400'.
    booking-flight_date = travels[ 2 ]-begin_date.
    booking-flight_price = '823.99'.
    booking-currency_code = 'EUR'.
    APPEND booking to bookings.

    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    booking-travel_uuid = travels[ 4 ]-travel_uuid.
    booking-booking_date = '20230706'.
    booking-customer_id = travels[ 4 ]-customer_id.
    booking-carrier_id = 'LH'.
    booking-connection_id = '0401'.
    booking-flight_date = travels[ 4 ]-begin_date.
    booking-flight_price = '1134.44'.
    booking-currency_code = 'EUR'.
    APPEND booking to bookings.

    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    booking-travel_uuid = travels[ 2 ]-travel_uuid.
    booking-booking_date = '20230706'.
    booking-customer_id = travels[ 2 ]-customer_id.
    booking-carrier_id = 'LH'.
    booking-connection_id = '0401'.
    booking-flight_date = travels[ 2 ]-begin_date.
    booking-flight_price = '1134.44'.
    booking-currency_code = 'EUR'.
    APPEND booking to bookings.

    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    booking-travel_uuid = travels[ 4 ]-travel_uuid.
    booking-booking_date = '20230706'.
    booking-customer_id = travels[ 4 ]-customer_id.
    booking-carrier_id = 'LH'.
    booking-connection_id = '0401'.
    booking-flight_date = travels[ 4 ]-begin_date.
    booking-flight_price = '1134.44'.
    booking-currency_code = 'EUR'.
    APPEND booking to bookings.

    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    booking-customer_id = '000128'.
    APPEND booking to bookings.

    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    booking-customer_id = '000129'.
    APPEND booking to bookings.

    "Daten in die DBT einfügen

    INSERT zyw1503_atravel FROM TABLE @travels.
    INSERT zyw1503_abooking FROM TABLE @bookings.




ENDMETHOD.
ENDCLASS.
