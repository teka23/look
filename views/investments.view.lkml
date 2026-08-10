# The name of this view in Looker is "Investments"
view: investments {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: crunchbase.investments ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Funding ID" in Explore.

  dimension: funding_id {
    type: number
    sql: ${TABLE}.funding_id ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: investor_permalink {
    type: string
    sql: ${TABLE}.investor_permalink ;;
  }

  dimension: is_company {
    type: yesno
    sql: ${TABLE}.is_company ;;
  }
  measure: count {
    type: count
  }
}
