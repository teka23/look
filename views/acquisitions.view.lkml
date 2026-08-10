# The name of this view in Looker is "Acquisitions"
view: acquisitions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: crunchbase.acquisitions ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: acquired {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.acquired_at ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Acquired By Permalink" in Explore.

  dimension: acquired_by_permalink {
    type: string
    sql: ${TABLE}.acquired_by_permalink ;;
  }

  dimension: acquired_permalink {
    type: string
    sql: ${TABLE}.acquired_permalink ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: price_amount {
    type: number
    sql: ${TABLE}.price_amount ;;
  }
  measure: count {
    type: count
  }
}
