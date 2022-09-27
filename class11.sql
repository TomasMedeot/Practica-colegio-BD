USE sakila;
SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS 'Nombre',
    ad.address,
    ci.city
FROM customer c
    INNER JOIN store sto USING(store_id)
    INNER JOIN address ad ON sto.address_id = ad.address_id
    INNER JOIN city ci USING(city_id)
    INNER JOIN country co USING(country_id)
WHERE co.country = 'Argentina';

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS 'Nombre',
    ad.address ci.city
FROM customer c
    INNER JOIN address ad USING(address_id)
    INNER JOIN city ci USING(city_id)
    INNER JOIN country co USING(country_id)
WHERE co.country = 'Argentina';

SELECT
    f.title,
    l.name,
    f.rating,
    CASE
        WHEN f.rating LIKE 'G' THEN 'All ages admitted'
        WHEN f.rating LIKE 'PG' THEN 'Some material may not be suitable for children'
        WHEN f.rating LIKE 'PG-13' THEN 'Some material may be inappropriate for children under 13'
        WHEN f.rating LIKE 'R' THEN 'Under 17 requires accompanying parent or adult guardian'
        WHEN f.rating LIKE 'NC-17' THEN 'No one 17 and under admitted'
    END 'Rating Text'
FROM film f
    INNER JOIN language l USING(language_id);

SELECT
    ac.actor_id,
    CONCAT(
        ac.first_name,
        ' ',
        ac.last_name
    ),
    f.film_id,
    f.title
FROM film f
    INNER JOIN film_actor USING(film_id)
    INNER JOIN actor ac USING(actor_id)
WHERE
    CONCAT(first_name, ' ', last_name) LIKE TRIM(UPPER('PENELOPE GUINESS'));

SELECT
    f.title,
    r.rental_date,
    c.first_name,
    CASE
        WHEN r.return_date IS NOT NULL THEN 'Yes'
        ELSE 'No'
    END 'Returned'
FROM rental r
    INNER JOIN inventory i USING(inventory_id)
    INNER JOIN film f USING(film_id)
    INNER JOIN customer c USING(customer_id)
WHERE
    MONTH(r.rental_date) = '05'
    OR MONTH(r.rental_date) = '06'
ORDER BY r.rental_date;