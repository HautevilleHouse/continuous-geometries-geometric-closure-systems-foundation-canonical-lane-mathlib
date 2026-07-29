import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure GeometricClosureSystem where
  carrier : Type u
  closureOperator : (Set carrier) → Set carrier
  idempotent : ∀ s, closureOperator (closureOperator s) = closureOperator s
  extensive : ∀ s, s ⊆ closureOperator s
  isotone : ∀ s t, s ⊆ t → closureOperator s ⊆ closureOperator t

structure GeometricClosureEvidence (G : GeometricClosureSystem) where
  idempotentClosed : ∀ s : Set G.carrier, G.closureOperator (G.closureOperator s) = G.closureOperator s
  extensiveClosed : ∀ s : Set G.carrier, s ⊆ G.closureOperator s
  isotoneClosed : ∀ s t : Set G.carrier, s ⊆ t → G.closureOperator s ⊆ G.closureOperator t

def GeometricClosureClosed (G : GeometricClosureSystem) : Prop :=
  (∀ s, G.closureOperator (G.closureOperator s) = G.closureOperator s) ∧
  (∀ s, s ⊆ G.closureOperator s) ∧
  (∀ s t, s ⊆ t → G.closureOperator s ⊆ G.closureOperator t)

theorem geometric_closure_closed_from_evidence (G : GeometricClosureSystem) (E : GeometricClosureEvidence G) : GeometricClosureClosed G := by
  exact And.intro E.idempotentClosed (And.intro E.extensiveClosed E.isotoneClosed)

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
