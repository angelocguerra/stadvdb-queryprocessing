# Query 1
# PC Runtime/s      :                   2023: (228ms), (234ms), (185ms)
SELECT      d.mainspecialty AS `Specialization`,
            COUNT(*) AS `Appointments Handled`
FROM        appointments AS a
INNER JOIN  doctors AS d ON a.doctorid = d.doctorid
WHERE       YEAR(A.QueueDate) >= 2023 -- replace chosen year here
GROUP BY    `Specialization`
ORDER BY    `Appointments Handled` DESC, `Specialization`
LIMIT       10;

# Query 2
# PC Runtime/s:                         (337ms), (311ms), (284ms)
SELECT      q.`Age Group`,
            COUNT(*) AS `Appointments Handled`
FROM        (SELECT      doctorid,
            CONCAT(FLOOR(age / 10) * 10, '-', FLOOR(age / 10) * 10 + 10) AS `Age Group`
            FROM        doctors) AS q
INNER JOIN  appointments AS a ON a.doctorid = q.doctorid
GROUP BY    q.`Age Group`
ORDER BY    `Appointments Handled` DESC;

# Query 3
# PC Runtime/s      :                   (414ms), (426ms), (440ms)
SELECT      c.RegionName AS `Region`,
            d.mainspecialty AS `Specialization`,
            COUNT(*) AS `Number of Appointments`
FROM        appointments AS a
INNER JOIN  doctors AS d ON a.doctorid = d.doctorid
INNER JOIN  clinics AS c on a.clinicid = c.clinicid
GROUP BY    `Region`, `Specialization`
ORDER BY    `Number of Appointments` DESC;


# Query 4
# PC Runtime/s      :                   (62ms), (75ms), (62ms)
SELECT      c.City AS `City`,
            COUNT(*) AS `Number of Virtual Appointments`
FROM        appointments AS a
INNER JOIN  clinics AS c ON a.clinicid = c.clinicid
WHERE       `City` = 'Manila'
AND         a._virtual = 1
GROUP BY    `City`;

