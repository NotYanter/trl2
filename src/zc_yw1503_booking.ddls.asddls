@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.allowExtensions: true
define view entity ZC_YW1503_Booking
     as projection on ZR_YW1503_Booking

{
    key BookingUuid,
        TravelUuid,
         BookingId,
        BookingDate,
        CustomerId,
        CarrierId,
        ConnectionId,
        FlightDate,
        FlightPrice,
        CurrencyCode,
        
    /* Associations */
    _Travel : redirected to parent ZC_YW1503_Travel 
  
  }
