CREATE TABLE ROLE
(
    ID               BIGINT PRIMARY KEY AUTO_INCREMENT,
    NAME             VARCHAR(64)  NOT NULL UNIQUE,
    CREATE_TIME      TIMESTAMP(6) NOT NULL,
    CREATED_BY       VARCHAR(64)  NOT NULL,
    EDIT_TIME        TIMESTAMP(6),
    EDITED_BY        VARCHAR(64),
    INTERNAL_VERSION BIGINT DEFAULT 1
)ENGINE=InnoDB;

CREATE TABLE USER
(
    ID               BIGINT PRIMARY KEY AUTO_INCREMENT,
    USERNAME         VARCHAR(64)  NOT NULL UNIQUE,
    PASSWORD         VARCHAR(64)  NOT NULL,
    EMAIL            VARCHAR(64)  NOT NULL UNIQUE,
    FIRST_NAME       VARCHAR(128),
    LAST_NAME        VARCHAR(128),
    STATUS           VARCHAR(64) DEFAULT 'ACTIVE',
    CREATE_TIME      TIMESTAMP(6) NOT NULL,
    CREATED_BY       VARCHAR(64)  NOT NULL,
    EDIT_TIME        TIMESTAMP(6),
    EDITED_BY        VARCHAR(64),
    INTERNAL_VERSION BIGINT      DEFAULT 1
)ENGINE=InnoDB;

CREATE TABLE ACTIVITY_USER
(
    ACTIVITY_ID      BIGINT PRIMARY KEY AUTO_INCREMENT,
    USER_ID          BIGINT,
    USERNAME         VARCHAR(64),
    PASSWORD         VARCHAR(64),
    EMAIL            VARCHAR(64),
    FIRST_NAME       VARCHAR(128),
    LAST_NAME        VARCHAR(128),
    STATUS           VARCHAR(64),
    CREATE_TIME      TIMESTAMP(6),
    CREATED_BY       VARCHAR(64),
    EDIT_TIME        TIMESTAMP(6),
    EDITED_BY        VARCHAR(64),
    ACTIVITY_USER    VARCHAR(64)  NOT NULL,
    ACTIVITY_ACTION  INT          NOT NULL,
    ACTIVITY_TIME    TIMESTAMP(6) NOT NULL,
    INTERNAL_VERSION BIGINT DEFAULT 1
)ENGINE=InnoDB;

CREATE TABLE USER_ROLES
(
    ID               BIGINT PRIMARY KEY AUTO_INCREMENT,
    USER_ID          BIGINT       NOT NULL,
    ROLE_ID          BIGINT       NOT NULL,
    ROLE_NAME        VARCHAR(64)  NOT NULL,
    CREATE_TIME      TIMESTAMP(6) NOT NULL,
    CREATED_BY       VARCHAR(64)  NOT NULL,
    EDIT_TIME        TIMESTAMP(6),
    EDITED_BY        VARCHAR(64),
    INTERNAL_VERSION BIGINT DEFAULT 1,
    CONSTRAINT FK_USER_ROLES_USER FOREIGN KEY (USER_ID) REFERENCES USER (ID),
    CONSTRAINT FK_USER_ROLES_ROLE FOREIGN KEY (ROLE_ID) REFERENCES ROLE (ID),
    UNIQUE KEY USER_ROLE_UNIQUE (USER_ID, ROLE_ID)
)ENGINE=InnoDB;