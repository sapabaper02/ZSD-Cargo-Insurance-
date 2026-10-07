@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Insurance Report'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zc_insurance_report
  provider contract transactional_query
  as projection on ZI_INSURANCE_DATA
{
  key    Companycode,
  key    Fromdate,
  key    Todate,
         Policyno,
         @Semantics.amount.currencyCode: 'Currency'
         Sumassured,
         Currency
}
