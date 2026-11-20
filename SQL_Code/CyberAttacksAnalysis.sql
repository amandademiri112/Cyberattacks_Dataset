-- Create database then import csv

CREATE DATABASE Cyberattacks;
USE Cyberattacks;
SELECT DATABASE();

-- Taking a first look at the imported dataset

SELECT *
FROM cyberattacks
LIMIT 10;

-- Checking the original table structure

DESCRIBE cyberattacks;

-- Checking the total number of records and unique attacks

SELECT
    COUNT(*) AS TotalRecords,
    COUNT(DISTINCT `Attack ID`) AS UniqueAttacks
FROM cyberattacks;

-- Checking how complete the main columns are

SELECT
    COUNT(*) AS TotalRecords,
    COUNT(`Source Country`) AS RecordsWithSourceCountry,
    COUNT(`Destination Country`) AS RecordsWithDestinationCountry,
    COUNT(`Attack Type`) AS RecordsWithAttackType,
    COUNT(`Protocol`) AS RecordsWithProtocol,
    COUNT(`Affected System`) AS RecordsWithAffectedSystem,
    COUNT(`Detection Label`) AS RecordsWithDetectionLabel,
    COUNT(`Confidence Score`) AS RecordsWithConfidenceScore,
    COUNT(`Timestamp`) AS RecordsWithTimestamp
FROM cyberattacks;

-- Finding records with missing destination countries

SELECT COUNT(*) AS MissingDestinationCountries
FROM cyberattacks
WHERE `Destination Country` IS NULL
   OR TRIM(`Destination Country`) = '';

-- Finding records with missing attack types

SELECT COUNT(*) AS MissingAttackTypes
FROM cyberattacks
WHERE `Attack Type` IS NULL
   OR TRIM(`Attack Type`) = '';

-- Checking for missing timestamps

SELECT COUNT(*) AS MissingTimestamps
FROM cyberattacks
WHERE `Timestamp` IS NULL
   OR TRIM(`Timestamp`) = '';

-- Looking for duplicate attack IDs

SELECT
    `Attack ID`,
    COUNT(*) AS NumberOfOccurrences
FROM cyberattacks
GROUP BY `Attack ID`
HAVING COUNT(*) > 1;

-- Checking which port types appear in the dataset

SELECT
    `Port Type`,
    COUNT(*) AS NumberOfRecords
FROM cyberattacks
GROUP BY `Port Type`
ORDER BY NumberOfRecords DESC;

-- Checking for invalid numeric values before conversion

SELECT `Attack ID`
FROM cyberattacks
WHERE TRIM(`Attack ID`) NOT REGEXP '^[0-9]+$'
   OR `Attack ID` IS NULL;

SELECT `Source Port`
FROM cyberattacks
WHERE TRIM(`Source Port`) NOT REGEXP '^[0-9]+$'
   OR `Source Port` IS NULL;

SELECT `Destination Port`
FROM cyberattacks
WHERE TRIM(`Destination Port`) NOT REGEXP '^[0-9]+$'
   OR `Destination Port` IS NULL;

SELECT `Payload Size (bytes)`
FROM cyberattacks
WHERE TRIM(`Payload Size (bytes)`) NOT REGEXP '^[0-9]+$'
   OR `Payload Size (bytes)` IS NULL;

-- Keeping the original imported table unchanged
-- and creating a separate table for analysis

CREATE TABLE cyberattacks_cleaned (

    `Attack ID` INT,

    `Source IP` VARCHAR(45),

    `Destination IP` VARCHAR(45),

    `Source Country` VARCHAR(100),

    `Destination Country` VARCHAR(100),

    `Protocol` VARCHAR(20),

    `Source Port` INT,

    `Destination Port` INT,

    `Attack Type` VARCHAR(150),

    `Payload Size (bytes)` BIGINT,

    `Detection Label` VARCHAR(30),

    `Confidence Score` DOUBLE,

    `ML Model` VARCHAR(100),

    `Affected System` VARCHAR(100),

    `Port Type` VARCHAR(50),

    `Timestamp` DATETIME

);

-- Converting numeric columns and handling blank values
-- while transferring the original records

INSERT INTO cyberattacks_cleaned (

    `Attack ID`,
    `Source IP`,
    `Destination IP`,
    `Source Country`,
    `Destination Country`,
    `Protocol`,
    `Source Port`,
    `Destination Port`,
    `Attack Type`,
    `Payload Size (bytes)`,
    `Detection Label`,
    `Confidence Score`,
    `ML Model`,
    `Affected System`,
    `Port Type`,
    `Timestamp`

)

SELECT

    CAST(NULLIF(TRIM(`Attack ID`), '') AS UNSIGNED),

    NULLIF(TRIM(`Source IP`), ''),

    NULLIF(TRIM(`Destination IP`), ''),

    NULLIF(TRIM(`Source Country`), ''),

    NULLIF(TRIM(`Destination Country`), ''),

    NULLIF(TRIM(`Protocol`), ''),

    CAST(NULLIF(TRIM(`Source Port`), '') AS UNSIGNED),

    CAST(NULLIF(TRIM(`Destination Port`), '') AS UNSIGNED),

    NULLIF(TRIM(`Attack Type`), ''),

    CAST(NULLIF(TRIM(`Payload Size (bytes)`), '') AS UNSIGNED),

    NULLIF(TRIM(`Detection Label`), ''),

    `Confidence Score`,

    NULLIF(TRIM(`ML Model`), ''),

    NULLIF(TRIM(`Affected System`), ''),

    NULLIF(TRIM(`Port Type`), ''),

    STR_TO_DATE(
        NULLIF(TRIM(`Timestamp`), ''),
        '%Y-%m-%d %H:%i:%s'
    )

FROM cyberattacks;

-- Checking the new table structure

DESCRIBE cyberattacks_cleaned;

-- Comparing the original and cleaned record counts

SELECT
    (SELECT COUNT(*) FROM cyberattacks) AS OriginalRecords,

    (SELECT COUNT(*) FROM cyberattacks_cleaned) AS CleanedRecords;


-- Checking for missing timestamps after conversion

SELECT COUNT(*) AS MissingTimestamps
FROM cyberattacks_cleaned
WHERE `Timestamp` IS NULL;

-- Checking for duplicate attack IDs in the cleaned table

SELECT
    `Attack ID`,
    COUNT(*) AS NumberOfOccurrences
FROM cyberattacks_cleaned
GROUP BY `Attack ID`
HAVING COUNT(*) > 1;

-- Taking a look at the cleaned data

SELECT *
FROM cyberattacks_cleaned
LIMIT 10;

-- Getting an overall count of attacks directed at the UK

SELECT
    COUNT(*) AS TotalUKAttackRecords,
    COUNT(DISTINCT `Attack ID`) AS UniqueUKAttacks
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK';

-- Comparing the number of attacks across destination countries

SELECT
    `Destination Country`,
    COUNT(DISTINCT `Attack ID`) AS TotalAttacks
FROM cyberattacks_cleaned
WHERE `Destination Country` IS NOT NULL
GROUP BY `Destination Country`
ORDER BY TotalAttacks DESC;

-- Finding out which source countries appear most frequently
-- in attacks directed at the UK

SELECT
    `Source Country` AS SourceCountry,
    COUNT(DISTINCT `Attack ID`) AS TotalAttacks
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
  AND `Source Country` IS NOT NULL
GROUP BY `Source Country`
ORDER BY TotalAttacks DESC;

-- Narrowing this down to the five most frequently recorded source countries

SELECT
    `Source Country` AS SourceCountry,
    COUNT(DISTINCT `Attack ID`) AS TotalAttacks
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
  AND `Source Country` IS NOT NULL
GROUP BY `Source Country`
ORDER BY TotalAttacks DESC
LIMIT 5;

-- Identifying the attack types most commonly recorded
-- in incidents targeting the UK

SELECT
    `Attack Type` AS AttackType,
    COUNT(DISTINCT `Attack ID`) AS TotalAttacks
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
  AND `Attack Type` IS NOT NULL
GROUP BY `Attack Type`
ORDER BY TotalAttacks DESC;

-- Comparing the frequency of attack types across all countries

SELECT
    `Attack Type` AS AttackType,
    COUNT(DISTINCT `Attack ID`) AS TotalAttacks
FROM cyberattacks_cleaned
GROUP BY `Attack Type`
ORDER BY TotalAttacks DESC;

-- Breaking down UK-targeted attacks by source country and attack type

SELECT
    `Source Country` AS SourceCountry,
    `Attack Type` AS AttackType,
    COUNT(DISTINCT `Attack ID`) AS TotalAttacks
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
GROUP BY
    `Source Country`,
    `Attack Type`
ORDER BY TotalAttacks DESC;

-- Finding out which protocols appear most often
-- in attacks targeting the UK

SELECT
    `Protocol`,
    COUNT(DISTINCT `Attack ID`) AS TotalAttacks
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
GROUP BY `Protocol`
ORDER BY TotalAttacks DESC;

-- Identifying the ten most frequently targeted destination ports

SELECT
    `Destination Port`,
    COUNT(DISTINCT `Attack ID`) AS TotalAttacks
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
  AND `Destination Port` IS NOT NULL
GROUP BY `Destination Port`
ORDER BY TotalAttacks DESC
LIMIT 10;

-- Comparing protocols and attack types to identify recurring combinations

SELECT
    `Protocol`,
    `Attack Type`,
    COUNT(DISTINCT `Attack ID`) AS TotalAttacks
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
GROUP BY
    `Protocol`,
    `Attack Type`
ORDER BY TotalAttacks DESC;

-- Identifying the systems most frequently involved
-- in attacks targeting the UK

SELECT
    `Affected System` AS AffectedSystem,
    COUNT(DISTINCT `Attack ID`) AS TotalAttacks
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
  AND `Affected System` IS NOT NULL
GROUP BY `Affected System`
ORDER BY TotalAttacks DESC;

-- Comparing affected systems with attack types

SELECT
    `Affected System` AS AffectedSystem,
    `Attack Type` AS AttackType,
    COUNT(DISTINCT `Attack ID`) AS TotalAttacks
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
GROUP BY
    `Affected System`,
    `Attack Type`
ORDER BY TotalAttacks DESC;

-- Comparing the number of detected and undetected attacks
-- targeting the UK

SELECT
    `Detection Label` AS DetectionLabel,
    COUNT(DISTINCT `Attack ID`) AS TotalAttacks
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
GROUP BY `Detection Label`
ORDER BY TotalAttacks DESC;

-- Calculating the percentage of UK attack records
-- labelled as detected

SELECT
    COUNT(*) AS TotalRecords,

    SUM(CASE
        WHEN `Detection Label` = 'Detected'
        THEN 1 ELSE 0
    END) AS DetectedRecords,

    ROUND(
        SUM(CASE
            WHEN `Detection Label` = 'Detected'
            THEN 1 ELSE 0
        END) * 100.0 / NULLIF(COUNT(*), 0), 2
    ) AS DetectedPercentage

FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK';

-- Comparing how frequently each model identifies attacks

SELECT
    `ML Model` AS MLModel,

    COUNT(*) AS TotalRecords,

    SUM(CASE
        WHEN `Detection Label` = 'Detected'
        THEN 1 ELSE 0
    END) AS DetectedRecords,

    SUM(CASE
        WHEN `Detection Label` = 'Not Detected'
        THEN 1 ELSE 0
    END) AS NotDetectedRecords,

    ROUND(
        SUM(CASE
            WHEN `Detection Label` = 'Detected'
            THEN 1 ELSE 0
        END) * 100.0 / NULLIF(COUNT(*), 0), 2
    ) AS DetectedPercentage

FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
GROUP BY `ML Model`
ORDER BY DetectedPercentage DESC;

-- Comparing average confidence scores across different models

SELECT
    `ML Model` AS MLModel,
    COUNT(`Confidence Score`) AS RecordsWithConfidenceScores,
    ROUND(AVG(`Confidence Score`), 3) AS AverageConfidenceScore,
    MIN(`Confidence Score`) AS LowestConfidenceScore,
    MAX(`Confidence Score`) AS HighestConfidenceScore
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
GROUP BY `ML Model`
ORDER BY AverageConfidenceScore DESC;

-- Checking whether confidence scores differ
-- between detected and undetected attack records

SELECT
    `Detection Label` AS DetectionLabel,
    COUNT(*) AS TotalRecords,
    ROUND(AVG(`Confidence Score`), 3) AS AverageConfidenceScore
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
GROUP BY `Detection Label`
ORDER BY AverageConfidenceScore DESC;

-- Comparing average payload sizes across different attack types

SELECT
    `Attack Type` AS AttackType,
    COUNT(*) AS TotalRecords,
    ROUND(AVG(`Payload Size (bytes)`), 2) AS AveragePayloadSize,
    MIN(`Payload Size (bytes)`) AS SmallestPayload,
    MAX(`Payload Size (bytes)`) AS LargestPayload
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
  AND `Payload Size (bytes)` IS NOT NULL
GROUP BY `Attack Type`
ORDER BY AveragePayloadSize DESC;

-- Combining source country, attack type and affected system
-- to identify the most frequently recorded combinations

SELECT
    `Source Country` AS SourceCountry,
    `Attack Type` AS AttackType,
    `Affected System` AS AffectedSystem,
    COUNT(DISTINCT `Attack ID`) AS TotalAttacks
FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK'
GROUP BY
    `Source Country`,
    `Attack Type`,
    `Affected System`
ORDER BY TotalAttacks DESC
LIMIT 20;

-- Bringing together the main figures from the UK analysis

SELECT
    COUNT(DISTINCT `Attack ID`) AS TotalUKAttacks,

    COUNT(DISTINCT `Source Country`) AS
        NumberOfSourceCountries,

    COUNT(DISTINCT `Attack Type`) AS
        NumberOfAttackTypes,

    COUNT(DISTINCT `Protocol`) AS
        NumberOfProtocols,

    COUNT(DISTINCT `Affected System`) AS
        NumberOfAffectedSystemTypes,

    COUNT(DISTINCT `ML Model`) AS
        NumberOfMachineLearningModels,

    ROUND(AVG(`Confidence Score`), 3) AS
        AverageConfidenceScore

FROM cyberattacks_cleaned
WHERE `Destination Country` = 'UK';
