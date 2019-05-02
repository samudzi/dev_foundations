view: user_order_detail {
  derived_table: {
    #persist_for: "48 hours"
    #distribution_style: even
    #sortkeys: ["EMAIL"]
    sql: SELECT
        EMAIL
        , COUNT(DISTINCT NAME) AS lifetime_orders
        , SUM(TOTAL) AS lifetime_revenue
        , MIN(CREATED_AT) AS first_order_date
        , MAX(CREATED_AT) AS latest_order_date
      FROM OARS_AND_ALPS
      GROUP BY EMAIL;;
  }

  dimension: email {
    primary_key: yes
    type: number
    sql: ${TABLE}.email ;;
  }

  dimension: lifetime_orders {
    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }

  dimension_group: first_order {
    type: time
    sql: ${TABLE}.first_order_date ;;
  }

  dimension_group: latest_order {
    type: time
    sql: ${TABLE}.latest_order_date ;;
  }

  dimension: lifetime_orders_tiered {
    type: tier
    tiers: [1,2,3,4,5,6,7,8,9,10]
    style: integer
    sql: ${TABLE}.lifetime_orders ;;
  }

  dimension: lifetime_revenue_tiered {
    type: tier
    tiers: [0,5,20,50,100,500,1000,10000]
    style: integer
    sql: ${lifetime_revenue};;
    value_format: "$#.00;($#.00)"
    drill_fields: [users.traffic_sources]
  }

  dimension: number_of_distinct_months_with_orders {
    type: number
    sql: ${TABLE}.number_of_distinct_months_with_orders ;;
  }

  dimension: lifetime_revenue {
    type: number
    sql: ${TABLE}.lifetime_revenue ;;
    value_format: "$#.00;($#.00)"
  }

  dimension_group: first_order_date {
    type: time
    sql: ${TABLE}.first_order_date ;;
  }

  dimension_group: latest_order_date {
    type: time
    sql: ${TABLE}.latest_order_date ;;
  }

  dimension: days_since_latest_order{
    type: duration_day
    sql_start: ${latest_order_date};;
    sql_end: CURRENT_DATE;;
  }

  dimension: is_active {
    type: yesno
    sql: ${days_since_latest_order} < 90 ;;
  }

  dimension: is_repeat_customer {
    type: yesno
    sql: ${lifetime_orders} > 1 ;;
  }


  measure: total_lifetime_orders {
    type: sum
    sql: ${lifetime_orders} ;;
    drill_fields: [detail*]
  }


  measure: average_lifetime_orders {
    type: average
    sql: ${lifetime_orders} ;;
    drill_fields: [detail*]
  }

  measure: percent_of_users_who_repeat {
    type: number
    sql: 1.0*${is_repeat_customer_count}/${user_count}  ;;
    value_format: "#.0%"
  }

  measure: total_lifetime_revenue {
    type: sum
    sql: ${lifetime_revenue} ;;
    drill_fields: [detail*]
    value_format: "$#,##0.00;($#,##0.00)"
  }

  measure: average_lifetime_revenue {
    type: average
    sql: ${lifetime_revenue} ;;
    drill_fields: [detail*]
    value_format: "$#,##0.00;($#,##0.00)"
  }

  measure: average_days_since_latest_order{
    type: average
    sql: ${days_since_latest_order} ;;
    value_format: "0"
  }

  measure: is_repeat_customer_count {
    type: count
    filters: {
      field: is_repeat_customer
      value: "Yes"
    }
  }

  measure: average_items_per_order {
    type: number
    sql:  ;;
  }


  measure: active_user_count {
    type: count
    #sql: ${is_active} ;;
    filters: {
      field: is_active
      value: "Yes"
    }
  }

  measure: percent_users_still_active {
    type: number
    sql: 1.0*${active_user_count}/${user_count} ;;
    value_format: "#.0%"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: user_count {
    type: count_distinct
    sql: ${email} ;;
  }

  set: detail {
    fields: [
      email,
      lifetime_orders,
      lifetime_revenue,
      first_order_time,
      latest_order_time,
      number_of_distinct_months_with_orders
    ]
  }
}
