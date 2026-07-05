# LeetCode 626 - Exchange Seats

**Date:** July 5, 2026

## Problem

The task is to swap every pair of adjacent students based on their seat IDs. If the total number of students is odd, the last student should remain in the same seat.

## LINK 

https://leetcode.com/problems/exchange-seats/

## My Approach

My initial idea was straightforward.

* If the seat ID is odd, assign `id + 1`.
* If the seat ID is even, assign `id - 1`.

This works for all complete pairs of students.

However, after thinking about a few test cases, I realized it fails when the total number of students is odd. In that case, the last student doesn't have a partner to swap with, but my logic would still assign `id + 1`, which doesn't exist.

---

## First Working Solution

To handle this edge case, I checked whether the next seat ID existed.

* If `id + 1` exists, swap the seat.
* Otherwise, keep the current ID unchanged.

This solved the problem correctly.

Although the solution worked, I felt it wasn't the best approach because it checks whether `id + 1` exists for every odd seat.

---

## Optimization

After looking at the problem again, I realized that I didn't actually need to check whether the next seat existed.

The only seat that should remain unchanged is the **last seat** when the total number of students is odd.

Instead of checking `id + 1` repeatedly, I simply compared the current ID with `MAX(id)`.

* If the current ID is odd and not the last ID, swap it with the next seat.
* If the current ID is even, swap it with the previous seat.
* Otherwise, keep it unchanged.

This approach is simpler, easier to read, and avoids unnecessary existence checks.

---

## What I Learned

* Solving the problem correctly is only the first step; it's always worth looking for a cleaner solution.
* Instead of checking for the existence of the next seat every time, identifying the actual edge case made the logic much simpler.
* Sometimes a small observation can replace multiple conditions and make the query easier to understand.

---

## Final Thoughts

This problem reminded me that optimization isn't always about writing shorter code. Sometimes it's about identifying the real condition that matters and simplifying the logic around it.
