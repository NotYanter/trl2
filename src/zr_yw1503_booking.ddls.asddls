@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
define view entity ZR_YW1503_Booking 
as select from zyw1503_abooking
 association to parent ZR_YW1503_Travel as _Travel
   on $projection.TravelUuid = _Travel.TravelUuid
{
@EndUserText: { label: 'Booking UUID', quickInfo: 'Booking UUid' }
    key booking_uuid as BookingUuid,
    @EndUserText: { label: 'Booking UUID', quickInfo: 'Booking UUid' }
    travel_uuid as TravelUuid,
    booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    
    /* Assosiactions */
    _Travel // Make association public
}
