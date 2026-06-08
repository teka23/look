view: tinyint_test {
  sql_table_name: demo_db.tinyint_test ;;

  dimension: c {
    type: yesno
    sql: ${TABLE}.c ;;
  }
  measure: count {
    type: count
  }
}
