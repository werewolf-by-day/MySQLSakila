# 1. display all customers inside city_id = 312
#     return customer first name, last name, email, and address

SELECT customer.first_name, customer.last_name, customer.email, address.address
FROM city
JOIN address ON city.city_id = address.city_id
JOIN customer ON address.address_id = customer.address_id
WHERE city.city_id = 312;

# 2. display all comedy films
#     return film title, description, release year, rating, special features, and genre (category)

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Comedy';

# 3. display all films joined by actor_id = 5
#     return actor id, actor name, film title, description, and release year

SELECT actor.actor_id, CONCAT_WS(' ', actor.first_name, actor.last_name) AS actor_name, film.title, film.description, film.release_year
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE actor.actor_id = 5;

#4. display all customers in store_id = 1 and inside cities (1, 42, 312, 459)
#     return customer first name, last name, email, and address

SELECT customer.first_name, customer.last_name, customer.email, address.address
FROM city
JOIN address ON city.city_id = address.city_id
JOIN customer ON address.address_id = customer.address_id
JOIN store ON customer.store_id = store.store_id
WHERE city.city_id IN (1, 42, 312, 459) AND store.store_id = 1;

# 5. display all films with rating = 'G'' and special feature = 'behind the scenes' joined by actor_id = 15
#     return film title, description, release year, rating, and special feature
#     HINT: use LIKE function for 'behind the scenes'

SELECT film.title, film.description, film.release_year, film.rating, film.special_features
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
WHERE film_actor.actor_id = 15 AND film.special_features LIKE '%behind the scenes%' AND film.rating = 'G';

# 6. display all actors joined in the film_id = 369
#     return film_id, title, actor_id, and actor_name

SELECT film.film_id, film.title, film_actor.actor_id, CONCAT_WS(' ', actor.first_name, actor.last_name) AS actor_name
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film.film_id = 369;

# 7. display all drama films with a rental rate of 2.99
#     return film title, description, release year, rating, special features, and genre (category)

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Drama' AND film.rental_rate = 2.99;

# 8. display all action films joined by SANDRA KILMER
#     return film title, description, release year, rating, special features, genre (category), and actor's first and last name

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name, CONCAT_WS(' ', actor.first_name, actor.last_name) AS actor_name
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE CONCAT_WS(' ', actor.first_name, actor.last_name) = 'SANDRA KILMER' AND category.name = 'Action';