view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
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
    label:  "Split Dimension  "
    sql:  CASE
            {% parameter split_parameter %}
              WHEN 'no_split'                   THEN CAST("" AS STRING)
              WHEN 'cz'                         THEN CAST(${brand} AS STRING)
              WHEN 'is_subscriber'              THEN CAST(${brand} AS STRING)
              WHEN 'loyal_payer'                THEN CAST(${brand} AS STRING)
              WHEN 'regular_customer'           THEN CAST(${brand} AS STRING)
              WHEN 'tenure'                     THEN CAST(${brand} AS STRING)
          END  ;;
  }
  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
