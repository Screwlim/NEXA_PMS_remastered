use pms_dev;

SET foreign_key_checks = 0;
-- DELETE ALL TABLES
SET @tables = NULL;
SELECT GROUP_CONCAT(table_schema, '.', table_name) INTO @tables
	FROM information_schema.tables
    WHERE table_schema = 'pms_dev'; -- specify DB name here.

SET @tables = CONCAT('DROP TABLE ', @tables);
PREPARE stmt FROM @tables;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET foreign_key_checks = 1;


CREATE TABLE USERS(
    ID INT(11) auto_increment,
    PASSWORD VARCHAR(512),
    EMAIL VARCHAR(80),
    NAME VARCHAR(50),
	PHONENUMBER VARCHAR(50),
	COMPANYNUMBER VARCHAR(50),
	COMPANY VARCHAR(50),
    POSITION VARCHAR(50),
    PROVIDER VARCHAR(20) default 'local',
    SNSID VARCHAR(30),
	prof_img_url VARCHAR(200) default '../../assets/img/default_prof.png',
    PRIMARY KEY(ID)
);

CREATE TABLE STATUS_INFO(
    STATUS INT(1),
	DESCRIPTION VARCHAR(20),
    PRIMARY KEY(STATUS)
);

INSERT STATUS_INFO VALUES(-2, "CANCELED");
INSERT STATUS_INFO VALUES(-1, "DELAYED");
INSERT STATUS_INFO VALUES(0, "ONGOING");
INSERT STATUS_INFO VALUES(1, "COMPLETED");

CREATE TABLE PROJECTS(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    NAME VARCHAR(200),
    CREATOR VARCHAR(30),
    CREATOR_ID INT(11),
    START_DATE DATETIME,
    END_DATE DATETIME,
    DESCRIPTION VARCHAR(2500),
    NUM_TASKS INT(10),
    NUM_DONE_TASKS INT(10),
    createdAt DATETIME,
    updatedAt DATETIME,
    STATUS INT(1),
    FOREIGN KEY(STATUS) REFERENCES STATUS_INFO (STATUS),
    FOREIGN KEY(CREATOR_ID) REFERENCES USERS (ID),
    PRIMARY KEY(ID)
);

CREATE TABLE INVITES (
    PROJECT_ID INT(11),
    SEND_USER_ID INT(11),
    RECV_USER_ID INT(11),
    ISPM BOOLEAN,
    STATUS INT(1) default 0,
    createdAt DATETIME,
    updatedAt DATETIME,
    PRIMARY KEY(PROJECT_ID, SEND_USER_ID, RECV_USER_ID)
);

CREATE TABLE ATTENDANCES(
    PROJECT_ID INT(11) UNSIGNED,
    USER_ID INT(11),
    ISPM BOOLEAN,
    FOREIGN KEY (USER_ID) REFERENCES USERS (ID),
    FOREIGN KEY (PROJECT_ID) REFERENCES PROJECTS (ID),
    PRIMARY KEY(PROJECT_ID, USER_ID)
);

CREATE TABLE NOTICES(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    PROJECT_ID INT(11) UNSIGNED,
    TITLE VARCHAR(100),
    CONTENT TEXT,
    AUTHOR_ID INT(11),
    AUTHOR VARCHAR(20),
    createdAt DATETIME,
    updatedAt DATETIME,
	FILES INT(11) default 0,
    FOREIGN KEY (PROJECT_ID) REFERENCES PROJECTS (ID),
    FOREIGN KEY (AUTHOR_ID) REFERENCES USERS (ID),
    PRIMARY KEY(ID)
);

CREATE TABLE JOBS(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    PROJECT_ID INT(11) UNSIGNED,
    TITLE VARCHAR(100),
    START_DATE DATETIME,
    END_DATE DATETIME,
    createdAt DATETIME,
    updatedAt DATETIME,
    DESCRIPTION VARCHAR(2500),
    AUTHOR_ID INT(11),
    AUTHOR VARCHAR(20),
    NUM_TASKS INT(10),
    NUM_DONE_TASKS INT(10),
    WEIGHT INT(10),
    STATUS INT(1),
    FOREIGN KEY (PROJECT_ID) REFERENCES PROJECTS (ID),
    FOREIGN KEY (AUTHOR_ID) REFERENCES USERS (ID),
    PRIMARY KEY(ID)
);

CREATE TABLE TASKS(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    JOB_ID INT(11) UNSIGNED,
    TITLE VARCHAR(100),
    START_DATE DATETIME,
    END_DATE DATETIME,
    createdAt DATETIME,
    updatedAt DATETIME,
    DESCRIPTION VARCHAR(2500),
    AUTHOR_ID INT(11),
    AUTHOR VARCHAR(20),
    WEIGHT INT(10),
    STATUS INT(1) default 0,
    FOREIGN KEY (JOB_ID) REFERENCES JOBS (ID),
    FOREIGN KEY (AUTHOR_ID) REFERENCES USERS (ID),
    PRIMARY KEY(ID)
);

CREATE TABLE ACTIVITYS(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    TASK_ID INT(11) UNSIGNED,
    TITLE VARCHAR(100),
    createdAt DATETIME,
    updatedAt DATETIME,
    CONTENTS TEXT,
    AUTHOR_ID INT(11),
    AUTHOR VARCHAR(20),
	FILES INT(11) default 0,
    STATUS INT(1) default 0,
    TAG INT(5),
    FOREIGN KEY (TASK_ID) REFERENCES TASKS (ID),
    FOREIGN KEY (AUTHOR_ID) REFERENCES USERS (ID),
    PRIMARY KEY(ID)
);

CREATE TABLE COMMENT_NOTICES(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    NOTICE_ID INT(11) UNSIGNED,
    AUTHOR_ID INT(11),
    CONTENT VARCHAR(512),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (NOTICE_ID) REFERENCES NOTICES (ID),
    FOREIGN KEY (AUTHOR_ID) REFERENCES USERS (ID),
    PRIMARY KEY(ID)
);

CREATE TABLE COMMENTS_JOB(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    JOB_ID INT(11) UNSIGNED,
    AUTHOR_ID INT(11),
    CONTENT VARCHAR(512),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (JOB_ID) REFERENCES JOBS (ID),
    FOREIGN KEY (AUTHOR_ID) REFERENCES USERS (ID),
    PRIMARY KEY(ID)
);

CREATE TABLE COMMENTS_TASK(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    TASK_ID INT(11) UNSIGNED,
    AUTHOR_ID INT(11),
    CONTENT VARCHAR(512),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (TASK_ID) REFERENCES TASKS (ID),
    FOREIGN KEY (AUTHOR_ID) REFERENCES USERS (ID),
    PRIMARY KEY(ID)
);

CREATE TABLE COMMENTS_ACTIVITY(
    ID INT(11) UNSIGNED AUTO_INCREMENT,
    ACTIVITY_ID INT(11) UNSIGNED,
    AUTHOR_ID INT(11),
    CONTENT VARCHAR(512),
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (ACTIVITY_ID) REFERENCES ACTIVITYS (ID),
    FOREIGN KEY (AUTHOR_ID) REFERENCES USERS (ID),
    PRIMARY KEY(ID)
);

CREATE TABLE POST_TASK(
	ID INT(11) UNSIGNED AUTO_INCREMENT,
    TASK_ID INT(11) UNSIGNED,
    TITLE VARCHAR(100),    
    AUTHOR_ID INT(11),
    AUTHOR VARCHAR(20),
    CONTENT TEXT,
    createdAt DATETIME,
    updatedAt DATETIME,
    FILES INT(11) default 0,
    FOREIGN KEY (TASK_ID) REFERENCES TASKS (ID),
    FOREIGN KEY (AUTHOR_ID) REFERENCES USERS (ID),
    PRIMARY KEY(ID)
);

CREATE TABLE POST_JOB(
	ID INT(11) UNSIGNED AUTO_INCREMENT,
    JOB_ID INT(11) UNSIGNED,
    TITLE VARCHAR(100),
    AUTHOR_ID INT(11),
    AUTHOR VARCHAR(20),
    CONTENT TEXT,
    createdAt DATETIME,
    updatedAt DATETIME,
    FILES INT(11) default 0,
    FOREIGN KEY (JOB_ID) REFERENCES JOBS (ID),
    FOREIGN KEY (AUTHOR_ID) REFERENCES USERS (ID),
    PRIMARY KEY(ID)
);

CREATE TABLE FILE(
	ID INT(11) UNSIGNED AUTO_INCREMENT,
    SRC_TYPE INT(5),
    SRC_ID INT(11),
    createdAt DATETIME,
    updatedAt DATETIME,
    deletedAt DATETIME,
    PATH VARCHAR(500),
    original_NAME VARCHAR(100),
    server_NAME VARCHAR(200),
    PRIMARY KEY(ID)
);

/* SRC_TYPE
 0	notice
 1	POST_JOB
 2	POST_TASK
 3	ACTIVITY
*/

CREATE TABLE LOG(
	ID INT(11) UNSIGNED AUTO_INCREMENT,
    USER_ID INT(11),
    USER_NAME VARCHAR(20),
    OBJECT VARCHAR(100),
    OBJECT_NAME VARCHAR(200),
	ACTION VARCHAR(20),
    createdAt DATETIME,
    updatedAt DATETIME,
    URL VARCHAR(500),
	FOREIGN KEY (USER_ID) REFERENCES USERS (ID),
    PRIMARY KEY(ID)
);