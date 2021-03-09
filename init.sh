#!/bin/bash

# make sure the background process is up before running command below
su -p oracle -c "sqlplus / as sysdba << EOF
        ALTER USER SYS IDENTIFIED BY "${SYSTEM_PASSWORD}";
        ALTER USER SYSTEM IDENTIFIED BY "${SYSTEM_PASSWORD}";

        CREATE USER "${USER_NAME}" IDENTIFIED BY "${USER_PASSWORD}";
        GRANT DBA TO "${USER_NAME}";
        exit;
EOF"
