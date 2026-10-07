@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cargo Insurance Invoice Data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CARGO_INVOICE_DATA
  as select from    ZI_INSURANCE                  as Insurance
    left outer join I_BillingDocumentBasic        as Billing  on  Billing.CompanyCode                =       Insurance.Companycode
                                                              and Billing.BillingDocumentDate        between Insurance.Fromdate and Insurance.Todate
                                                              and Billing.YY1_InsuranceApplicabl_BDH is not initial
    left outer join ZI_CargoMatDescription        as Desc     on Desc.BillingDocument = Billing.BillingDocument
    left outer join I_IN_ElectronicDocTransptRegn as EwayBill on EwayBill.ElectronicDocSourceKey = Billing.BillingDocument


{
  key            Insurance.Companycode,
  key            Insurance.Policyno,
  key            Billing.BillingDocument                                                                              as InvoiceNo,
                 Billing. DocumentReferenceID,
                 @Semantics.amount.currencyCode: 'TransactionCurrency'
                 Insurance.Sumassured                                                                                 as total_PolicyAmount,
                 cast( '' as abap.dats )                                                                              as InsuranceDate,
                 cast( '' as abap.char( 30 ) )                                                                        as EndorsementNo,
                 //              Billing._ItemBasic.BillingDocumentItemText                                                           as DescriptionOfCargo,
                 Desc.DescriptionOfCargo,
                 Billing.YY1_VehNum_BDH                                                                               as VehicleNo,
                 EwayBill.IN_ElectronicDocEWbillNmbr                                                                  as EwayBillNo,
                 Billing.BillingDocumentDate                                                                          as InvoiceDate,
                 //              Billing._ItemBasic._Plant._StandardOrganizationAddress.CityName                                      as from_Address,
                 //              Billing._ItemBasic._BillToParty._AddressDefaultRepresentation.CityName                               as To_Address,
                 Desc.from_Address,
                 Desc.To_Address,
                 @Semantics.amount.currencyCode: 'TransactionCurrency'
                 cast( Billing.TotalTaxAmount as abap.dec(13,2))  +  cast( Billing.TotalNetAmount as  abap.dec(13,2)) as InvoiceValue,
                 Billing.TransactionCurrency,
                 cast( 0 as abap.dec(13,2))                                                                           as Additional10,
                 cast( 0 as abap.dec(13,2))                                                                           as Declaration_Amount,
                 cast( '' as abap.char( 30 ))                                                                         as EndorsementSumInsured,
                 @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_CALCULATION'
                 cast( 0 as abap.dec(13,2))                                                                           as TotalInsuredamount







}
