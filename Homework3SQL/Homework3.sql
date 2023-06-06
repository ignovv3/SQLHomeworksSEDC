SELECT Teacher.Id, Teacher.FirstName, Teacher.LastName, COUNT(Grade.Id) AS GradeCount
FROM Teacher
LEFT JOIN Grade ON Teacher.Id = Grade.TeacherID
GROUP BY Teacher.Id, Teacher.FirstName, Teacher.LastName
GO

SELECT Teacher.Id, Teacher.FirstName, Teacher.LastName, COUNT(Grade.Id) AS GradeCount
FROM Teacher
LEFT JOIN Grade ON Teacher.Id = Grade.TeacherID
WHERE Grade.StudentID < 100
GROUP BY Teacher.Id, Teacher.FirstName, Teacher.LastName
GO

SELECT Student.Id, Student.FirstName, Student.LastName, MAX(Grade.Grade) AS MaxGrade, AVG(Grade.Grade) AS AverageGrade
FROM Student
LEFT JOIN Grade ON Student.Id = Grade.StudentID
GROUP BY Student.Id, Student.FirstName, Student.LastName
GO

SELECT Teacher.Id, Teacher.FirstName, Teacher.LastName, COUNT(Grade.Id) AS GradeCount
FROM Teacher
LEFT JOIN Grade ON Teacher.Id = Grade.TeacherID
GROUP BY Teacher.Id, Teacher.FirstName, Teacher.LastName
HAVING COUNT(Grade.Id) > 200
GO

SELECT Student.Id, Student.FirstName, Student.LastName, COUNT(Grade.Id) AS GradeCount, MAX(Grade.Grade) AS MaxGrade, AVG(Grade.Grade) AS AverageGrade
FROM Student
LEFT JOIN Grade ON Student.Id = Grade.StudentID
GROUP BY Student.Id, Student.FirstName, Student.LastName
HAVING MAX(Grade.Grade) = AVG(Grade.Grade)
GO

SELECT Student.Id, Student.FirstName, Student.LastName, Subquery.GradeCount, Subquery.MaxGrade, Subquery.AverageGrade
FROM Student
LEFT JOIN (
    SELECT StudentID, COUNT(Id) AS GradeCount, MAX(Grade) AS MaxGrade, AVG(Grade) AS AverageGrade
    FROM Grade
    GROUP BY StudentID
    HAVING MAX(Grade) = AVG(Grade)
) AS Subquery ON Student.Id = Subquery.StudentID
GO

CREATE VIEW vv_StudentGrades AS
SELECT Student.Id AS StudentId, COUNT(Grade.Id) AS GradeCount
FROM Student
LEFT JOIN Grade ON Student.Id = Grade.StudentID
GROUP BY Student.Id
GO

ALTER VIEW vv_StudentGrades
AS
SELECT Student.Id, Student.FirstName, Student.LastName, COUNT(Grade.Id) AS GradeCount
FROM Student
LEFT JOIN Grade ON Student.Id = Grade.StudentID
GROUP BY Student.Id, Student.FirstName, Student.LastName
GO

SELECT *
FROM vv_StudentGrades
ORDER BY GradeCount DESC
GO