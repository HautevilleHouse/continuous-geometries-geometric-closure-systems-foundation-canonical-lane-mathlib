import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean.ContinuousGeometry

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure GeometricClosureSystem (L : Type u) [CompleteLattice L] where
  carrier : Set L
  closureOperator : L → L
  closureAxioms : Prop
  closureIdempotent : ∀ x, closureOperator (closureOperator x) = closureOperator x
  closureExtensive : ∀ x, x ≤ closureOperator x
  closureMonotone : ∀ x y, x ≤ y → closureOperator x ≤ closureOperator y

structure GeometricClosureSystemEvidence (C : GeometricClosureSystem L) where
  closureAxiomsClosed : C.closureAxioms
  closureIdempotentClosed : ∀ x, C.closureIdempotent x
  closureExtensiveClosed : ∀ x, C.closureExtensive x
  closureMonotoneClosed : ∀ x y h, C.closureMonotone x y h

def GeometricClosureSystemClosed (C : GeometricClosureSystem L) : Prop :=
  C.closureAxioms ∧ (∀ x, C.closureIdempotent x) ∧ (∀ x, C.closureExtensive x) ∧ (∀ x y, x ≤ y → C.closureMonotone x y)

theorem geometric_closure_system_closed_from_evidence (C : GeometricClosureSystem L)
    (E : GeometricClosureSystemEvidence C) : GeometricClosureSystemClosed C :=
  And.intro E.closureAxiomsClosed
    (And.intro (fun x => E.closureIdempotentClosed x)
      (And.intro (fun x => E.closureExtensiveClosed x) (fun x y h => E.closureMonotoneClosed x y h)))

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
