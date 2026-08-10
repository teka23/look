# The name of this view in Looker is "Employment"
view: employment {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: crunchbase.employment ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Company Permalink" in Explore.

  dimension: company_permalink {
    type: string
    sql: ${TABLE}.company_permalink ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_past {
    type: yesno
    sql: ${TABLE}.is_past ;;
  }

  dimension: permalink {
    type: string
    sql: ${TABLE}.permalink ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
  measure: count {
    type: count
  }
}
