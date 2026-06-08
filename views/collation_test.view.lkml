view: collation_test {
  sql_table_name: demo_db.collation_test ;;

  dimension: latin_character {
    type: string
    sql: ${TABLE}.latin_character ;;
  }
  measure: count {
    type: count
  }
}
