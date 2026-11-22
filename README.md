# The six exponentials theorem in Lean 4

This repository holds one theorem and its proof, extracted from a larger
library so that it can be checked on its own. It is prepared as a submission to
[Palomar](https://github.com/PalomarRegistry/PalomarPolicy), a registry of
machine-checked proofs.

**Theorem** (Lang 1966; Ramachandra 1968). Let x₁, x₂ be complex numbers
linearly independent over ℚ, and let y₁, y₂, y₃ be complex numbers linearly
independent over ℚ. Then at least one of the six numbers exp(xᵢyⱼ) is
transcendental.

```lean
theorem SixExponentials.six_exponentials_theorem (x : Fin 2 → ℂ) (y : Fin 3 → ℂ)
    (hx : LinearIndependent ℚ x) (hy : LinearIndependent ℚ y) :
    ∃ i j, Transcendental ℚ (Complex.exp (x i * y j))
```

Sources: S. Lang, *Introduction to Transcendental Numbers*, Addison-Wesley,
1966, chapter II; K. Ramachandra, Contributions to the theory of transcendental
numbers I, *Acta Arithmetica* 14 (1968), 65–72.

## Where the proof lives

The canonical home of this proof, and of the wider library on Diaz's conjecture
it belongs to, is **https://github.com/carlok/diaz-modulus-lean**. There the
theorem is `Diaz.six_exponentials`, in
[`Diaz/Mirror/six_exponentials.lean`](https://github.com/carlok/diaz-modulus-lean/blob/master/Diaz/Mirror/six_exponentials.lean),
since 13 September 2026. The eleven modules in `SixExponentials/Basic/` are its
import closure at commit `edb9c5b`, copied verbatim apart from what the Lean
module system needs (`module`, `public import`, `public section`) and the
renamed namespaces. Each file's header names the file it came from. Corrections
are made in the library first.

## What is here

| File | Contents |
| --- | --- |
| `Challenge.lean` | The statement, with `sorry`, and how to read it. Imports Mathlib only. |
| `Solution.lean` | The same declaration, proved by `SixExponentials.six_exponentials`. |
| `SixExponentials/` | The proof development: eleven modules, 1,147 lines in the original. |
| `comparator.json` | Which declaration Comparator compares, and the permitted axioms. |
| `formalization.yaml` | Sources, provenance, scope, automation and review. |

The proof is Schneider's method in the form of Lang and Ramachandra, relative
to a number field K. If the six numbers were algebraic they would lie in one
number field. Siegel's lemma then gives an exponential polynomial with integer
coefficients, not all zero, vanishing at the points ∑ mⱼyⱼ of a box of the
lattice (`SX.exists_aux_expSum`). A Cauchy estimate with zeros, played against
Liouville's inequality in K, extends the vanishing from each box to the next
(`SX.descent_step`). An exponential polynomial vanishing on the whole lattice
has zero coefficients, by Dedekind's independence of characters
(`SX.eq_zero_of_expSum_vanishes`), which is a contradiction. The library proves
this for d numbers x and l numbers y whenever d + l < dl
(`SX.six_exponentials_of_numberField`), and the theorem is the case d = 2, l = 3.

## Build and check

Lean `v4.35.0` and Mathlib `v4.35.0`, as pinned in `lean-toolchain` and
`lake-manifest.json`.

```sh
lake exe cache get                                # Mathlib build cache
lake build                                        # library, Challenge, Solution
python3 scripts/check_axioms.py                   # propext, Classical.choice, Quot.sound only
python3 scripts/check-lean-sources.py             # module headers, 10,000-line cap
ruby scripts/validate-formalization.rb formalization.yaml
./scripts/verify-comparator.sh                    # Linux only
```

`verify-comparator.sh` builds the pinned Comparator, lean4export, NanoDa and
Landrun, then checks that `Solution` proves exactly the statement of
`Challenge` with only the permitted axioms. Landrun's sandbox uses Linux
Landlock, so this step does not run on macOS; CI runs it on Ubuntu.

## How it was made

Claude agents (Anthropic) wrote the Lean proofs and the texts in this
repository under the direction of Carlo Perassi, who is responsible for them.
The proofs were first submitted to the Prove2Me platform, which checked and
accepted them, and then mirrored into diaz-modulus-lean. No mathematician has
reviewed the Lean code; its correctness rests on Lean's kernel, and in
Comparator on the independent NanoDa checker as well.

## Licence

Apache-2.0; see [`LICENSE`](LICENSE).
