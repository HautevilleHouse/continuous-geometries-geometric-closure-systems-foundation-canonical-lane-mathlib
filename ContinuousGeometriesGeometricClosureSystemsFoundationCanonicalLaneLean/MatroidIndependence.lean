import canonicalLaneMathlib.AdmissibleClass
import ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean.SteinitzExchangeLemma

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure MatroidIndependence (G : GeometricClosureSystem) (E : ExchangeProperty G) where
  independentSets : Set (Set G.carrier)
  isMatroid : Prop

structure MatroidIndependenceEvidence {G : GeometricClosureSystem} {E : ExchangeProperty G}
    (M : MatroidIndependence G E) where
  isMatroidClosed : M.isMatroid

def MatroidIndependenceClosed {G : GeometricClosureSystem} {E : ExchangeProperty G}
    (M : MatroidIndependence G E) : Prop :=
  M.isMatroid

theorem matroid_independence_closed_from_evidence
    {G : GeometricClosureSystem} {E : ExchangeProperty G}
    (M : MatroidIndependence G E) (Ev : MatroidIndependenceEvidence M) :
    MatroidIndependenceClosed M := by
  exact Ev.isMatroidClosed

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse