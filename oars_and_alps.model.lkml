connection: "oa"

# include all the views
include: "*.view"

datagroup: oars_and_alps_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: oars_and_alps_default_datagroup

explore: oars_and_alps {
  join: user_order_detail {
    type: left_outer
    relationship: many_to_many
    sql_on: ${oars_and_alps.email}=${user_order_detail.email} ;;
  }
  join: order_patterns {
    type: left_outer
    relationship: many_to_many
    sql_on: ${oars_and_alps.email}=${user_order_detail.email} ;;
  }
}
