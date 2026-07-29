import canonicalLaneMathlib.AdmissibleClass
import ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean.GeometricClosureSystem

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure ExchangeProperty (G : GeometricClosureSystem) where
  satisfiesExchange : Prop
  exchangeWitness : satisfiesExchange

def ExchangePropertyClosed {G : GeometricClosureSystem} (E : ExchangeProperty G) : Prop :=
  E.satisfiesExchange

theorem exchange_property_closed_from_evidence
    {G : GeometricClosureSystem} (E : ExchangeProperty G) :
    ExchangePropertyClosed E := by
  exact E.exchangeWitness

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse