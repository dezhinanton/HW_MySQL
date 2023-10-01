USE homework_3;

CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
	firstname VARCHAR(45) NOT NULL,
	lastname VARCHAR(45) NOT NULL,
	post VARCHAR(100) NOT NULL,
	seniority INT NOT NULL, 
	salary INT NOT NULL, 
	age INT NOT NULL
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

SELECT *  FROM staff;

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
SELECT *  FROM staff
ORDER BY salary DESC;

SELECT *  FROM staff
ORDER BY salary;

-- 2. Выведите 5 максимальных заработных плат (saraly)
SELECT *  FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT post, SUM(salary)
FROM staff
GROUP BY post;

-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(post) AS "Количество сотрудников"
FROM staff
WHERE post = 'Рабочий' AND age between 24 and 49;

-- 5. Найдите количество специальностей
SELECT COUNT(DISTINCT post) AS "Количество специальностей"
FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT post, AVG(age) AS mean_age
FROM staff
GROUP BY post
HAVING AVG(age) < 30;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 35 лет
SELECT post, AVG(age) AS mean_age
FROM staff
GROUP BY post
HAVING AVG(age) < 35;


-- Работа персонала
CREATE TABLE activity_staff (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	staff_id INT NOT NULL,
	date_activity DATE,
	count_pages INT,
	FOREIGN KEY (staff_id) REFERENCES staff (id) ON DELETE CASCADE ON UPDATE CASCADE  
);

-- Наполнение данными
INSERT INTO activity_staff (staff_id, date_activity, count_pages)
VALUES
(1, '2022-01-01', 250),
(2, '2022-01-01', 220),
(3, '2022-01-01', 170),
(1, '2022-01-02', 100),
(2, '2022-01-02', 220),
(3, '2022-01-02', 300),
(7, '2022-01-02', 350),
(1, '2022-01-03', 168),
(2, '2022-01-03', 62),
(3, '2022-01-03', 84);

SELECT * FROM activity_staff;

-- доп задача по желанию
-- Вывести имя и фамилию людей, которые напечатали всего более 400 страниц.

SELECT s.id, s.firstname, s.lastname, SUM(a_s.count_pages) as total_list
FROM staff AS s, activity_staff AS a_s
WHERE s.id = a_S.staff_id
GROUP BY s.id
HAVING total_list > 400;



