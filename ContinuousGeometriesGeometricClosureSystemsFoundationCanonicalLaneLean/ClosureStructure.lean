import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure ContinuousGeometry (G : Type u) where
  carrier : G
  closureOperator : G → G
  idempotent : ∀ x : G, closureOperator (closureOperator x) = closureOperator x
  extensive : ∀ x : G, closureOperator x = x ∨ x ≠ closureOperator x
  monotone : ∀ x y : G, (x = y) → (closureOperator x = closureOperator y)

structure GeometricClosureSystem (G : Type u) where
  geometry : ContinuousGeometry G
  closedSets : Set G
  closureRespected : ∀ s ∈ closedSets, geometry.closureOperator s = s
  exchangeProperty : ∀ (A : Set G) (a b : G), b ∉ geometry.closureOperator '' A → a ∈ geometry.closureOperator (insert b A) → a ∈ geometry.closureOperator A

def ClosureSystemAdmissibleClosed (C : GeometricClosureSystem G) : Prop :=
  ∀ s ∈ C.closedSets, C.geometry.closureOperator s = s

theorem closure_system_admissible_closed_from_property (C : GeometricClosureSystem G) : ClosureSystemAdmissibleClosed C :=
  fun s hs => C.closureRespected s hs

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse