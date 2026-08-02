## Problem

You have a table of 1000 customer records from a small-business based in Australia.

Find all customers who are between the ages of 18 and 22 (inclusive), live in either Victoria, Tasmania, Queensland, their gender isn't "n/a", and their name starts with either 'A' or 'B'.

## Link

https://datalemur.com/questions/sql-filtering-practice-exercise-1

## Approach

The query filters records using multiple conditions combined with the `WHERE` clause.

### 1. Filter by Age

```sql
age BETWEEN 18 AND 22
```

- `BETWEEN` checks whether the age falls within the given range.
- It is **inclusive**, meaning both `18` and `22` are included.

---

### 2. Filter by State

```sql
state IN ('Victoria', 'Tasmania', 'Queensland')
```

- `IN` is used instead of multiple `OR` conditions.
- It returns only customers from the specified states.

Equivalent to:

```sql
state = 'Victoria'
OR state = 'Tasmania'
OR state = 'Queensland'
```

---

### 3. Exclude Invalid Gender

```sql
gender <> 'n/a'
```

- Removes customers whose gender is recorded as `'n/a'`.

---

### 4. Filter Customer Names

```sql
customer_name LIKE 'A%'
OR customer_name LIKE 'B%'
```

- `LIKE 'A%'` matches names beginning with **A**.
- `LIKE 'B%'` matches names beginning with **B**.
- `%` is a wildcard representing zero or more characters.

## SQL Concepts Used

- `SELECT`
- `WHERE`
- `BETWEEN`
- `IN`
- `LIKE`
- Logical operators (`AND`, `OR`)
- Comparison operator (`<>`)
