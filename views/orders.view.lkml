view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    label: "{{ forecast_version_one._parameter_value | remove: \"'\" | replace: 'p', '+' }} FC 000"
    type: count
    drill_fields: [detail*]
  }
  parameter: forecast_version_one {
    hidden: no
    # label: "FC Version Picker 1"
    default_value: "Select FC - Picker 1"
    # view_label: "Metrics - Full Year"
    type: string

    allowed_value: {
      label: "1 + 11"
      value: "1p11"
    }
    allowed_value: {
      label: "2 + 10"
      value: "2p10"
    }
    allowed_value: {
      label: "3 + 9"
      value: "3p9"
    }
    allowed_value: {
      label: "4 + 8"
      value: "4p8"
    }
    allowed_value: {
      label: "5 + 7"
      value: "5p7"
    }
    allowed_value: {
      label: "6 + 6"
      value: "6p6"
    }
    #test
    allowed_value: {
      label: "7 + 5"
      value: "7p5"
    }
    allowed_value: {
      label: "8 + 4"
      value: "8p4"
    }
    allowed_value: {
      label: "9 + 3"
      value: "9p3"
    }
    allowed_value: {
      label: "10 + 2"
      value: "10p2"
    }
    allowed_value: {
      label: "11 + 1"
      value: "11p1"
    }
    allowed_value: {
      label: "BUDGET"
      value: "BUDGET"
    }
  }
  dimension: forecast_version_one_filter {
    type: string
    sql: {% if forecast_version_one._parameter_value == '1p11' %}
      ${created_date}
    {% elsif forecast_version_one._parameter_value == '2p10' %}
      ${created_month}
    {% else %}
      ${created_date}
    {% endif %};;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
