# The name of this view in Looker is "Competitions"
view: competitions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: crunchbase.competitions ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Competitor Permalink" in Explore.

  dimension: competitor_permalink {
    type: string
    sql: ${TABLE}.competitor_permalink ;;
  }

  dimension: permalink {
    type: string
    sql: ${TABLE}.permalink ;;
  }
  measure: count {
    type: count
  }
}
