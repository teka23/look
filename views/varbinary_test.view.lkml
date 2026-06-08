view: varbinary_test {
  sql_table_name: demo_db.varbinary_test ;;

  dimension: c {
    type: string
    sql: ${TABLE}.c ;;
  }
  measure: count {
    type: count
  }
}
