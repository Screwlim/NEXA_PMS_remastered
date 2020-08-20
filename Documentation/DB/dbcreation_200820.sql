use pms_dev;

SET foreign_key_checks = 0;
-- DELETE ALL TABLES
SET @tables = NULL;
SELECT GROUP_CONCAT(table_schema, '.', table_name) INTO @tables
  FROM information_schema.tables
  WHERE table_schema = 'pms_dev'; -- specify DB name here.

SET @tables = CONCAT('DROP TABLE ', @tables);
#PREPARE stmt FROM @tables;
#EXECUTE stmt;
#DEALLOCATE PREPARE stmt;

SET foreign_key_checks = 1;

CREATE TABLE USERS(
    ID VARCHAR(50),
    PASSWORD VARCHAR(512),
    EMAIL VARCHAR(80),
    NAME VARCHAR(50),
	COMPANY INT(11),
    DEPARTMENT VARCHAR(50),
    SALT VARCHAR(512),
    TOKEN VARCHAR(512),
    PRIMARY KEY(ID)
);

CREATE TABLE COMPANYS(
	ID INT(11) UNSIGNED AUTO_INCREMENT,
    NAME VARCHAR(50),
    CREATOR VARCHAR(50),
    CREATED DATETIME,
    PRIMARY KEY(ID),
	FOREIGN KEY(CREATOR) REFERENCES USERS (ID)
);

CREATE TABLE STATUS_INFO(
    STATUS INT(1),
	DESCRIPTION VARCHAR(20),
    PRIMARY KEY(STATUS)
);

INSERT STATUS_INFO VALUES(-2, "DELAYED");
INSERT STATUS_INFO VALUES(-1, "CALCELED");
INSERT STATUS_INFO VALUES(0, "ONGOING");
INSERT STATUS_INFO VALUES(1, "COMPLETED");

CREATE TABLE PROJECTS(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    NAME VARCHAR(200),
    CREATOR varchar(50),
    START DATETIME,
    END DATETIME,
    DESCRIPTION VARCHAR(512),
    NUM_TASKS INT(10),
    NUM_DONE_TASKS INT(10),
    STATUS INT(1),
    FOREIGN KEY(STATUS) REFERENCES STATUS_INFO (STATUS),
    FOREIGN KEY(CREATOR) REFERENCES USERS (ID),
    PRIMARY KEY(ID)
);

CREATE TABLE INVITES (
    PROJECT_ID INT(11),
    SEND_USER_ID VARCHAR(50),
    RECV_USER_ID VARCHAR(50),
    ISPM BOOLEAN,
    PRIMARY KEY(PROJECT_ID, SEND_USER_ID, RECV_USER_ID)
);

CREATE TABLE ATTENDANCES(
    PROJECT_ID INT(11) UNSIGNED,
    USER_ID VARCHAR(50),
    ISPM BOOLEAN,
    ROLE VARCHAR(200),
    FOREIGN KEY (USER_ID) REFERENCES USERS (ID),
    FOREIGN KEY (PROJECT_ID) REFERENCES PROJECTS (ID),
    PRIMARY KEY(PROJECT_ID, USER_ID)
);

CREATE TABLE NOTICES(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    PROJECT_ID INT(11) UNSIGNED,
    TITLE VARCHAR(200),
    CONTENT VARCHAR(512),
    WRITER VARCHAR(50),
    CREATED DATETIME,
    STATUS INT(1),
    FOREIGN KEY (PROJECT_ID) REFERENCES PROJECTS (ID),
    FOREIGN KEY (WRITER) REFERENCES USERS (ID),
    FOREIGN KEY (STATUS) REFERENCES STATUS_INFO (STATUS),
    PRIMARY KEY(ID)
);

CREATE TABLE JOBS(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    PROJECT_ID INT(11) UNSIGNED,
    TITLE VARCHAR(200),
    START DATETIME,
    END DATETIME,
    CREATED DATETIME,
    DESCRIPTION VARCHAR(512),
    WRITER VARCHAR(50),
    NUM_TASKS INT(10),
    NUM_DONE_TASKS INT(10),
    STATUS INT(1),
    FOREIGN KEY (PROJECT_ID) REFERENCES PROJECTS (ID),
    FOREIGN KEY (WRITER) REFERENCES USERS (ID),
    FOREIGN KEY (STATUS) REFERENCES STATUS_INFO (STATUS),
    PRIMARY KEY(ID)
);

CREATE TABLE TASKS(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    JOB_ID INT(11) UNSIGNED,
    TITLE VARCHAR(200),
    START DATETIME,
    END DATETIME,
    CREATED DATETIME,
    DESCRIPTION VARCHAR(512),
    WRITER VARCHAR(50),
    WEIGHT INT(10),
    STATUS INT(1),
    FOREIGN KEY (JOB_ID) REFERENCES JOBS (ID),
    FOREIGN KEY (WRITER) REFERENCES USERS (ID),
    FOREIGN KEY (STATUS) REFERENCES STATUS_INFO (STATUS),
    PRIMARY KEY(ID)
);

CREATE TABLE ACTIVITYS(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    TASK_ID INT(11) UNSIGNED,
    TITLE VARCHAR(200),
    START DATETIME,
    END DATETIME,
    CREATED DATETIME,
    DESCRIPTION VARCHAR(512),
    WRITER VARCHAR(50),
    STATUS INT(1),
    FOREIGN KEY (TASK_ID) REFERENCES TASKS (ID),
    FOREIGN KEY (WRITER) REFERENCES USERS (ID),
    FOREIGN KEY (STATUS) REFERENCES STATUS_INFO (STATUS),
    PRIMARY KEY(ID)
);

CREATE TABLE COMMENT_NOTICES(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    NOTICE_ID INT(11) UNSIGNED,
    WRITER VARCHAR(50),
    CONTENT VARCHAR(512),
    CREATED DATETIME,
    STATUS INT(1),
    FOREIGN KEY (NOTICE_ID) REFERENCES NOTICES (ID),
    FOREIGN KEY (WRITER) REFERENCES USERS (ID),
    FOREIGN KEY (STATUS) REFERENCES STATUS_INFO (STATUS),
    PRIMARY KEY(ID)
);

CREATE TABLE COMMENTS_JOB(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    JOB_ID INT(11) UNSIGNED,
    WRITER VARCHAR(50),
    CONTENT VARCHAR(512),
    CREATED DATETIME,
    STATUS INT(1),
    FOREIGN KEY (JOB_ID) REFERENCES JOBS (ID),
    FOREIGN KEY (WRITER) REFERENCES USERS (ID),
    FOREIGN KEY (STATUS) REFERENCES STATUS_INFO (STATUS),
    PRIMARY KEY(ID)
);

CREATE TABLE COMMENTS_TASK(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    TASK_ID INT(11) UNSIGNED,
    WRITER VARCHAR(50),
    CONTENT VARCHAR(512),
    CREATED DATETIME,
    STATUS INT(1),
    FOREIGN KEY (TASK_ID) REFERENCES TASKS (ID),
    FOREIGN KEY (WRITER) REFERENCES USERS (ID),
    FOREIGN KEY (STATUS) REFERENCES STATUS_INFO (STATUS),
    PRIMARY KEY(ID)
);

CREATE TABLE COMMENTS_ACTIVITY(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    ACTIVITY_ID INT(11) UNSIGNED,
    WRITER VARCHAR(50),
    CONTENT VARCHAR(512),
    CREATED DATETIME,
    STATUS INT(1),
    FOREIGN KEY (ACTIVITY_ID) REFERENCES ACTIVITYS (ID),
    FOREIGN KEY (WRITER) REFERENCES USERS (ID),
    FOREIGN KEY (STATUS) REFERENCES STATUS_INFO (STATUS),
    PRIMARY KEY(ID)
);

CREATE TABLE FILE(
    TYPE CHAR(1),
    SRC INT(11),
    PATH VARCHAR(200)
);