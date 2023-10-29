

--- Creamos la base de datos
create database TareaBD

--- Crear tabla llamada "School" ---
create table School
(
SchoolId int identity (1,1) primary key, --- Usamos una llave primaria para indicar que este valor no puede modificarse ---
SchoolName varchar (50) NOT NULL,
Description varchar(1000),
Address varchar(50) NOT NULL,
Phone varchar(50) NOT NULL,
PostCode varchar(50) NOT NULL,
PostAddress varchar(50) NOT NULL
)


--- Crear tabla llamada "Course" ---
create table Course
(
CourseId int identity (1,1) primary key, --- Usamos una llave primaria para indicar que este valor no puede modificarse ---
SchoolIdRegistro int,
CourseName varchar (50) NOT NULL,
Description varchar(1000) NOT NULL
CONSTRAINT Fk_SchoolIdRegistro FOREIGN KEY (SchoolIdRegistro) REFERENCES SCHOOL(SchoolId)  --- Usamos la llave foranea para heredar el SchoolId hacia esta tabla ---
)

--- Crear tabla llamada "Class" ---
create table Class
(
ClassId int identity (1,1) primary key, --- Usamos una llave primaria para indicar que este valor no puede modificarse ---
SchoolIdRegistro int,
SchoolId int NOT NULL,
ClassName varchar (50) NOT NULL,
Description varchar (1000) NOT NULL
CONSTRAINT Fk_SchoolIdRegistro FOREIGN KEY (SchoolIdRegistro) REFERENCES SCHOOL(SchoolId)  --- Usamos la llave foranea para heredar el SchoolId hacia esta tabla ---
)

--- Crear tabla llamada "Student" ---
create table Student
(
StudentId int identity (1,1) primary key, --- Usamos una llave primaria para indicar que este valor no puede modificarse ---
ClassIdRegistro int,
StudentName varchar (100) NOT NULL,
StudentNumber varchar(20) NOT NULL,
TotalGrade float NOT NULL,
Address varchar (100) NOT NULL,
Phone varchar (20) NOT NULL,
Email varchar (20) NOT NULL,
CONSTRAINT Fk_ClassIdRegistro FOREIGN KEY (ClassIdRegistro) REFERENCES CLASS(ClassId)
)

--- Crear tabla llamada "Teacher" ---
create table Teacher
(
TeacherId int identity (1,1) primary key, --- Usamos una llave primaria para indicar que este valor no puede modificarse ---
SchoolIdRegistro int,
SchoolId int NOT NULL,
TeacherName varchar (50) NOT NULL,
Description varchar(1000) NOT NULL,
CONSTRAINT Fk_SchoolIdRegistro FOREIGN KEY (SchoolIdRegistro) REFERENCES SCHOOL(SchoolId) --- Usamos la llave foranea para heredar el SchoolId hacia esta tabla ---
)

--- Crear tabla llamada "Student Course" ---
create table Student_Course
(
StudentIdRegistro int,
CourseIdRegistro int,
CONSTRAINT Fk_StudentIdRegistro FOREIGN KEY (StudentIdRegistro) REFERENCES STUDENT(StudentId),
CONSTRAINT Fk_CourseIdRegistro FOREIGN KEY (CourseIdRegistro) REFERENCES COURSE(CourseId)

)

--- Crear tabla llamada "Teacher Course" ---
create table Teacher_Course
(
TeacherIdRegistro int,
CourseIdRegistro int,
CONSTRAINT Fk_TeacherIdRegistro FOREIGN KEY (TeacherIdRegistro) REFERENCES TEACHER(TeacherId),
CONSTRAINT Fk_CourseIdRegistro FOREIGN KEY (CourseIdRegistro) REFERENCES COURSE(CourseId)

)

--- Crear tabla llamada "Grade" ---
create table Grade
(
GradeId int identity (1,1) primary key, --- Usamos una llave primaria para indicar que este valor no puede modificarse ---
StudentIdRegistro int,
CourseIdRegistro int,
Grade float NOT NULL,
Comment varchar(1000) NOT NULL
CONSTRAINT Fk_StudentIdRegistro FOREIGN KEY (StudentIdRegistro) REFERENCES STUDENT(StudentId),
CONSTRAINT Fk_CourseIdRegistro FOREIGN KEY (CourseIdRegistro) REFERENCES COURSE(CourseId)
)

			--- DATOS A CONSIDERAR PARA CADA TABLA A MODIFICAR ---
--- Modificamos las tablas para agregar las columnas 'Column_Name' 'Data_type' 'Allows_nulls' para cada una de las tablas ---
--- Usamos 'CASE' para evaluar 0 y 1, para saber si la columna permite o no valores en blanco (NULL)
--- Utilizamos la funcion 'CAST' porque convierte la expresion CASE a un valor booleano ( 0 = false) & ( 1 = true) ---
--- La tabla 'INFORMATION_SCHEMA.COLUMNS' contiene la informacion sobre todas las columnas de cada tabla en la base de datos.
--- 'WHERE' la usamos para especificar que solo queremos esa informacion para cada tabla en la que aplicamos ---

SELECT Column_Name, DATA_TYPE AS Data_type, --- Con 'SELECT' seleccionamos las Tres columnas que queremos mostrar ---
CAST(CASE WHEN IS_NULLABLE = 'NO' THEN 0 ELSE 1 END AS bit) AS Allows_Nulls 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'School'

SELECT Column_Name, DATA_TYPE AS Data_type,
CAST(CASE WHEN IS_NULLABLE = 'NO' THEN 0 ELSE 1 END AS bit) AS Allows_Nulls
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Course'

SELECT Column_Name, DATA_TYPE AS Data_type,
CAST(CASE WHEN IS_NULLABLE = 'NO' THEN 0 ELSE 1 END AS bit) AS Allows_Nulls
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Class'

SELECT Column_Name, DATA_TYPE AS Data_type,
CAST(CASE WHEN IS_NULLABLE = 'NO' THEN 0 ELSE 1 END AS bit) AS Allows_Nulls
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Student'

SELECT Column_Name, DATA_TYPE AS Data_type,
CAST(CASE WHEN IS_NULLABLE = 'NO' THEN 0 ELSE 1 END AS bit) AS Allows_Nulls
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Teacher'

SELECT Column_Name, DATA_TYPE AS Data_type,
CAST(CASE WHEN IS_NULLABLE = 'NO' THEN 0 ELSE 1 END AS bit) AS Allows_Nulls
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Class'


SELECT Column_Name, DATA_TYPE AS Data_type,
CAST(CASE WHEN IS_NULLABLE = 'NO' THEN 0 ELSE 1 END AS bit) AS Allows_Nulls
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Student_Course'

SELECT Column_Name, DATA_TYPE AS Data_type,
CAST(CASE WHEN IS_NULLABLE = 'NO' THEN 0 ELSE 1 END AS bit) AS Allows_Nulls
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Teacher_Course'

SELECT Column_Name, DATA_TYPE AS Data_type,
CAST(CASE WHEN IS_NULLABLE = 'NO' THEN 0 ELSE 1 END AS bit) AS Allows_Nulls
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Grade'
