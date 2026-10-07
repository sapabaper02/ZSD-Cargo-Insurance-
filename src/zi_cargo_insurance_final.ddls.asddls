@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cargo Insurance final View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CARGO_INSURANCE_FINAL
  as select from ZI_CARGO_INVOICE_DATA
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
         ( cast( InvoiceValue as abap.dec(13,2)) * cast( 0.10 as  abap.dec(13,2)) ) as Additional10,
         Declaration_Amount,
         EndorsementSumInsured,
         TotalInsuredamount
}
