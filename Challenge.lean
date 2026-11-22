/-
Copyright (c) 2026 Carlo Perassi. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
-- The whole of Mathlib is imported on purpose. `Solution` sees all of Mathlib
-- through the proof development, and Comparator compares the two statements as
-- elaborated terms, instance arguments included. Importing the same closure here
-- makes the instances found for `Module ℚ ℂ` and `Algebra ℚ ℂ` the same in both.
module

public import Mathlib

public section

/-!
# The six exponentials theorem

Let `x₁, x₂` be two complex numbers that are linearly independent over the
rational numbers, and let `y₁, y₂, y₃` be three complex numbers that are linearly
independent over the rational numbers. Then at least one of the six numbers
`exp (xᵢ yⱼ)`, for `i = 1, 2` and `j = 1, 2, 3`, is transcendental.

The theorem was proved independently by Serge Lang (*Introduction to
Transcendental Numbers*, Addison-Wesley, 1966, chapter II) and by
K. Ramachandra (*Contributions to the theory of transcendental numbers I*,
Acta Arithmetica 14 (1968), 65–72). The same statement with two numbers on each
side is the four exponentials conjecture, which is open.

## Reading the Lean statement

* `x : Fin 2 → ℂ` and `y : Fin 3 → ℂ` are the two families: `x 0, x 1` are
  `x₁, x₂`, and `y 0, y 1, y 2` are `y₁, y₂, y₃`.
* `LinearIndependent ℚ x` is Mathlib's linear independence of the family `x` in
  `ℂ`, viewed as a vector space over `ℚ`: the only rationals `a₁, a₂` with
  `a₁ x₁ + a₂ x₂ = 0` are `a₁ = a₂ = 0`. In particular `x₁` and `x₂` are non-zero
  and distinct. The same holds for `y`.
* `Transcendental ℚ z` is Mathlib's "`z` is not algebraic over `ℚ`": `z` is a root
  of no non-zero polynomial with rational coefficients.
* `Complex.exp` is the complex exponential function, and the conclusion asks for
  indices `i : Fin 2` and `j : Fin 3` with `exp (x i * y j)` transcendental.

The statement is the classical one, with nothing added or removed. The version
with three numbers `x` and two numbers `y` follows by exchanging the two families
and is not stated separately.
-/

namespace SixExponentials

/-- **The six exponentials theorem** (Lang 1966; Ramachandra 1968). If `x₁, x₂`
are linearly independent over `ℚ` and `y₁, y₂, y₃` are linearly independent over
`ℚ`, then some `exp (xᵢ yⱼ)` is transcendental. -/
theorem six_exponentials_theorem (x : Fin 2 → ℂ) (y : Fin 3 → ℂ)
    (hx : LinearIndependent ℚ x) (hy : LinearIndependent ℚ y) :
    ∃ i j, Transcendental ℚ (Complex.exp (x i * y j)) := by
  sorry

end SixExponentials
