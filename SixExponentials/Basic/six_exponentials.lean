/-
Origin: `Diaz/Mirror/six_exponentials.lean` in https://github.com/carlok/diaz-modulus-lean
(commit edb9c5b92df0935ed6834e1d965fe9c18cfa21bb), Apache-2.0.

Copied verbatim except for what the Lean module system needs (`module`, `public import`,
`public section`) and the renames of the import paths and of the namespaces
`Diaz`, `SX`, `Transcendence` to `SixExponentials`, `SixExponentials.SX`,
`SixExponentials.Transcendence`. The header of the origin file follows; the paths it
names are in diaz-modulus-lean.

Mirrored from Prove2Me: `DiazModulus.six_exponentials`.

Ported mechanically from the accepted submission archived as
`archive/prove2me/DiazModulus.six_exponentials__b4ee3ac8.lean`. Statement and proof are the platform's; only
imports, namespaces and the theorem's name were rewritten.
Names and spellings that changed between the platform's Mathlib revision and the one
pinned here were updated to match, and proof steps that became no-ops there were
dropped; the mathematics is unchanged.
-/
module

public import Mathlib
public import SixExponentials.Basic.six_exponentials_of_numberField

public section

namespace SixExponentials

/-! # Assembly check: the target from rung 2.  Must contain no `sorry`. -/

open Complex ComplexConjugate

theorem six_exponentials (x : Fin 2 → ℂ) (y : Fin 3 → ℂ)
    (hx : LinearIndependent ℚ x) (hy : LinearIndependent ℚ y) :
    ∃ i j, Transcendental ℚ (Complex.exp (x i * y j)) := by
  classical
  by_contra hcon
  simp only [Transcendental, not_exists, not_not] at hcon
  set S : Set ℂ := Set.range (fun q : Fin 2 × Fin 3 => Complex.exp (x q.1 * y q.2)) with hS
  have hSfin : S.Finite := Set.finite_range _
  have : Finite S := hSfin.to_subtype
  have hint : ∀ z ∈ S, IsIntegral ℚ z := by
    rintro z ⟨q, rfl⟩
    exact (hcon q.1 q.2).isIntegral
  have : FiniteDimensional ℚ (IntermediateField.adjoin ℚ S) :=
    IntermediateField.finiteDimensional_adjoin hint
  obtain ⟨i, j, hij⟩ :=
    SX.six_exponentials_of_numberField (d := 2) (l := 3) (by omega) x y hx hy
      (IntermediateField.adjoin ℚ S)
  exact hij (IntermediateField.subset_adjoin ℚ S ⟨(i, j), rfl⟩)

end SixExponentials
