@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data view for Insurance'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_INSURANCE_DATA
  as select from ZI_INSURANCE
  //composition of target_data_source_name as _association_name
{
  key    Companycode,
  key    Fromdate,
  key    Todate,
         Policyno,
         @Semantics.amount.currencyCode: 'Currency'
         Sumassured,
         Currency
}
