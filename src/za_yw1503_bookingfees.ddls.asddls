@EndUserText.label: 'Booking Fees'
define abstract entity ZA_YW1503_BookingFees
  
  {
  
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee : /dmo/booking_fee;
    CurrencyCode : /dmo/currency_code;
    
    
}
