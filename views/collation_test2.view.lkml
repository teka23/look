view: collation_test2 {
  sql_table_name: demo_db.collation_test2 ;;

  dimension: latin_characters {
    type: string
    sql: ${TABLE}.latin_characters ;;
  }
  measure: count {
    type: count
  }
}
