view: demotable {
  sql_table_name: demo_db.demotable ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: formasa_5091_formasa_eerste_zendtijd {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.formasa_5091_formasa_eerste_zendtijd ;;
  }
  dimension: formasa_5091_item_name {
    type: string
    sql: ${TABLE}.formasa_5091_item_name ;;
  }
  measure: count {
    type: count
    drill_fields: [id, formasa_5091_item_name]
  }
}
