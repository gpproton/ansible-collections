#!/bin/bash

# Initialiazation delay
sleep 120
# Remove old positions
echo 'Start old positions cleanup...'
while [[ "$result" != *" 0 rows affected"* ]]; do
  result=$(mysql -h db -u {{ db_user }} -p{{ db_pass }} {{ db_name }} -vve "DELETE FROM tc_positions WHERE fixTime < DATE(DATE_ADD(NOW(), INTERVAL -{{ backup_time }} MONTH)) AND id NOT IN (SELECT positionId FROM tc_devices WHERE positionid IS NOT NULL) LIMIT {{ db_clean_chunk }}")
  sleep 1
done

# Remove old events
echo 'Start old events cleanup...'
while [[ "$result" != *" 0 rows affected"* ]]; do
  result=$(mysql -h db -u {{ db_user }} -p{{ db_pass }} {{ db_name }} -vve "DELETE FROM tc_events WHERE eventTime < DATE(DATE_ADD(NOW(), INTERVAL -{{ backup_time }} MONTH)) LIMIT {{ db_clean_chunk }}")
  sleep 1
done

# Optimize database
mysqlcheck -h db -os -u {{ db_user }} -p{{ db_pass }} {{ db_name }}
