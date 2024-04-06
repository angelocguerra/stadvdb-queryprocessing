# Indexed Number 1

# PC Runtime/s:         2023 with index:   (107ms), (106ms), (119ms)
CREATE INDEX idx_queuedate ON appointments (QueueDate);
CREATE INDEX idx_doctorid ON appointments (doctorid);

SELECT      d.mainspecialty AS `Specialization`,
            COUNT(*) as `Appointments Handled`
FROM        (SELECT     doctorid, YEAR(QueueDate) AS `Year`
             FROM       appointments
             WHERE      YEAR(QueueDate) >= 2023) AS a
LEFT JOIN   doctors AS d on a.doctorid = d.doctorid
GROUP BY    `Specialization`
ORDER BY    `Appointments Handled` DESC, `Specialization`
LIMIT       10;

# Indexed Number 2
# PC Runtime/s:         with index:   (211ms), (210ms), (230ms)
CREATE INDEX idx_pxid ON appointments (pxid);
CREATE INDEX idx_doctors_age ON doctors (age);

SELECT      q.`Age Group`,
            COUNT(*) AS `Appointments Handled`
FROM        (SELECT      doctorid,
            CONCAT(FLOOR(age / 10) * 10, '-', FLOOR(age / 10) * 10 + 10) AS `Age Group`
            FROM        doctors) AS q
INNER JOIN  appointments AS a ON a.doctorid = q.doctorid
GROUP BY    q.`Age Group`
ORDER BY    `Appointments Handled` DESC;

# Indexed Number 3
# PC Runtime/s:         with index:   (364ms), (326ms), (230ms)
CREATE INDEX idx_doctorid ON appointments (doctorid);
CREATE INDEX idx_clinicid ON appointments (clinicid);
CREATE INDEX idx_regionname ON clinics (RegionName(255));

SELECT      c.RegionName AS `Region`,
            d.mainspecialty AS `Specialization`,
            COUNT(*) AS `Number of Appointments`
FROM        appointments AS a
INNER JOIN  doctors AS d ON a.doctorid = d.doctorid
INNER JOIN  clinics AS c on a.clinicid = c.clinicid
GROUP BY    `Region`, `Specialization`
ORDER BY    `Number of Appointments` DESC;



# Indexed Number 4
# PC Runtime:           with index:   (58ms), (53ms), (49ms)
CREATE INDEX idx_clinicid ON appointments (clinicid);
CREATE INDEX idx_city ON clinics (City(255));

SELECT      c.City AS `City`,
            COUNT(*) AS `Number of Virtual Appointments`
FROM        appointments AS a
INNER JOIN  clinics AS c ON a.clinicid = c.clinicid
WHERE       `City` = 'Manila'
AND         a._virtual = 1
GROUP BY    `City`;