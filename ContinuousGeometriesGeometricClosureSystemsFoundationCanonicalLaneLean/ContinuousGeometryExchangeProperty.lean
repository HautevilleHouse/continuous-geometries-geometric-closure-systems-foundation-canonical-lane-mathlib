import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure ExchangeProperty (C : ClosureSystem) where
  exchange : ∀ (s : Set C.carrier) (x y : C.carrier), x ∉ C.closureOp s → x ∈ C.closureOp (s ∪ {y}) → y ∈ C.closureOp (s ∪ {x})
  exchangeEvidence : exchange

theorem exchange_property_holds (C : ClosureSystem) (E : ExchangeProperty C) : E.exchange := E.exchangeEvidence

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
