CREATE DATABASE movie_rental_dw;

USE movie_rental_dw;
CREATE TABLE DIM_CUSTOMER (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE DIM_FILM (
    film_id INT PRIMARY KEY,
    title VARCHAR(100),
    category VARCHAR(50)
);

CREATE TABLE FACT_RENTAL (
    rental_id INT PRIMARY KEY,
    customer_id INT,
    film_id INT,
    rental_days INT,

    FOREIGN KEY (customer_id)
        REFERENCES DIM_CUSTOMER(customer_id),

    FOREIGN KEY (film_id)
        REFERENCES DIM_FILM(film_id)
);
CREATE TABLE FACT_PAYMENT (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(5,2),

    FOREIGN KEY (customer_id)
        REFERENCES DIM_CUSTOMER(customer_id)
);

CREATE TABLE FACT_INVENTORY (
    inventory_id INT PRIMARY KEY,
    film_id INT,
    store_id INT,
    inventory_count INT,

    FOREIGN KEY (film_id)
        REFERENCES DIM_FILM(film_id)
);



