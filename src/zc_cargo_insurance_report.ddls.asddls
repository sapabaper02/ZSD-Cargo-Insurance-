@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cargo Insurance Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_CARGO_INSURANCE_REPORT
  provider contract transactional_query
  as projection on ZI_CARGO_INSURANCE_REPORT
{
  key    Companycode,
  key    Policyno,
  key    InvoiceNo,
         DocumentReferenceID,
         @Semantics.amount.currencyCode: 'TransactionCurrency'
         total_PolicyAmount,
         InsuranceDate,
         EndorsementNo,
         DescriptionOfCargo,
         VehicleNo,
         EwayBillNo,
         InvoiceDate,
         from_Address,
         To_Address,
         InvoiceValue,
         TransactionCurrency,
         Additional10,
         Declaration_Amount,
         EndorsementSumInsured,
         @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_CALCULATION'
         TotalInsuredamount
}
