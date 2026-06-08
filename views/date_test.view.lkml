view: date_test {
  sql_table_name: demo_db.date_test ;;

  dimension_group: c {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.c ;;
  }
  measure: count {
    type: count
  }
}
