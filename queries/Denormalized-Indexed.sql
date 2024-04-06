# Optimized Number 1
# PC Runtime/s:         2023 denormalized with index:   (98ms), (99ms), (96ms)
CREATE INDEX idx_denormalized_queuedate ON denormalized (QueueDate);
CREATE INDEX idx_denormalized_doctorid ON denormalized (doctorid);

SELECT      mainspecialty AS `Specialization`,
            COUNT(*) AS `Appointments Handled`
FROM        denormalized
WHERE       YEAR(QueueDate) >= 2023
GROUP BY    `Specialization`
ORDER BY    `Appointments Handled` DESC, Specialization
LIMIT       10;

# Optimized Number 2
# PC Runtime/s:         denormalized with index:   (226ms), (222ms), (224ms)
CREATE INDEX idx_denormalized_pxid ON denormalized (pxid);
CREATE INDEX idx_denormalized_doctor_age ON denormalized (doctor_age);

SELECT      CONCAT(FLOOR(doctor_age / 10) * 10, '-', FLOOR(doctor_age / 10) * 10 + 10) AS `Age Group`,
            COUNT(*) AS `Appointments Handled`
FROM        denormalized
GROUP BY    `Age Group`
ORDER BY    `Appointments Handled` DESC;


# Optimized Number 3
# PC Runtime/s:         denormalized with index:   (191ms), (192ms), (185ms)
CREATE INDEX idx_denormalized_doctorid ON denormalized (doctorid);
CREATE INDEX idx_denormalized_clinicid ON denormalized (clinicid);
CREATE INDEX idx_denormalized_regionname ON denormalized (RegionName(255));

SELECT      RegionName AS `Region`,
            mainspecialty AS `Specialization`,
            COUNT(*) AS `Number of Appointments`
FROM        denormalized
GROUP BY    `Region`, `Specialization`
ORDER BY    `Number of Appointments` DESC;


# Optimized Number 4
# PC Runtime:           denormalized with index: (67ms), (59ms), (58ms)
CREATE INDEX idx_denormalized_clinicid ON denormalized (clinicid);
CREATE INDEX idx_denormalized_city ON denormalized (City(255));

SELECT      City as `City`,
            COUNT(*) AS `Number of Virtual Appointments`
FROM        denormalized
WHERE       City = 'Manila'
AND         _virtual = 1
GROUP BY    `City`;

