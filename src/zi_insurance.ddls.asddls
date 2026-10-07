@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Insurance View for Table'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_INSURANCE
  as select from ztable_insurance as Insurance
{
  key companycode as Companycode,
  key fromdate as Fromdate,
  key todate as Todate,
  policyno as Policyno,
  @Semantics.amount.currencyCode: 'Currency'
  sumassured as Sumassured,
  currency as Currency
}
