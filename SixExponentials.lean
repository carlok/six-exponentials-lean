/-
Copyright (c) 2026 Carlo Perassi. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import SixExponentials.Basic.six_exponentials
public import SixExponentials.Basic.six_exponentials_of_numberField
public import SixExponentials.Basic.eq_zero_of_expSum_vanishes
public import SixExponentials.Basic.SXDefs
public import SixExponentials.Basic.descent_step
public import SixExponentials.Basic.liouville_house
public import SixExponentials.Basic.exists_denom_house_monomial_le
public import SixExponentials.Basic.expPoly_grid_estimate
public import SixExponentials.Basic.cauchy_estimate_with_zeros
public import SixExponentials.Basic.exists_aux_expSum
public import SixExponentials.Basic.siegel_entrywise

/-!
# The six exponentials theorem: the proof development

The eleven modules below `SixExponentials/Basic/` are the import closure of
`Diaz.six_exponentials` in https://github.com/carlok/diaz-modulus-lean, copied
with the changes the Lean module system needs and with the namespaces renamed.
The main theorem is `SixExponentials.six_exponentials`; it rests on the number-field
form `SixExponentials.SX.six_exponentials_of_numberField` (for `d + l < d * l`), which
is proved from an auxiliary function (`SX.exists_aux_expSum`), a descent step that
extends its zeros (`SX.descent_step`) and the vanishing of its coefficients
(`SX.eq_zero_of_expSum_vanishes`).
-/
