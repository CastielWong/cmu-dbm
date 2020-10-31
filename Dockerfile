
FROM castielwong/oracle-database:11.2.0.2-xe

ENV SYSTEM_PASSWORD=Password123
ENV USER_NAME=demo
ENV USER_PASSWORD=lab_pwd

# fix the EROOR "ORA-12547: TNS:lost contact"
RUN chmod 6751 $ORACLE_HOME/bin/oracle

WORKDIR /cmu_dbm

COPY init.sh init.sh
RUN chmod +x init.sh
