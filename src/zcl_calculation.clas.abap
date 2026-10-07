CLASS zcl_calculation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CALCULATION IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA: lt_calculated TYPE STANDARD TABLE OF zc_cargo_insurance_report.
    DATA : lv_total   TYPE p DECIMALS 2,
           lv_company TYPE bukrs.

    " Assigns data from the original table to the calculated table, maintaining field correspondence.
    lt_calculated = CORRESPONDING #( it_original_data ).
    CLEAR: lv_total,lv_company.

    SORT lt_calculated BY companycode invoiceno invoicedate.
    LOOP AT lt_calculated ASSIGNING FIELD-SYMBOL(<fs_calculated>).

      " Checks if the company code has changed.
      IF lv_company <> <fs_calculated>-companycode.
        CLEAR: lv_total." If it has changed, clears the accumulated total to restart the calculation.
      ENDIF.
      lv_company = <fs_calculated>-companycode.

      " Adds the current declaration amount to the accumulated total.
      lv_total  =  <fs_calculated>-declaration_amount + lv_total.

      " Calculates the total insured amount by subtracting the accumulated total from the total policy amount.
      <fs_calculated>-totalinsuredamount = <fs_calculated>-total_policyamount - lv_total.
    ENDLOOP.
    CLEAR ct_calculated_data.

    " Assigns the calculated data to the output table, maintaining field correspondence.
    ct_calculated_data = CORRESPONDING #( lt_calculated ).
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

  ENDMETHOD.
ENDCLASS.
