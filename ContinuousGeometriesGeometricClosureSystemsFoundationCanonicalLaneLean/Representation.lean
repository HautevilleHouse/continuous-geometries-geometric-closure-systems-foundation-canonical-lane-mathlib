import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean.ContinuousGeometry

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure Representation (L : Type u) [CompleteLattice L] (G : ContinuousGeometry L) where
  vectorSpace : Type v
  field : Type w
  fieldWithInvolution : FieldWithInvolution field
  representationMap : L → Submodule field vectorSpace
  representationProperties : Prop
  representationInjective : Function.Injective representationMap
  representationPreservesJoins : ∀ x y, representationMap (x ⊔ y) = representationMap x ⊔ representationMap y
  representationPreservesMeets : ∀ x y, representationMap (x ⊓ y) = representationMap x ⊓ representationMap y
  representationPreservesClosure : ∀ x, representationMap (closureOperator x) = topologicalClosure (representationMap x)

structure RepresentationEvidence (R : Representation L G) where
  representationPropertiesClosed : R.representationProperties
  representationInjectiveClosed : R.representationInjective
  representationPreservesJoinsClosed : ∀ x y, R.representationPreservesJoins x y
  representationPreservesMeetsClosed : ∀ x y, R.representationPreservesMeets x y
  representationPreservesClosureClosed : ∀ x, R.representationPreservesClosure x

def RepresentationClosed (R : Representation L G) : Prop :=
  R.representationProperties ∧ R.representationInjective ∧
  (∀ x y, R.representationPreservesJoins x y) ∧ (∀ x y, R.representationPreservesMeets x y) ∧
  (∀ x, R.representationPreservesClosure x)

theorem representation_closed_from_evidence (R : Representation L G)
    (E : RepresentationEvidence R) : RepresentationClosed R :=
  And.intro E.representationPropertiesClosed
    (And.intro E.representationInjectiveClosed
      (And.intro E.representationPreservesJoinsClosed
        (And.intro E.representationPreservesMeetsClosed E.representationPreservesClosureClosed)))

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
