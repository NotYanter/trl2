@EndUserText.label: 'Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_YW1503_Travel
  provider contract transactional_query
     as projection on ZR_YW1503_Travel
{
   
@EndUserText: { label: 'Travel UUID', quickInfo: 'Travel UUID'}
   
    key TravelUuid,
    TravelId,
    AgencyId,
    @Consumption.valueHelpDefinition: [{ entity: { name:  'ZI_YW1503_CustomerVH', element: 'CustomerId'} }]
    @ObjectModel.text.element: ['CustomerName']
    CustomerId,
    BeginDate,
    EndDate,
    
    BookingFee,
    
    TotalPrice,
    @Consumption.valueHelpDefinition: [{ entity: { name:  'I_CurrencyStdVH', element: 'Currency'} }]
    CurrencyCode,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    Description,
    Status,
    
    /* Admin Data */ 

   Createdby,
    Createdat,
    Lastchangedby,
    Lastchangedat,
    
    
    /* transient Data */
    StatusCriticality,
    BeginDateCriticality,
    _CustomerText.CustomerName as CustomerName, 
    
    /* Assosiactions */
    
    _Bookings : redirected to composition child ZC_YW1503_Booking
}
