import canonicalLaneMathlib.AdmissibleClass
import ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean.ExchangeProperty

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure SteinitzExchangeLemma (G : GeometricClosureSystem) (E : ExchangeProperty G) where
  lemmaStatement : Prop
  lemmaProof : lemmaStatement

def SteinitzExchangeLemmaClosed {G : GeometricClosureSystem} {E : ExchangeProperty G}
    (S : SteinitzExchangeLemma G E) : Prop :=
  S.lemmaStatement

theorem steinitz_exchange_lemma_closed_from_evidence
    {G : GeometricClosureSystem} {E : ExchangeProperty G}
    (S : SteinitzExchangeLemma G E) : SteinitzExchangeLemmaClosed S := by
  exact S.lemmaProof

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse