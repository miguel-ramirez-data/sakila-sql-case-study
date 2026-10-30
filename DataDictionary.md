# Data Dictionary — Sakila Database

Main tables used in this case study. PK = primary key, FK = foreign key.

## 1. `customer`

| Column | Data type | Key | Nullable | Description |
|--------|-----------|-----|----------|-------------|
| customer_id | SMALLINT | PK | No | Unique customer identifier. |
| store_id | SMALLINT | FK (store) | No | Store the customer belongs to. |
| first_name | VARCHAR(45) | | No | Customer's first name. |
| last_name | VARCHAR(45) | | No | Customer's last name. |
| email | VARCHAR(50) | | Yes | Customer's email address. |
| address_id | SMALLINT | FK (address) | No | Customer's physical address. |
| active | BOOLEAN | | No | Customer status (true if active, false otherwise). |
| create_date | DATETIME | | No | Date the customer record was created. |
| last_update | TIMESTAMP | | No | Date the record was last updated. |

## 2. `film`

| Column | Data type | Key | Nullable | Description |
|--------|-----------|-----|----------|-------------|
| film_id | SMALLINT | PK | No | Unique film identifier. |
| title | VARCHAR(255) | | No | Film title. |
| description | TEXT | | Yes | Film description or synopsis. |
| release_year | YEAR | | Yes | Film release year. |
| language_id | TINYINT | FK (language) | No | Original language of the film. |
| rental_duration | TINYINT | | No | Rental period in days. |
| rental_rate | DECIMAL(4,2) | | No | Rental cost for the specified period. |
| length | SMALLINT | | Yes | Film length in minutes. |
| rating | VARCHAR(10) | | Yes | Film rating (G, PG, R, etc.). |
| special_features | VARCHAR(255) | | Yes | Special features (trailers, commentaries, etc.). |
| last_update | TIMESTAMP | | No | Date the record was last updated. |

## 3. `rental`

| Column | Data type | Key | Nullable | Description |
|--------|-----------|-----|----------|-------------|
| rental_id | INT | PK | No | Unique rental identifier. |
| rental_date | DATETIME | | No | Date and time the film was rented. |
| inventory_id | MEDIUMINT | FK (inventory) | No | Specific inventory item (copy of the film) that was rented. |
| customer_id | SMALLINT | FK (customer) | No | Customer who made the rental. |
| return_date | DATETIME | | Yes | Date and time the film was returned. |
| staff_id | TINYINT | FK (staff) | No | Staff member who processed the rental. |
| last_update | TIMESTAMP | | No | Date the record was last updated. |

## 4. `payment`

| Column | Data type | Key | Nullable | Description |
|--------|-----------|-----|----------|-------------|
| payment_id | SMALLINT | PK | No | Unique payment identifier. |
| customer_id | SMALLINT | FK (customer) | No | Customer who made the payment. |
| staff_id | TINYINT | FK (staff) | No | Staff member who processed the payment. |
| rental_id | INT | FK (rental) | Yes | Rental associated with the payment. |
| amount | DECIMAL(5,2) | | No | Payment amount. |
| payment_date | DATETIME | | No | Date and time of the payment. |
| last_update | TIMESTAMP | | No | Date the record was last updated. |

## 5. `inventory`

| Column | Data type | Key | Nullable | Description |
|--------|-----------|-----|----------|-------------|
| inventory_id | MEDIUMINT | PK | No | Unique identifier for each copy of a film. |
| film_id | SMALLINT | FK (film) | No | Film this copy belongs to. |
| store_id | TINYINT | FK (store) | No | Store where this copy is located. |
| last_update | TIMESTAMP | | No | Date the record was last updated. |

## 6. `store`

| Column | Data type | Key | Nullable | Description |
|--------|-----------|-----|----------|-------------|
| store_id | TINYINT | PK | No | Unique store identifier. |
| manager_staff_id | TINYINT | FK (staff) | No | Staff member who manages the store. |
| address_id | SMALLINT | FK (address) | No | Store address. |
| last_update | TIMESTAMP | | No | Date the record was last updated. |

## 7. `actor`

| Column | Data type | Key | Nullable | Description |
|--------|-----------|-----|----------|-------------|
| actor_id | SMALLINT | PK | No | Unique actor identifier. |
| first_name | VARCHAR(45) | | No | Actor's first name. |
| last_name | VARCHAR(45) | | No | Actor's last name. |
| last_update | TIMESTAMP | | No | Date the record was last updated. |

## Bridge tables (many-to-many)

These tables link records from tables with a many-to-many relationship.

| Table | Purpose | Columns |
|-------|---------|---------|
| `film_actor` | Links films with their actors. | `actor_id` (FK → actor), `film_id` (FK → film) |
| `film_category` | Links films with their categories. | `film_id` (FK → film), `category_id` (FK → category) |
