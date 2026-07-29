import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure CoordinatizingRing (R : Type u) [Ring R] where
  involution : R → R
  involutionInvolution : ∀ r, involution (involution r) = r
  involutionAdd : ∀ r s, involution (r + s) = involution r + involution s
  involutionMul : ∀ r s, involution (r * s) = involution (involution s) * involution r
  regularElements : Set R
  regularIdeal : Ideal R
  regularElementsClosedUnderInvolution : ∀ r ∈ regularElements, involution r ∈ regularElements
  regularIdealInvolutionInvariant : involution '' regularIdeal = regularIdeal

structure CoordinatizingRingEvidence (C : CoordinatizingRing R) where
  involutionInvolutionClosed : ∀ r, C.involutionInvolution r
  involutionAddClosed : ∀ r s, C.involutionAdd r s
  involutionMulClosed : ∀ r s, C.involutionMul r s
  regularElementsClosedUnderInvolutionClosed : ∀ r hr, C.regularElementsClosedUnderInvolution r hr
  regularIdealInvolutionInvariantClosed : C.regularIdealInvolutionInvariant

def CoordinatizingRingClosed (C : CoordinatizingRing R) : Prop :=
  (∀ r, C.involutionInvolution r) ∧ (∀ r s, C.involutionAdd r s) ∧ (∀ r s, C.involutionMul r s) ∧
  (∀ r, r ∈ C.regularElements → C.involution r ∈ C.regularElements) ∧ C.regularIdealInvolutionInvariant

theorem coordinatizing_ring_closed_from_evidence (C : CoordinatizingRing R)
    (E : CoordinatizingRingEvidence C) : CoordinatizingRingClosed C :=
  And.intro E.involutionInvolutionClosed
    (And.intro E.involutionAddClosed
      (And.intro E.involutionMulClosed
        (And.intro E.regularElementsClosedUnderInvolutionClosed E.regularIdealInvolutionInvariantClosed)))

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
