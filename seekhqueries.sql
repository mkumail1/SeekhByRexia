CREATE SCHEMA SeekhByRexiav3;

use SeekhByRexiav3;

/*create users table*/
CREATE TABLE IF NOT EXISTS Users (id INTEGER auto_increment , username VARCHAR(255) NOT NULL UNIQUE, email VARCHAR(255) NOT NULL UNIQUE, password VARCHAR(255) NOT NULL, firstName VARCHAR(255) NOT NULL DEFAULT 'firstName', lastName VARCHAR(255) NOT NULL DEFAULT 'lastName', phoneNumber VARCHAR(255) DEFAULT '090078601', description VARCHAR(255) DEFAULT 'Hey there! I\'m using Seekhby Rexia!', createdAt DATETIME NOT NULL, updatedAt DATETIME NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB;

/*create courses table*/
CREATE TABLE IF NOT EXISTS `Courses` (`course_id` INTEGER auto_increment , `title` VARCHAR(255) NOT NULL, `fullForm` VARCHAR(255) NOT NULL DEFAULT 'NUST Entry Test', `meritCriteriaMatric` INTEGER, `meritCriteriaFSC` INTEGER NOT NULL, `meritCriteriaTest` INTEGER NOT NULL, `description` VARCHAR(255) NOT NULL, `field` VARCHAR(255) NOT NULL DEFAULT 'Pre Engineering', `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, PRIMARY KEY (`course_id`)) ENGINE=InnoDB;

/*create subjects table*/
CREATE TABLE IF NOT EXISTS `Subjects` (`subjectID` INTEGER auto_increment , `subjectName` VARCHAR(255) NOT NULL DEFAULT 'Math', `field` VARCHAR(255) NOT NULL DEFAULT 'Pre Engineering', `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, PRIMARY KEY (`subjectID`)) ENGINE=InnoDB;

/*create chapters table*/
CREATE TABLE IF NOT EXISTS `Chapters` (`chapterID` INTEGER auto_increment , `chapterName` VARCHAR(255) NOT NULL DEFAULT 'chapterName', `subjectID` INTEGER NOT NULL DEFAULT 1, `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, PRIMARY KEY (`chapterID`), FOREIGN KEY (`subjectID`) REFERENCES `subjects` (`subjectID`)) ENGINE=InnoDB;

/*create topics tables*/
CREATE TABLE IF NOT EXISTS `Topics` (`topicID` INTEGER auto_increment , `topicName` VARCHAR(255) NOT NULL DEFAULT 'topicName', `subjectID` INTEGER NOT NULL DEFAULT 1, `chapterID` INTEGER NOT NULL DEFAULT 1, `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, PRIMARY KEY (`topicID`), FOREIGN KEY (`subjectID`) REFERENCES `subjects` (`subjectID`), FOREIGN KEY (`chapterID`) REFERENCES `chapters` (`chapterID`)) ENGINE=InnoDB;

/*create courseSubjects tables*/
CREATE TABLE IF NOT EXISTS `CourseSubjects` (`courseSubjectID` INTEGER auto_increment , `subjectID` INTEGER NOT NULL DEFAULT 1, `courseID` INTEGER NOT NULL DEFAULT 1, `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, PRIMARY KEY (`courseSubjectID`), FOREIGN KEY (`subjectID`) REFERENCES `subjects` (`subjectID`), FOREIGN KEY (`courseID`) REFERENCES `courses` (`course_id`)) ENGINE=InnoDB;

/*create enrolledCourses tables*/
CREATE TABLE IF NOT EXISTS `EnrolledCourses` (`enrolledCourseID` INTEGER auto_increment , `userID` INTEGER NOT NULL DEFAULT 1, `courseID` INTEGER NOT NULL DEFAULT 1, `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, PRIMARY KEY (`enrolledCourseID`), FOREIGN KEY (`userID`) REFERENCES `users` (`id`), FOREIGN KEY (`courseID`) REFERENCES `courses` (`course_id`)) ENGINE=InnoDB;

/*create mcq table*/
CREATE TABLE IF NOT EXISTS `MCQs` (`mcqID` INTEGER auto_increment , `statement` VARCHAR(255) NOT NULL DEFAULT 'mcq statement', `option1` VARCHAR(255) NOT NULL DEFAULT 'option 1', `option2` VARCHAR(255) NOT NULL DEFAULT 'option 2', `option3` VARCHAR(255) NOT NULL DEFAULT 'option 3', `option4` VARCHAR(255) NOT NULL DEFAULT 'option 4', `correctAns` VARCHAR(255) NOT NULL DEFAULT 'correct Ans', `topicID` INTEGER NOT NULL DEFAULT 1, `chapterID` INTEGER NOT NULL DEFAULT 1, `subjectID` INTEGER NOT NULL DEFAULT 1, `mcqNumber` INTEGER NOT NULL DEFAULT 1, `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, PRIMARY KEY (`mcqID`), FOREIGN KEY (`topicID`) REFERENCES `topics` (`topicID`), FOREIGN KEY (`chapterID`) REFERENCES `chapters` (`chapterID`), FOREIGN KEY (`subjectID`) REFERENCES `subjects` (`subjectID`)) ENGINE=InnoDB;

/*create mcqRecords tables*/
CREATE TABLE IF NOT EXISTS `CorrectMCQRecords` (`correctMCQRecordID` INTEGER auto_increment , `userID` INTEGER NOT NULL DEFAULT 1, `mcqID` INTEGER NOT NULL DEFAULT 1, `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, PRIMARY KEY (`correctMCQRecordID`), FOREIGN KEY (`userID`) REFERENCES `users` (`id`), FOREIGN KEY (`mcqID`) REFERENCES `mcqs` (`mcqID`)) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS `CorrectMCQs` (`correctMCQID` INTEGER auto_increment , `userID` INTEGER NOT NULL DEFAULT 1, `attempted` INTEGER NOT NULL DEFAULT 1, `correct` INTEGER NOT NULL DEFAULT 1, `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, PRIMARY KEY (`correctMCQID`), FOREIGN KEY (`userID`) REFERENCES `users` (`id`)) ENGINE=InnoDB;

/*attempted mcqs table*/
CREATE TABLE IF NOT EXISTS `AttemptedMCQs` (`attemptedMCQID` INTEGER auto_increment , `userID` INTEGER NOT NULL DEFAULT 1, `mcqID` INTEGER NOT NULL DEFAULT 1, `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, PRIMARY KEY (`attemptedMCQID`), FOREIGN KEY (`userID`) REFERENCES `users` (`id`), FOREIGN KEY (`mcqID`) REFERENCES `mcqs` (`mcqID`)) ENGINE=InnoDB;

/*checkpoint table*/
CREATE TABLE IF NOT EXISTS `Checkpoints` (`checkpointID` INTEGER auto_increment , `userID` INTEGER NOT NULL DEFAULT 1, `subjectID` INTEGER NOT NULL DEFAULT 1, `chapterID` INTEGER NOT NULL DEFAULT 1, `topicID` INTEGER NOT NULL DEFAULT 1, `createdAt` DATETIME NOT NULL, `updatedAt` DATETIME NOT NULL, PRIMARY KEY (`checkpointID`), FOREIGN KEY (`userID`) REFERENCES `users` (`id`), FOREIGN KEY (`subjectID`) REFERENCES `subjects` (`subjectID`), FOREIGN KEY (`chapterID`) REFERENCES `chapters` (`chapterID`), FOREIGN KEY (`topicID`) REFERENCES `topics` (`topicID`)) ENGINE=InnoDB;

/*INSERTING DUMMY DATA*/
/*insert to subjects table*/
INSERT INTO `seekhbyrexiav3`.`subjects` (`subjectID`, `subjectName`, `field`, `createdAt`, `updatedAt`) VALUES ('1', 'Maths', 'Pre Engineering', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`subjects` (`subjectID`, `subjectName`, `field`, `createdAt`, `updatedAt`) VALUES ('2', 'Physics', 'Both', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`subjects` (`subjectID`, `subjectName`, `field`, `createdAt`, `updatedAt`) VALUES ('3', 'Biology', 'Pre Medical', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`subjects` (`subjectID`, `subjectName`, `field`, `createdAt`, `updatedAt`) VALUES ('4', 'English', 'Both', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`subjects` (`subjectID`, `subjectName`, `field`, `createdAt`, `updatedAt`) VALUES ('5', 'Chemistry', 'Both', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`subjects` (`subjectID`, `subjectName`, `field`, `createdAt`, `updatedAt`) VALUES ('6', 'IQ', 'Pre Engineering', '2019-11-05 17:16:24', '2019-11-05 17:16:24');

/*add chapters*/
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('1', 'Matrices and Determinants', '1', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('2', 'Conic Section', '1', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('3', 'Quadratic Equations', '1', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('4', 'Trignometry', '1', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('5', 'Scalars and Vectors', '2', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('6', 'Simple Harmonic Motion', '2', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('7', 'Electrostatics', '2', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('8', 'Electromagnetic Induction', '2', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('9', 'Animal Kingdom', '3', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('10', 'Plant Kingdom', '3', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('11', 'Embryo', '3', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('12', 'Vocabulary', '4', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('13', 'Synonyms', '4', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('14', 'Chemical Reactions', '5', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('15', 'Organic Chemistry', '5', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('16', 'Alkanes, Alkenes, Alkynes', '5', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`chapters` (`chapterID`, `chapterName`, `subjectID`, `createdAt`, `updatedAt`) VALUES ('17', 'Patterns', '6', '2019-11-05 17:16:24', '2019-11-05 17:16:24');

/*add topics*/
INSERT INTO `seekhbyrexiav3`.`topics` (`topicID`, `topicName`, `subjectID`, `chapterID`, `createdAt`, `updatedAt`) VALUES ('1', 'Matrices', '1', '1', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`topics` (`topicID`, `topicName`, `subjectID`, `chapterID`, `createdAt`, `updatedAt`) VALUES ('2', 'Crammer Rule', '1', '1', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`topics` (`topicID`, `topicName`, `subjectID`, `chapterID`, `createdAt`, `updatedAt`) VALUES ('3', 'Circles', '1', '2', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`topics` (`topicID`, `topicName`, `subjectID`, `chapterID`, `createdAt`, `updatedAt`) VALUES ('4', 'Parabolas', '1', '2', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`topics` (`topicID`, `topicName`, `subjectID`, `chapterID`, `createdAt`, `updatedAt`) VALUES ('5', 'Quadratic Formula', '1', '3', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`topics` (`topicID`, `topicName`, `subjectID`, `chapterID`, `createdAt`, `updatedAt`) VALUES ('6', 'Intro to Trignometry', '1', '4', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`topics` (`topicID`, `topicName`, `subjectID`, `chapterID`, `createdAt`, `updatedAt`) VALUES ('7', 'Law of Cosines', '1', '4', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`topics` (`topicID`, `topicName`, `subjectID`, `chapterID`, `createdAt`, `updatedAt`) VALUES ('8', 'Law of Sines', '1', '4', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`topics` (`topicID`, `topicName`, `subjectID`, `chapterID`, `createdAt`, `updatedAt`) VALUES ('9', 'Law of Tangents', '1', '4', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`topics` (`topicID`, `topicName`, `subjectID`, `chapterID`, `createdAt`, `updatedAt`) VALUES ('10', 'Scalars', '2', '5', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`topics` (`topicID`, `topicName`, `subjectID`, `chapterID`, `createdAt`, `updatedAt`) VALUES ('11', 'Properties of Scalars', '2', '5', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`topics` (`topicID`, `topicName`, `subjectID`, `chapterID`, `createdAt`, `updatedAt`) VALUES ('12', 'Vectors and Properties', '2', '5', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`topics` (`topicID`, `topicName`, `subjectID`, `chapterID`, `createdAt`, `updatedAt`) VALUES ('13', 'Intro to SHM', '2', '6', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`topics` (`topicID`, `topicName`, `subjectID`, `chapterID`, `createdAt`, `updatedAt`) VALUES ('14', 'Simple Pendulum', '2', '6', '2019-11-05 17:16:24', '2019-11-05 17:16:24');


/*add courses*/
INSERT INTO `seekhbyrexiav3`.`courses` (`course_id`, `title`, `fullForm`, `meritCriteriaMatric`, `meritCriteriaFSC`, `meritCriteriaTest`, `description`, `field`, `createdAt`, `updatedAt`) VALUES ('1', 'NET', 'Nust Entry Test', '10', '15', '75', 'This course is the perfect source for those who aspire to excel in the Nust Entry Test!', 'Pre Engineering', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`courses` (`course_id`, `title`, `fullForm`, `meritCriteriaMatric`, `meritCriteriaFSC`, `meritCriteriaTest`, `description`, `field`, `createdAt`, `updatedAt`) VALUES ('2', 'MDCAT', 'Medical and Dental College Admission Test', '15', '35', '50', 'This course aims to help all those appearing in the Medical Colleges admission tests all over Pakistan', 'Pre Medical', '2019-11-05 17:16:24', '2019-11-05 17:16:24');

/*add subjects in the course*/
INSERT INTO `seekhbyrexiav3`.`coursesubjects` (`courseSubjectID`, `subjectID`, `courseID`, `createdAt`, `updatedAt`) VALUES ('1', '1', '1', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`coursesubjects` (`courseSubjectID`, `subjectID`, `courseID`, `createdAt`, `updatedAt`) VALUES ('2', '2', '1', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`coursesubjects` (`courseSubjectID`, `subjectID`, `courseID`, `createdAt`, `updatedAt`) VALUES ('3', '4', '1', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`coursesubjects` (`courseSubjectID`, `subjectID`, `courseID`, `createdAt`, `updatedAt`) VALUES ('4', '5', '1', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`coursesubjects` (`courseSubjectID`, `subjectID`, `courseID`, `createdAt`, `updatedAt`) VALUES ('5', '6', '1', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`coursesubjects` (`courseSubjectID`, `subjectID`, `courseID`, `createdAt`, `updatedAt`) VALUES ('6', '2', '2', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`coursesubjects` (`courseSubjectID`, `subjectID`, `courseID`, `createdAt`, `updatedAt`) VALUES ('7', '3', '2', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`coursesubjects` (`courseSubjectID`, `subjectID`, `courseID`, `createdAt`, `updatedAt`) VALUES ('8', '4', '2', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`coursesubjects` (`courseSubjectID`, `subjectID`, `courseID`, `createdAt`, `updatedAt`) VALUES ('9', '5', '2', '2019-11-05 17:16:24', '2019-11-05 17:16:24');

/*insert mcqs*/
INSERT INTO `seekhbyrexiav3`.`mcqs` (`mcqID`, `statement`, `option1`, `option2`, `option3`, `option4`, `correctAns`, `topicID`, `chapterID`, `subjectID`, `mcqNumber`, `createdAt`, `updatedAt`) VALUES ('1', 'The matricx that can be inversed is called', 'Invertible matrix', 'Insertible Matrix', 'Idempotent Matrix', 'Inceptive Matrix', 'Invertible matrix', '1', '1', '1', '1', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`mcqs` (`mcqID`, `statement`, `option1`, `option2`, `option3`, `option4`, `correctAns`, `topicID`, `chapterID`, `subjectID`, `mcqNumber`, `createdAt`, `updatedAt`) VALUES ('2', 'If A and B matrices are of same order and A + B = B + A, this law is known as', 'distributive law', 'commutative law', 'associative law', 'cramer\'s law', 'commutative law', '1', '1', '1', '2', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`mcqs` (`mcqID`, `statement`, `option1`, `option2`, `option3`, `option4`, `correctAns`, `topicID`, `chapterID`, `subjectID`, `mcqNumber`, `createdAt`, `updatedAt`) VALUES ('3', 'Circles are speical forms of', 'Parabolas', 'Ellipses', 'Hyperbolas', 'None', 'Ellipses', '3', '2', '1', '3', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`mcqs` (`mcqID`, `statement`, `option1`, `option2`, `option3`, `option4`, `correctAns`, `topicID`, `chapterID`, `subjectID`, `mcqNumber`, `createdAt`, `updatedAt`) VALUES ('4', 'The area of the triangle formed by the tangent and the normal to the parabola y2 = 4ax both drawn at the same end of the latus rectum and the axis of the parabola is', 'root(2a)', '2a^2', '4a^2', 'none', '4a^2', '3', '2', '1', '3', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
INSERT INTO `seekhbyrexiav3`.`mcqs` (`mcqID`, `statement`, `option1`, `option2`, `option3`, `option4`, `correctAns`, `topicID`, `chapterID`, `subjectID`, `mcqNumber`, `createdAt`, `updatedAt`) VALUES ('5', 'The number of tangents to the parabola y2 = 8x through (2, 1) is', '0', '1', '2', 'none', '0', '3', '2', '1', '3', '2019-11-05 17:16:24', '2019-11-05 17:16:24');
