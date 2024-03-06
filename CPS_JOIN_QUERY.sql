SHOW COLUMNS FROM chicago_public_schools;
SHOW COLUMNS FROM chicago_socioeconomic_data;
SHOW COLUMNS FROM chicago_crime;
/* Write and execute a SQL query to list the school names, community names and average attendance for communities with a hardship index of 98 */
SELECT 
    CPS.NAME_OF_SCHOOL, CPS.COMMUNITY_AREA_NAME,
    CPS.AVERAGE_STUDENT_ATTENDANCE
FROM
    chicago_public_schools AS CPS
        left outer JOIN
    chicago_socioeconomic_data ON CPS.COMMUNITY_AREA_NAME = chicago_socioeconomic_data.COMMUNITY_AREA_NAME
WHERE
    HARDSHIP_INDEX = 98;
    
/*Write and execute a SQL query to list all crimes that took place at a school. Include case number, crime type and community name. */
SELECT 
    CASE_NUMBER,
    PRIMARY_TYPE,
    COMMUNITY_AREA_NAME,
    LOCATION_DESCRIPTION
FROM
    chicago_crime
        LEFT OUTER JOIN
    chicago_socioeconomic_data ON chicago_crime.COMMUNITY_AREA_NUMBER = chicago_socioeconomic_data.COMMUNITY_AREA_NUMBER
WHERE
    LOCATION_DESCRIPTION LIKE 'school%';

