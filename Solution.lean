/-
Copyright (c) 2026 Carlo Perassi. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import SixExponentials

public section

/-!
# Proved solution

The proved counterpart of the declaration stated in `Challenge.lean`. Comparator
checks that it has exactly the same name and type as its counterpart there, and
that it depends on no axiom beyond `propext`, `Quot.sound` and `Classical.choice`.

The proof is the library theorem `SixExponentials.six_exponentials`, whose
statement is the same term. The library proves it from the number-field form
`SixExponentials.SX.six_exponentials_of_numberField`: if the six numbers were all
algebraic they would lie in one number field `K`; an auxiliary function
`F(z) = ∑ p_λ exp(⟨λ, x⟩ z)` with integer coefficients, not all zero, is built by
Siegel's lemma so as to vanish at the points `∑ mⱼ yⱼ` of a box of the lattice
(`SX.exists_aux_expSum`); a Cauchy estimate with zeros against Liouville's
inequality in `K` extends the vanishing from each box to the next
(`SX.descent_step`); and an exponential polynomial that vanishes on the whole
lattice has zero coefficients, by Dedekind's independence of characters and the
linear independence of the `x` and the `y` (`SX.eq_zero_of_expSum_vanishes`).
-/

namespace SixExponentials

theorem six_exponentials_theorem (x : Fin 2 → ℂ) (y : Fin 3 → ℂ)
    (hx : LinearIndependent ℚ x) (hy : LinearIndependent ℚ y) :
    ∃ i j, Transcendental ℚ (Complex.exp (x i * y j)) :=
  six_exponentials x y hx hy

end SixExponentials
