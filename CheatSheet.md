
- [System Command](#system-command)
    - [SQL Plus](#sql-plus)
    - [Administrative Command](#administrative-command)
- [DDL](#data-definition-language)
- [DML](#data-manipulation-language)

## System Command

```sql
-- connect to system db administrator
CONNECT / AS sysdba
CONNECT SYSTEM/{password}

CONNECT {user}/{password}

-- unlock an account
ALTER USER {account} ACCOUNT UNLOCK;
-- reset password
ALTER USER {account} IDENTIFIED BY {password};
-- create a new account
CREATE USER {user} IDENTIFIED BY {password};
-- grant full privileges to the database
GRANT DBA TO {user};

-- change the default language
ALTER SESSION SET NLS_LANGUAGE = 'ENGLISH';

SELECT DECODE(parameter, 'NLS_CHARACTERSET', 'CHARACTER SET', 'NLS_LANGUAGE', 'LANGUAGE', 'NLS_TERRITORY', 'TERRITORY') name, value
FROM	v$nls_parameters
WHERE parameter IN ( 'NLS_CHARACTERSET', 'NLS_LANGUAGE', 'NLS_TERRITORY');

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YY';
```

### SQL Plus

```sql
SHOW PAGESIZE
SHOW LINESIZE

SET PAGESIZE 20
SET LINESIZE 120

COLUMN {column_name} FORMAT {format_value}

-- record the session into a file
SPOOL {file}
-- stop recording
SPOOL OUT

-- enable the ECHO setting
SET ECHO ON

-- start script from a file
START {file}
```

### Administrative Command

```sql
SELECT  username, account_status
FROM    DBA_USERS;

SELECT  table_name
FROM    USER_TABLES;

SELECT  sysdate
FROM    Dual;

SELECT  column_name
FROM    all_tab_cols
WHERE   TABLE_NAME=’’;

SELECT  table_name, constraint_name
FROM    USER_CONSTRAINTS;
```


## Data Definition Language

```sql
CREATE TABLE {table} (
    {colA} NUMBER(2),
    {colB} VARCHAR2(10)
);

DROP {table};
```

## Data Manipulation Language

```sql	
INSERT INTO {table} VALUES 
({value1}, 
{value2});

SELECT  {columns}
FROM    {table}
WHERE   {condition};

UPDATE  {table}
SET {assignment}
WHERE   {condition};

DELETE {table} WHERE {condition};
```
