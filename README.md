
This repo is used to customize the Oracle Database environment in Docker for the CMU course Database Management (95-703).

## Initialization

Clone this repo then change directory to it:

```sh
git clone https://github.com/CastielWong/cmu-dbm.git
cd cmu-dbm
```

Steps below are used to create the customized image and initialize the container:

1. Build up the customized image via `docker-compose build`
1. Config the system password and a customized user in "Dockerfile", whose default values are:
    - `SYSTEM_PASSWORD`: Password123
    - `USER_NAME`: demo
    - `USER_PASSWORD`: tiger 
1. Run the container at the background through `docker-compose up -d`
1. Wait for a while, since it would normally need 40 to 60 seconds for Oracle Database instance to start
1. Run the script in container to update system password and create the user via `docker exec demo_oracle ./init.sh`
1. Log in SQLPlus by the user just created to access the container: `docker exec -it demo_oracle bash -c "sqlplus demo/tiger@//localhost:1521/XE"`



## Troubleshoot

If encouter issue like:
"
ERROR:
ORA-12547: TNS:lost contact
",
run script below to fix:

```sh
cd $ORACLE_HOME/bin
ls -ltr oracle

chmod 6751 $ORACLE_HOME/bin/oracle
ls -ltr oracle
```
