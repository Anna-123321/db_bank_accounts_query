-- 1. Количество приходных операций с суммой более 1000
SELECT COUNT(*) AS count_large_income
FROM income_operations
WHERE amount > 1000;

-- 2. Средняя сумма расходных операций
SELECT AVG(amount) AS avg_expense
FROM expense_operations;

-- 3. Сумма всех приходов по счёту (например, account_id = 1)
SELECT SUM(amount) AS total_income
FROM income_operations
WHERE account_id = 1;

-- 4. Максимальная сумма расхода
SELECT MAX(amount) AS max_expense
FROM expense_operations;

-- 5. Минимальная сумма прихода
SELECT MIN(amount) AS min_income
FROM income_operations;

-- 6. Минимальная сумма прихода (без MIN)
SELECT amount
FROM income_operations
ORDER BY amount ASC
LIMIT 1;

-- 7. Максимальная сумма расхода (без MAX)
SELECT amount
FROM expense_operations
ORDER BY amount DESC
LIMIT 1;

-- 8. Сумма приходов по каждому счёту
SELECT account_id, SUM(amount) AS total_income
FROM income_operations
GROUP BY account_id;

-- 9. Суммарные расходы по каждому клиенту
SELECT c.full_name, SUM(e.amount) AS total_expense
FROM clients c
JOIN accounts a ON c.id = a.client_id
JOIN expense_operations e ON a.id = e.account_id
GROUP BY c.full_name;

-- 10. Клиенты с приходными операциями выше средней
SELECT DISTINCT c.full_name
FROM clients c
JOIN accounts a ON c.id = a.client_id
JOIN income_operations i ON a.id = i.account_id
WHERE i.amount > (
    SELECT AVG(amount) FROM income_operations
);
