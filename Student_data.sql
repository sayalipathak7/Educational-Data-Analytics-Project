CREATE DATABASE StudentOutcomes;
USE StudentOutcomes;

drop table StudentPerformance;
CREATE TABLE StudentPerformance (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender CHAR(50) NOT NULL,
    part_time_job BOOLEAN NOT NULL,
    absence_days INT NOT NULL,
    extracurricular_activities BOOLEAN NOT NULL,
    weekly_self_study_hours INT NOT NULL,
    career_aspiration VARCHAR(100),
    math_score INT CHECK (math_score BETWEEN 0 AND 100),
    history_score INT CHECK (history_score BETWEEN 0 AND 100),
    physics_score INT CHECK (physics_score BETWEEN 0 AND 100),
    chemistry_score INT CHECK (chemistry_score BETWEEN 0 AND 100),
    biology_score INT CHECK (biology_score BETWEEN 0 AND 100),
    english_score INT CHECK (english_score BETWEEN 0 AND 100),
    geography_score INT CHECK (geography_score BETWEEN 0 AND 100)
);
SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/student-scores.csv' 
INTO TABLE StudentPerformance
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, first_name, last_name, email, gender, @part_time_job, absence_days, @extracurricular_activities, 
 weekly_self_study_hours, career_aspiration, math_score, history_score, physics_score, chemistry_score, 
 biology_score, english_score, geography_score)
SET part_time_job = CASE WHEN @part_time_job = 'True' THEN 1 ELSE 0 END,
    extracurricular_activities = CASE WHEN @extracurricular_activities = 'True' THEN 1 ELSE 0 END;

SELECT *
FROM StudentPerformance;
