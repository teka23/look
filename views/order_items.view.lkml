view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  parameter: split_parameter {
    view_label: "Parameters"
    default_value: "no_split"
    allowed_value: {
      label: "No Split"
      value: "no_split"
    }
#  Gray values pennding validation
    allowed_value: {
      label: "CZ"
      value: "cz"
    }
    allowed_value: {
      label: "Is Subscriber"
      value: "is_subscriber"
    }
    allowed_value: {
      label: "Loyal Payer"
      value: "loyal_payer"
    }
    allowed_value: {
      label: "Regular Customer"
      value: "regular_customer"
    }
#    allowed_value: {
#      label: "Source Type"
#      value: "source_type"
#    }
    allowed_value: {
      label: "Tenure"
      value: "tenure"
    }
  }

  dimension: split_dimension {
    view_label: "Parameters"
    type: string
    label:  "Split Dimension"
    sql:  CASE
            WHEN '{% parameter split_parameter %}' = 'no_split'         THEN ""
            WHEN '{% parameter split_parameter %}' = 'cz'               THEN CAST(${products.brand} AS STRING)
            WHEN '{% parameter split_parameter %}' = 'is_subscriber'    THEN CAST(${products.category} AS STRING)
            WHEN '{% parameter split_parameter %}' = 'loyal_payer'      THEN CAST(${products.department} AS STRING)
            WHEN '{% parameter split_parameter %}' = 'regular_customer' THEN CAST(${products.retail_price} AS STRING)
            WHEN '{% parameter split_parameter %}' = 'tenure'           THEN CAST(${products.rank} AS STRING)
            ELSE ""
          END ;;
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
