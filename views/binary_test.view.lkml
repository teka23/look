view: binary_test {
  sql_table_name: demo_db.binary_test ;;

  dimension: c {
    type: string
    sql: ${TABLE}.c ;;
  }
  measure: count {
    type: count
  }
}
