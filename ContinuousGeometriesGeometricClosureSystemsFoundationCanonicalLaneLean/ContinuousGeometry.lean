import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure ContinuousGeometry where
  carrier : Type u
  join : carrier → carrier → carrier
  meet : carrier → carrier → carrier
  complement : carrier → carrier
  isContinuous : Prop
  joinAssoc : ∀ a b c, join (join a b) c = join a (join b c)
  meetAssoc : ∀ a b c, meet (meet a b) c = meet a (meet b c)
  absorption : ∀ a b, join a (meet a b) = a
  distributivity : ∀ a b c, meet a (join b c) = join (meet a b) (meet a c)
  complementLaw : ∀ a, join a (complement a) = carrier
  meetComplement : ∀ a, meet a (complement a) = carrier

structure ContinuousGeometryEvidence (G : ContinuousGeometry) where
  isContinuousClosed : G.isContinuous
  joinAssocClosed : ∀ a b c : G.carrier, G.join (G.join a b) c = G.join a (G.join b c)
  meetAssocClosed : ∀ a b c : G.carrier, G.meet (G.meet a b) c = G.meet a (G.meet b c)
  absorptionClosed : ∀ a b : G.carrier, G.join a (G.meet a b) = a
  distributivityClosed : ∀ a b c : G.carrier, G.meet a (G.join b c) = G.join (G.meet a b) (G.meet a c)
  complementLawClosed : ∀ a : G.carrier, G.join a (G.complement a) = G.carrier
  meetComplementClosed : ∀ a : G.carrier, G.meet a (G.complement a) = G.carrier

def ContinuousGeometryClosed (G : ContinuousGeometry) : Prop :=
  G.isContinuous ∧
  (∀ a b c, G.join (G.join a b) c = G.join a (G.join b c)) ∧
  (∀ a b c, G.meet (G.meet a b) c = G.meet a (G.meet b c)) ∧
  (∀ a b, G.join a (G.meet a b) = a) ∧
  (∀ a b c, G.meet a (G.join b c) = G.join (G.meet a b) (G.meet a c)) ∧
  (∀ a, G.join a (G.complement a) = G.carrier) ∧
  (∀ a, G.meet a (G.complement a) = G.carrier)

theorem continuous_geometry_closed_from_evidence (G : ContinuousGeometry) (E : ContinuousGeometryEvidence G) : ContinuousGeometryClosed G := by
  exact And.intro E.isContinuousClosed
    (And.intro E.joinAssocClosed
      (And.intro E.meetAssocClosed
        (And.intro E.absorptionClosed
          (And.intro E.distributivityClosed
            (And.intro E.complementLawClosed E.meetComplementClosed)))))

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
