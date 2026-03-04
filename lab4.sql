
CREATE DATABASE lesson2;
USE lesson2;

CREATE TABLE boyfriend (
    b_id INT PRIMARY KEY,
    b_name VARCHAR(50)
);

CREATE TABLE girlfriend (
    g_id INT PRIMARY KEY,
    g_name VARCHAR(50),
    b_id INT,
    FOREIGN KEY (b_id) REFERENCES boyfriend(b_id)
);


INSERT INTO boyfriend (b_id, b_name) VALUES 
(1, 'Шинэбаяр'), (2, 'Мэндбаатар'), (3, 'Буянхишиг'), (4, 'Хатан-Илд'), (5, 'Анар');

INSERT INTO girlfriend (g_id, g_name, b_id) VALUES 
(1, 'Марал', 1), (2, 'Номин', 2), (3, 'Хонгорзул', NULL), 
(4, 'Чинцэцэг', NULL), (5, 'Санчирмаа', NULL), (6, 'Ариунмаа', NULL), (7, 'Анаржаргал', NULL);
SELECT b.b_name AS 'Найз хөвгүүний нэр', g.g_name AS 'Найз охины нэр'
FROM boyfriend b
JOIN girlfriend g ON b.b_id = g.b_id;
SELECT b.b_name AS 'Найз хөвгүүний нэр', g.g_name AS 'Найз охины нэр'
FROM boyfriend b
LEFT JOIN girlfriend g ON b.b_id = g.b_id;
SELECT b.b_name AS 'Найз хөвгүүний нэр', g.g_name AS 'Найз охины нэр'
FROM boyfriend b
RIGHT JOIN girlfriend g ON b.b_id = g.b_id;
SELECT b.b_name AS 'Найз хөвгүүний нэр', g.g_name AS 'Найз охины нэр'
FROM boyfriend b LEFT JOIN girlfriend g ON b.b_id = g.b_id
UNION
SELECT b.b_name AS 'Найз хөвгүүний нэр', g.g_name AS 'Найз охины нэр'
FROM boyfriend b RIGHT JOIN girlfriend g ON b.b_id = g.b_id;
SELECT b_id, b_name
FROM boyfriend
WHERE b_id NOT IN (SELECT b_id FROM girlfriend WHERE b_id IS NOT NULL);
SELECT g_id, g_name
FROM girlfriend
WHERE b_id IS NULL;