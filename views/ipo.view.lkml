# The name of this view in Looker is "Ipo"
view: ipo {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: crunchbase.ipo ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Company Permalink" in Explore.

  dimension: company_permalink {
    type: string
    sql: ${TABLE}.company_permalink ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: public {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.public_date ;;
  }

  dimension: stock_symbol {
    type: string
    sql: ${TABLE}.stock_symbol ;;
  }

  dimension: valuation_amount {
    type: number
    sql: ${TABLE}.valuation_amount ;;
  }
  measure: count {
    type: count
  }
}
