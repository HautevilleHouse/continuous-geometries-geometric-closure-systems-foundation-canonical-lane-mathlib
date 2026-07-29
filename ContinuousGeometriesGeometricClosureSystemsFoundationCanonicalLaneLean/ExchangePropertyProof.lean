import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure ExchangePropertyProof (C : GeometricClosureSystem G) where
  exchangeHolds : ∀ (A : Set G) (a b : G), b ∉ C.geometry.closureOperator '' A → a ∈ C.geometry.closureOperator (insert b A) → a ∈ C.geometry.closureOperator A
  evidence : exchangeHolds

exchange_property_closed (C : GeometricClosureSystem G) (P : ExchangePropertyProof C) : ExchangePropertyProof C :=
  P

theorem exchange_property_from_geometric_closure_system (C : GeometricClosureSystem G) : ExchangePropertyProof C :=
  { exchangeHolds := C.exchangeProperty, evidence := C.exchangeProperty }

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse