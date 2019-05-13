view: oars_and_alps {
  sql_table_name: OARS_AND_ALPS.OARS_AND_ALPS ;;

  dimension: id {
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension: first_order_items {
    type: string
    sql:  (select ${lineitem_sku} from ${TABLE} where ${order_patterns.order_sequence_number} = 1);;
  }

  dimension: accepts_marketing {
    type: string
    sql: ${TABLE}.ACCEPTS_MARKETING ;;
  }

  dimension: billing_address_1 {
    type: string
    sql: ${TABLE}.BILLING_ADDRESS_1 ;;
  }

  dimension: billing_address_2 {
    type: string
    sql: ${TABLE}.BILLING_ADDRESS_2 ;;
  }

  dimension: billing_city {
    type: string
    sql: ${TABLE}.BILLING_CITY ;;
  }

  dimension: billing_company {
    type: string
    sql: ${TABLE}.BILLING_COMPANY ;;
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.BILLING_COUNTRY ;;
  }

  dimension: billing_name {
    type: string
    sql: ${TABLE}.BILLING_NAME ;;
  }

  dimension: billing_phone {
    type: string
    sql: ${TABLE}.BILLING_PHONE ;;
  }

  dimension: billing_province {
    type: string
    sql: ${TABLE}.BILLING_PROVINCE ;;
  }

  dimension: billing_street {
    type: string
    sql: ${TABLE}.BILLING_STREET ;;
  }

  dimension: billing_zip {
    type: string
    sql: ${TABLE}.BILLING_ZIP ;;
  }

  dimension: cancelled_at {
    type: string
    sql: ${TABLE}.CANCELLED_AT ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.CREATED_AT ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.CURRENCY ;;
  }

  dimension: device_id {
    type: string
    sql: ${TABLE}.DEVICE_ID ;;
  }

  dimension: discount_amount {
    type: string
    sql: ${TABLE}.DISCOUNT_AMOUNT ;;
  }

  dimension: discount_code {
    type: string
    sql: ${TABLE}.DISCOUNT_CODE ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
    primary_key: yes
  }

  dimension: employee {
    type: string
    sql: ${TABLE}.EMPLOYEE ;;
  }

  dimension: financial_status {
    type: string
    sql: ${TABLE}.FINANCIAL_STATUS ;;
  }

  dimension: fulfilled_at {
    type: string
    sql: ${TABLE}.FULFILLED_AT ;;
  }

  dimension: fulfillment_status {
    type: string
    sql: ${TABLE}.FULFILLMENT_STATUS ;;
  }

  dimension: lineitem_compare_at_price {
    type: string
    sql: ${TABLE}.LINEITEM_COMPARE_AT_PRICE ;;
  }

  dimension: lineitem_discount {
    type: string
    sql: ${TABLE}.LINEITEM_DISCOUNT ;;
  }

  dimension: lineitem_fulfillment_status {
    type: string
    sql: ${TABLE}.LINEITEM_FULFILLMENT_STATUS ;;
  }

  dimension: lineitem_name {
    type: string
    sql: ${TABLE}.LINEITEM_NAME ;;
  }

  dimension: lineitem_price {
    type: string
    sql: ${TABLE}.LINEITEM_PRICE ;;
  }

  dimension: lineitem_quantity {
    type: string
    sql: ${TABLE}.LINEITEM_QUANTITY ;;
  }

  dimension: lineitem_requires_shipping {
    type: yesno
    sql: ${TABLE}.LINEITEM_REQUIRES_SHIPPING ;;
  }

  dimension: lineitem_sku {
    type: string
    sql: ${TABLE}.LINEITEM_SKU ;;
  }

  filter: deo_kit_skus {
    type: string
  }

  filter: deo_stick_skus {
    type: string
  }

  dimension: is_deo_kit {
    type: yesno
    sql: sql: {% condition deo_kit_skus %} ${lineitem_sku} {% endcondition %} ;;
  }

  dimension: is_deo_stick {
    type: yesno
    sql: sql: {% condition deo_stick_skus %} ${lineitem_sku} {% endcondition %} ;;
  }

  dimension: lineitem_taxable {
    type: yesno
    sql: ${TABLE}.LINEITEM_TAXABLE ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.LOCATION ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: note_attributes {
    type: string
    sql: ${TABLE}.NOTE_ATTRIBUTES ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: outstanding_balance {
    type: string
    sql: ${TABLE}.OUTSTANDING_BALANCE ;;
  }

  dimension_group: paid {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.PAID_AT ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}.PAYMENT_METHOD ;;
  }

  dimension: payment_reference {
    type: string
    sql: ${TABLE}.PAYMENT_REFERENCE ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.PHONE ;;
  }

  dimension: receipt_number {
    type: string
    sql: ${TABLE}.RECEIPT_NUMBER ;;
  }

  dimension: refunded_amount {
    type: string
    sql: ${TABLE}.REFUNDED_AMOUNT ;;
  }

  dimension: risk_level {
    type: string
    sql: ${TABLE}.RISK_LEVEL ;;
  }

  dimension: shipping {
    type: string
    sql: ${TABLE}.SHIPPING ;;
  }

  dimension: shipping_address_1 {
    type: string
    sql: ${TABLE}.SHIPPING_ADDRESS_1 ;;
  }

  dimension: shipping_address_2 {
    type: string
    sql: ${TABLE}.SHIPPING_ADDRESS_2 ;;
  }

  dimension: shipping_city {
    type: string
    sql: ${TABLE}.SHIPPING_CITY ;;
  }

  dimension: shipping_company {
    type: string
    sql: ${TABLE}.SHIPPING_COMPANY ;;
  }

  dimension: shipping_country {
    type: string
    sql: ${TABLE}.SHIPPING_COUNTRY ;;
  }

  dimension: shipping_method {
    type: string
    sql: ${TABLE}.SHIPPING_METHOD ;;
  }

  dimension: shipping_name {
    type: string
    sql: ${TABLE}.SHIPPING_NAME ;;
  }

  dimension: shipping_phone {
    type: string
    sql: ${TABLE}.SHIPPING_PHONE ;;
  }

  dimension: shipping_province {
    type: string
    sql: ${TABLE}.SHIPPING_PROVINCE ;;
  }

  dimension: shipping_street {
    type: string
    sql: ${TABLE}.SHIPPING_STREET ;;
  }

  dimension: shipping_zip {
    type: string
    sql: ${TABLE}.SHIPPING_ZIP ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.SOURCE ;;
  }

  dimension: subtotal {
    type: string
    sql: ${TABLE}.SUBTOTAL ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.TAGS ;;
  }

  dimension: tax_1_name {
    type: string
    sql: ${TABLE}.TAX_1_NAME ;;
  }

  dimension: tax_1_value {
    type: string
    sql: ${TABLE}.TAX_1_VALUE ;;
  }

  dimension: tax_2_name {
    type: string
    sql: ${TABLE}.TAX_2_NAME ;;
  }

  dimension: tax_2_value {
    type: string
    sql: ${TABLE}.TAX_2_VALUE ;;
  }

  dimension: tax_3_name {
    type: string
    sql: ${TABLE}.TAX_3_NAME ;;
  }

  dimension: tax_3_value {
    type: string
    sql: ${TABLE}.TAX_3_VALUE ;;
  }

  dimension: tax_4_name {
    type: string
    sql: ${TABLE}.TAX_4_NAME ;;
  }

  dimension: tax_4_value {
    type: string
    sql: ${TABLE}.TAX_4_VALUE ;;
  }

  dimension: tax_5_name {
    type: string
    sql: ${TABLE}.TAX_5_NAME ;;
  }

  dimension: tax_5_value {
    type: string
    sql: ${TABLE}.TAX_5_VALUE ;;
  }

  dimension: taxes {
    type: string
    sql: ${TABLE}.TAXES ;;
  }

  dimension: total {
    type: string
    sql: ${TABLE}.TOTAL ;;
  }

  dimension: vendor {
    type: string
    sql: ${TABLE}.VENDOR ;;
  }

  dimension: months_since_signup {
    type: duration_month
    sql_start: ${TABLE}.CREATED_AT ;;
    sql_end: current_date ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      lineitem_name,
      billing_name,
      shipping_name,
      tax_1_name,
      tax_2_name,
      tax_3_name,
      tax_4_name,
      tax_5_name
    ]
  }
}
