# The name of this view in Looker is "Companies"
view: companies {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: crunchbase.companies ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Blog URL" in Explore.

  dimension: blog_url {
    type: string
    sql: ${TABLE}.blog_url ;;
  }

  dimension: category_code {
    type: string
    sql: ${TABLE}.category_code ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: crunchbase_url {
    type: string
    sql: ${TABLE}.crunchbase_url ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension_group: founded {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.founded_at ;;
  }

  dimension: full_record {
    type: yesno
    sql: ${TABLE}.full_record ;;
  }

  dimension: homepage_url {
    type: string
    sql: ${TABLE}.homepage_url ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: overview {
    type: string
    sql: ${TABLE}.overview ;;
  }

  dimension: permalink {
    type: string
    sql: ${TABLE}.permalink ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: twitter_username {
    type: string
    sql: ${TABLE}.twitter_username ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }
  measure: count {
    type: count
    drill_fields: [twitter_username, name]
  }
}
