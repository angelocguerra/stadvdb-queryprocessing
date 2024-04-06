# Denormalized Number 1
# PC Runtime/s:         2023 denormalized w/o index:   (96ms), (98ms), (102ms)
SELECT      mainspecialty AS `Specialization`,
            COUNT(*) AS `Appointments Handled`
FROM        denormalized
WHERE       YEAR(QueueDate) >= 2023
GROUP BY    `Specialization`
ORDER BY    `Appointments Handled` DESC, Specialization
LIMIT       10;

# Denormalized Number 2
# PC Runtime/s:         denormalized w/o index:   (142ms), (134ms), (141ms)
SELECT      CONCAT(FLOOR(doctor_age / 10) * 10, '-', FLOOR(doctor_age / 10) * 10 + 10) AS `Age Group`,
            COUNT(*) AS `Appointments Handled`
FROM        denormalized
GROUP BY    `Age Group`
ORDER BY    `Appointments Handled` DESC;


# Denormalized Number 3
# PC Runtime/s:         denormalized w/o index:   (195ms), (185ms), (182ms)
SELECT      RegionName AS `Region`,
            mainspecialty AS `Specialization`,
            COUNT(*) AS `Number of Appointments`
FROM        denormalized
GROUP BY    `Region`, `Specialization`
ORDER BY    `Number of Appointments` DESC;


# Denormalized Number 4
# PC Runtime:           denormalized w/o index: (80ms), (75ms), (81ms)
SELECT      City as `City`,
            COUNT(*) AS `Number of Virtual Appointments`
FROM        denormalized
WHERE       City = 'Manila'
AND         _virtual = 1
GROUP BY    `City`;

