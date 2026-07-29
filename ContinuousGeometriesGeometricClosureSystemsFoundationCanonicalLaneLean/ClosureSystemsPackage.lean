import ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure ClosureSystem where
  carrier : Type
  closureOp : carrier → carrier
  closureIdempotent : ∀ x, closureOp (closureOp x) = closureOp x
  closureExtensive : ∀ x, x → closureOp x
  closureMonotone : ∀ x y, (x → y) → closureOp x → closureOp y

structure ClosureSystemEvidence (C : ClosureSystem) where
  idempotentClosed : C.closureIdempotent
  extensiveClosed : C.closureExtensive
  monotoneClosed : C.closureMonotone

def ClosureSystemClosed (C : ClosureSystem) : Prop :=
  C.closureIdempotent ∧ C.closureExtensive ∧ C.closureMonotone

theorem closure_system_closed_from_evidence (C : ClosureSystem) (E : ClosureSystemEvidence C) :
    ClosureSystemClosed C := by
  exact And.intro E.idempotentClosed (And.intro E.extensiveClosed E.monotoneClosed)

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse