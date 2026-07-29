import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure ContinuousGeometry where
  carrier : Type u
  topology : TopologicalSpace carrier
  closureSystem : ClosureSystem
  exchangeProperty : ExchangeProperty closureSystem
  continuousClosure : closureSystem.continuous

def ContinuousGeometryClosed (G : ContinuousGeometry) : Prop :=
  ClosureSystemClosed G.closureSystem ∧ ExchangeProperty.exchange G.exchangeProperty

theorem continuous_geometry_closed (G : ContinuousGeometry) : ContinuousGeometryClosed G := by
  refine And.intro (ClosureSystemClosed.mk ?_ ?_ ?_ ?_) G.exchangeProperty.exchangeEvidence
  · exact G.closureSystem.monotone
  · exact G.closureSystem.extensive
  · exact G.closureSystem.idempotent
  · exact G.continuousClosure

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
