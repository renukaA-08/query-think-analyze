# Problem

Write a solution to find all products whose description contains a valid serial number pattern. A valid serial number follows these rules:

It starts with the letters SN (case-sensitive).
Followed by exactly 4 digits.
It must have a hyphen (-) followed by exactly 4 digits.
The serial number must be within the description (it may not necessarily start at the beginning).
Return the result table ordered by product_id in ascending order.

# Link

https://leetcode.com/problems/find-products-with-valid-serial-numbers/

# Approach

In this solution, I used the `REGEXP_LIKE()` function to identify products whose description contains a valid serial number.

The serial number can appear anywhere in the description, but it must follow this format:

```
SN1234-5678
```

where:
- It starts with uppercase **SN**.
- It is followed by exactly **4 digits**.
- A hyphen (`-`) separates the two groups of digits.
- Another **4 digits** appear after the hyphen.
- The match is **case-sensitive**, so values like `sn1234-5678` or `Sn1234-5678` are not considered valid.

## Regular Expression Used

```sql
'\\bSN[0-9]{4}-[0-9]{4}\\b'
```

### Regex Explanation

| Pattern | Meaning |
|---------|---------|
| `\\b` | Matches a word boundary, ensuring the serial number is a complete word and not part of another string. |
| `SN` | Matches the uppercase characters `SN`. |
| `[0-9]{4}` | Matches exactly four digits (0–9). |
| `-` | Matches the hyphen separating the two groups of digits. |
| `[0-9]{4}` | Matches exactly four digits after the hyphen. |
| `\\b` | Matches the end of the word boundary. |

## Case-Sensitive Matching

```sql
REGEXP_LIKE(description, '\\bSN[0-9]{4}-[0-9]{4}\\b', 'c')
```

The third argument `'c'` enables **case-sensitive** matching, ensuring that only serial numbers beginning with uppercase `SN` are matched.
