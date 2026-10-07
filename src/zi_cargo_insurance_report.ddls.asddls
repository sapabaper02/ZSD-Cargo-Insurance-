@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cargo Insurance Root View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CARGO_INSURANCE_REPORT
  as select from ZI_CARGO_INSURANCE_FINAL

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
         ( InvoiceValue + Additional10 ) as Declaration_Amount,
         EndorsementSumInsured,
         TotalInsuredamount
}
