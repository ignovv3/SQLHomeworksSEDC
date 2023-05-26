DROP DATABASE IF EXISTS SEDCACADEMYDB;
GO

CREATE DATABASE SEDCACADEMYDB;
GO

CREATE TABLE Students (
	StudentID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Age INT,
	Gender VARCHAR(10),
	Email VARCHAR(50),
	PhoneNumber VARCHAR(50)
);

CREATE TABLE Teacher (
	TeacherID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Age INT,
	Gender VARCHAR(10),
	Email VARCHAR(50),
	PhoneNumber VARCHAR(50),
);

CREATE TABLE Grades (
	Grade INT PRIMARY KEY,
); 

CREATE TABLE Courses (
	CourseID INT PRIMARY KEY,
	CourseName VARCHAR(100),
);

CREATE TABLE AchievementTypes (
	AchievementTypeID INT PRIMARY KEY,
	AchievementTypeName VARCHAR(50)
);

CREATE TABLE GradeDetails (
	GradeDetailID INT PRIMARY KEY,
	GradeDetail VARCHAR(100)
);