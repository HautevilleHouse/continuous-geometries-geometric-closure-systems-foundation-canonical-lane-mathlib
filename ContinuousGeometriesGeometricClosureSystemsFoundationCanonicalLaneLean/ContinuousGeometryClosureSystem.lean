import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure ClosureSystem where
  carrier : Type u
  closureOp : (Set carrier) → Set carrier
  monotone : ∀ s t : Set carrier, s ⊆ t → closureOp s ⊆ closureOp t
  extensive : ∀ s : Set carrier, s ⊆ closureOp s
  idempotent : ∀ s : Set carrier, closureOp (closureOp s) = closureOp s
  continuous : Prop
  continuousEvidence : continuous

structure ClosureSystemEvidence (C : ClosureSystem) where
  monotoneClosed : C.monotone
  extensiveClosed : C.extensive
  idempotentClosed : C.idempotent
  continuousClosed : C.continuous

def ClosureSystemClosed (C : ClosureSystem) : Prop :=
  C.monotone ∧ C.extensive ∧ C.idempotent ∧ C.continuous

theorem closure_system_closed_from_evidence (C : ClosureSystem) (E : ClosureSystemEvidence C) :
    ClosureSystemClosed C := by
  exact And.intro E.monotoneClosed (And.intro E.extensiveClosed (And.intro E.idempotentClosed E.continuousClosed))

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
