SELECT * 
FROM Student
WHERE FirstName = 'Antonio'
GO

SELECT *
FROM Student 
WHERE DateOfBirth > '01.01.1999'
GO

SELECT * 
FROM Student 
WHERE LastName LIKE 'J%' AND EnrolledDate >= '1998-01-01' AND EnrolledDate <= '1998-01-31'
GO

SELECT * 
FROM Student 
ORDER BY FirstName
GO

SELECT LastName 
FROM Teacher 
UNION
SELECT LastName 
FROM Student
GO

ALTER TABLE Grade ADD CONSTRAINT FK_Student FOREIGN KEY (StudentID) REFERENCES Student (Id)
ALTER TABLE Grade ADD CONSTRAINT FK_Teacher FOREIGN KEY (TeacherID) REFERENCES Teacher (Id)
ALTER TABLE Grade ADD CONSTRAINT FK_Course FOREIGN KEY (CourseID) REFERENCES Course (Id)
ALTER TABLE GradeDetails ADD CONSTRAINT FK_Grade FOREIGN KEY (GradeID) REFERENCES Grade (Id)
ALTER TABLE GradeDetails ADD CONSTRAINT FK_AchievementType FOREIGN KEY (AchievementTypeID) REFERENCES AchievementType (Id)
GO

SELECT Course.Name, AchievementType.Name
FROM Course, AchievementType
GO

SELECT Teacher.*
FROM Teacher
LEFT JOIN Grade ON Teacher.Id = Grade.TeacherID
WHERE Grade.TeacherID IS NULL
GO

DROP DATABASE IF EXISTS [SEDCHome];