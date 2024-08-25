---------------------------------Faculty Table------------------------------------------------
CREATE TABLE Faculty (
FacNo         CHAR(11)      NOT NULL,
FacFirstName  VARCHAR(30)   NOT NULL,
FacLastName   VARCHAR(30)   NOT NULL,
FacCity       VARCHAR(30)   NOT NULL,
FacState      CHAR(2)       NOT NULL,
FacDept       CHAR(6)       NULL,
FacRank       CHAR(4)       NULL,
FacSalary     DECIMAL(10,2) NULL,
FacSupervisor CHAR(11)      NULL,
FacHireDate   DATETIME      NULL,
FacZipCode    CHAR(10)      NOT NULL,
CONSTRAINT FacultyPK PRIMARY KEY (FacNo), 
CONSTRAINT SupervisorFK FOREIGN KEY (FacSupervisor) REFERENCES Faculty )
go
---------------------------------Course Table------------------------------------------------
CREATE TABLE Course (
CourseNo      CHAR(6)       NOT NULL,
CrsDesc       VARCHAR(50)   NOT NULL,
CrsUnits      INTEGER       NULL,
CONSTRAINT CoursePK PRIMARY KEY (CourseNo) )
go
---------------------------------Offering Table------------------------------------------------
CREATE TABLE Offering (
OfferNo       INTEGER       NOT NULL,
CourseNo      CHAR(6)       NOT NULL,
OffTerm       CHAR(6)       NOT NULL,
OffYear       INTEGER       NOT NULL,
OffLocation   VARCHAR(30)   NULL,
OffTime       VARCHAR(10)   NULL,
FacNo         CHAR(11)      NULL,
OffDays       CHAR(4)       NULL,
CONSTRAINT OfferingPK PRIMARY KEY (OfferNo),
CONSTRAINT CourseFK FOREIGN KEY (CourseNo) REFERENCES Course,
CONSTRAINT FacultyFK FOREIGN KEY (FacNo) REFERENCES Faculty )
go
----------------------------Student Table--------------------------------------------
CREATE TABLE Student (
StdNo         CHAR(11)      NOT NULL,
StdFirstName  VARCHAR(30)   NOT NULL,
StdLastName   VARCHAR(30)   NOT NULL,
StdCity       VARCHAR(30)   NOT NULL,
StdState      CHAR(2)       NOT NULL,
StdZip        CHAR(10)      NOT NULL,
StdMajor      CHAR(6)       NULL,
StdClass      CHAR(2)       NULL,
StdGPA        DECIMAL(3,2)  NULL,
CONSTRAINT StudentPk PRIMARY KEY (StdNo) )
Go
----------------------------Enrollment Table--------------------------------------------
CREATE TABLE Enrollment (
OfferNo       INTEGER       NOT NULL,
StdNo         CHAR(11)      NOT NULL,
EnrGrade      DECIMAL(3,2)  NULL,
CONSTRAINT EnrollmentPK PRIMARY KEY (OfferNo, StdNo),
CONSTRAINT OfferingFK FOREIGN KEY (OfferNo) REFERENCES Offering
                      ON DELETE CASCADE
                      ON UPDATE CASCADE,
CONSTRAINT StudentFK FOREIGN KEY (StdNo) REFERENCES Student
                      ON DELETE CASCADE
                      ON UPDATE CASCADE )
go
