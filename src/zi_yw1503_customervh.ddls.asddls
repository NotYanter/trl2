@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_YW1503_CustomerVH 
    as select from ZI_YW1503_Customer
{
    key CustomerId,
    FirstName,
    LastName,
    Title,
    Street,
    PostalCode,
    City,
    CountryCode
}
