
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
1. Run the script in container to update system password and create the user via `docker exec lab_oracle ./init.sh`

Steps 1 and 2 only needed to run once, while steps between 3 and 5 are needed to run for any new container.

Note that there is a default directory called "data" in this repo, which is used to synchronize files between the container and your local machine.


## Running

To access Oracle Database in the running container, run code below with the created user name and password:

```sh
docker exec -it lab_oracle bash -c "sqlplus demo/tiger@//localhost:1521/XE"
```

To load data, you can create the SQL script and put it into "data/". For example, you can run `start /data/sample.sql` in SQL\*Plus to load the sample data.

### Start

If the running container is exited unintentionally, rerun `docker-compose up -d` to take previous container back to run. However, if the previous container is deleted accidentally, rerun the _Initialization_ steps are necessary.


## Clean-up

If you would like to remove the container, simply run `docker-compose down` would delete the container. Nevertheless, files kept in the synchronized directory would still exist.

Run `docker rmi customized-oracle` if you also want to the customized image


## Troubleshoot

If encountered issue “ERROR: ORA-12547: TNS :lost contact” when try to switch the user in SQL\*Plus, exit the SQL\*Plus then run Linux command below:
run script below to fix:

```sh
cd $ORACLE_HOME/bin
ls -ltr oracle

chmod 6751 $ORACLE_HOME/bin/oracle
ls -ltr oracle
```
