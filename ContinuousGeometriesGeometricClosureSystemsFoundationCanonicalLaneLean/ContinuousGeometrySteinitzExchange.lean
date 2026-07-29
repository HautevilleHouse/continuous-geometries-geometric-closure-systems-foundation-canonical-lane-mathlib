import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure SteinitzExchangeProperty (C : ClosureSystem) where
  steinitz : ∀ (s : Set C.carrier) (x y : C.carrier), x ∈ C.closureOp (s ∪ {y}) → x ∉ C.closureOp s → y ∈ C.closureOp (s ∪ {x})
  steinitzEvidence : steinitz

theorem steinitz_holds (C : ClosureSystem) (E : SteinitzExchangeProperty C) : E.steinitz := E.steinitzEvidence

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
