@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel'
define root view entity ZR_YW1503_Travel 
    as select from zyw1503_atravel
    composition [0..*] of ZR_YW1503_Booking as _Bookings
    association to ZI_YW1503_CustomerText as _CustomerText on zyw1503_atravel.customer_id = _CustomerText.CustomerId
    
{
    key travel_uuid as TravelUuid,
    travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    status as Status,
    
    /* Admin Data */
    
   @EndUserText: { label: 'Created By', quickInfo: 'Created By' }
   @Semantics.user.createdBy: true
    createdby as Createdby,
    @EndUserText: { label: 'Created at', quickInfo: 'Created At' }
    @Semantics.systemDateTime.createdAt: true
    createdat as Createdat,
    @EndUserText: { label: 'Last changed by', quickInfo: 'Last changed by' }
    @Semantics.user.createdBy: true
    lastchangedby as Lastchangedby,
    @EndUserText: { label: 'Last changed At', quickInfo: 'Last changed by' }
    @Semantics.systemDateTime.createdAt: true
    lastchangedat as Lastchangedat,
    
    
    /* Transient Data */
    
    case status when 'N' then 5
                when 'B' then 3
                when 'P' then 0
                when 'X' then 1
                else 2
                
    end as StatusCriticality,
    
    case when dats_days_between($session.system_date,begin_date) >= 14 then 3
         when dats_days_between($session.system_date,begin_date) >= 7 then 2
         when dats_days_between($session.system_date,begin_date) >= 0 then 1
         else 0
    end as BeginDateCriticality, 
    
    
    /* Assosiactions */
    _Bookings,
    _CustomerText
    
    
}
