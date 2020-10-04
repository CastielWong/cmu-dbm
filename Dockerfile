FROM castielwong/oracle-database:11.2.0.2-xe

ARG SYSTEM_PASSWORD=Password123
ENV USER_NAME=demo
ENV USER_PASSWORD=tiger

RUN ./setPassword.sh ${SYSTEM_PASSWORD}


WORKDIR /cmu_dbm
COPY init.sh init.sh
RUN chmod +x init.sh
