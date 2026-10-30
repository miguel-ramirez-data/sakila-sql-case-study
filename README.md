# Sakila DVD Rental — SQL Case Study

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?logo=powerbi&logoColor=black)

Business analysis of the **Sakila** sample database (a DVD-rental company) using PostgreSQL.
Eight realistic questions from management are answered with SQL; every query documents its
**objective, approach and assumptions**, results are exported to CSV, and key findings are visualized in Power BI.

## Skills demonstrated

- Multi-table `JOIN`s across up to 6 tables (category → film → inventory → rental → payment)
- Aggregations, `GROUP BY`, date functions (`EXTRACT`, `TO_CHAR`)
- Anti-join with `LEFT JOIN … IS NULL` to find never-rented titles
- Documenting assumptions behind every metric
- Exporting results and building visuals in Power BI

## Repository structure

```
├── SQL/              # one .sql file per business question
├── Results/          # CSV output of each query
├── Visuals/          # Power BI charts (JPG)
├── DataDictionary.md # tables, columns, keys
└── Sakila.pbix       # Power BI report
```

## Dataset

The Sakila schema models a movie-rental business:

| Area | Tables |
|------|--------|
| Films | `film`, `film_category`, `category`, `language` |
| Actors | `actor`, `film_actor` |
| Inventory & rentals | `inventory`, `rental` |
| Customers | `customer`, `address`, `city`, `country` |
| Payments | `payment` |
| Stores & staff | `store`, `staff` |

See the full [data dictionary](DataDictionary.md).

## Business questions & insights

| # | Question | Query | Result | Key insight |
|---|----------|-------|--------|-------------|
| 1 | How many films exist per category? | [SQL](SQL/01_films_by_category.sql) | [CSV](Results/01_films_by_category.csv) | All 16 categories are covered; Sports (74) and Foreign (73) are the largest. |
| 2 | What are the 10 longest films? | [SQL](SQL/02_top_longest_films.sql) | [CSV](Results/02_top_longest_films.csv) | The longest titles run 185 min, which may slow rental turnover. |
| 3 | Who are the top 10 customers by spending? | [SQL](SQL/03_top_customers.sql) | [CSV](Results/03_top_customers.csv) | Top customer spent $211.55 over 45 payments — good candidates for a loyalty program. |
| 4 | What is the monthly revenue trend in 2007? | [SQL](SQL/04_monthly_revenue_2007.sql) | [CSV](Results/04_monthly_revenue_2007.csv) | Data covers only Feb–May 2007: revenue climbs from $8.4K (Feb) to $28.6K (Apr); May is a partial month ($514). The window is too short to confirm seasonality. |
| 5 | Which films have never been rented? | [SQL](SQL/05_films_never_rented.sql) | [CSV](Results/05_films_never_rented.csv) | 42 titles have never been rented — candidates for promotion, bundling or removal. |
| 6 | What are the top 3 categories by revenue? | [SQL](SQL/06_top_categories_revenue.sql) | [CSV](Results/06_top_categories_revenue.csv) | **Sports, Sci-Fi and Animation** generate the most revenue and should lead stock planning. |
| 7 | Which actors generate the most revenue? | [SQL](SQL/07_top_actors_revenue.sql) | [CSV](Results/07_top_actors_revenue.csv) | A few actors (e.g. Susan Davis, Gina Degeneres) drive a large share of film revenue. |
| 8 | What are the busiest rental days? | [SQL](SQL/08_busiest_rental_day.sql) | [CSV](Results/08_busiest_rental_day.csv) | Tuesday (2,463) and Sunday (2,320) lead, but the spread between days is only ~12%, so demand is fairly even. |

## Visualizations (Power BI)

| Monthly revenue trend | Revenue by category |
|---|---|
| ![Monthly revenue](Visuals/MonthlyRevenueTrend.jpg) | ![Revenue by category](Visuals/RevenueByCategory.jpg) |
| **Top customers** | **Films never rented** |
| ![Top customers](Visuals/TopCustomers.jpg) | ![Films never rented](Visuals/FilmsNeverRented.jpg) |

## Conclusions & recommendations

1. **Revenue is concentrated** in a few categories and customers → prioritize those genres and launch a loyalty program for top spenders.
2. **Revenue grew strongly Feb → Apr 2007** → collect a longer history before planning seasonal campaigns.
3. **Catalog optimization is needed** → review the 42 never-rented titles.
4. **Weekly demand is fairly flat**, with a slight peak on Tuesday and Sunday → small staffing adjustments only.

## How to reproduce

1. Install PostgreSQL and load the Sakila sample (PostgreSQL port: [Pagila](https://github.com/devrimgunduz/pagila)).
2. Run any file in `SQL/` with psql or pgAdmin.
3. Open `Sakila.pbix` in Power BI Desktop to explore the visuals.

---

**Author:** Miguel Ramírez · [GitHub](https://github.com/miguel-ramirez-data)
