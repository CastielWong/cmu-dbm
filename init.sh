#!/bin/bash

su -p oracle -c "sqlplus / as sysdba << EOF
      CREATE USER "${USER_NAME}" IDENTIFIED BY "${USER_PASSWORD}";
      GRANT DBA TO "${USER_NAME}";
      exit;
EOF"
