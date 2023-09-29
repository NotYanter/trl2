@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Textelement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_YW1503_CustomerText
     as select from ZI_YW1503_Customer
{
    key CustomerId,
    concat_with_space(FirstName, LastName, 1 ) as CustomerName
  }
