DECLARE @n INT = 2; 

WITH niveles AS (
    SELECT 
        h.identificacion,
        h.corte_mes,
        h.saldo,
        CASE
            WHEN h.saldo >= 0 AND h.saldo < 300000 THEN 'N0'
            WHEN h.saldo >= 300000 AND h.saldo < 1000000 THEN 'N1'
            WHEN h.saldo >= 1000000 AND h.saldo < 3000000 THEN 'N2'
            WHEN h.saldo >= 3000000 AND h.saldo < 5000000 THEN 'N3'
            WHEN h.saldo >= 5000000 THEN 'N4'
        END AS nivel
    FROM historia h
    LEFT JOIN retiros r ON h.identificacion = r.identificacion
    WHERE h.corte_mes <= '2025-01-01' 
),

rachas AS (
    SELECT 
        n.identificacion,
        n.nivel,
        n.corte_mes,
        ROW_NUMBER() OVER (PARTITION BY n.identificacion, n.nivel ORDER BY n.corte_mes) - 
        ROW_NUMBER() OVER (PARTITION BY n.identificacion ORDER BY n.corte_mes) AS racha
    FROM niveles n
),

racha_larga AS (
    SELECT 
        r.identificacion,
        r.nivel,
        COUNT(*) AS racha,
        MAX(r.corte_mes) AS fecha_fin
    FROM rachas r
    GROUP BY r.identificacion, r.nivel, r.racha
    HAVING COUNT(*) >= @n
)



SELECT * 
FROM racha_larga;

