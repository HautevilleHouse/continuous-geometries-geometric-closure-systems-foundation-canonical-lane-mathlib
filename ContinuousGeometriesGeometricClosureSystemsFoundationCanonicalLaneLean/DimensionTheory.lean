import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure DimensionTheory (L : Type u) [CompleteLattice L] where
  dimensionFunction : L → ℕ
  dimensionAxioms : Prop
  dimensionZeroForBottom : dimensionFunction ⊥ = 0
  dimensionMonotone : ∀ x y, x ≤ y → dimensionFunction x ≤ dimensionFunction y
  dimensionCoverFormula : ∀ x y, dimensionFunction (x ⊔ y) + dimensionFunction (x ⊓ y) = dimensionFunction x + dimensionFunction y
  dimensionContinuous : ∀ (f : ℕ → L), (∀ n, f n ≤ f (n+1)) → dimensionFunction (⨆ n, f n) = ⨆ n, dimensionFunction (f n)

structure DimensionTheoryEvidence (D : DimensionTheory L) where
  dimensionAxiomsClosed : D.dimensionAxioms
  dimensionZeroForBottomClosed : D.dimensionZeroForBottom
  dimensionMonotoneClosed : ∀ x y h, D.dimensionMonotone x y h
  dimensionCoverFormulaClosed : ∀ x y, D.dimensionCoverFormula x y
  dimensionContinuousClosed : ∀ f h, D.dimensionContinuous f h

def DimensionTheoryClosed (D : DimensionTheory L) : Prop :=
  D.dimensionAxioms ∧ D.dimensionZeroForBottom ∧ (∀ x y, x ≤ y → D.dimensionMonotone x y) ∧
  (∀ x y, D.dimensionCoverFormula x y) ∧ (∀ f, (∀ n, f n ≤ f (n+1)) → D.dimensionContinuous f)

theorem dimension_theory_closed_from_evidence (D : DimensionTheory L)
    (E : DimensionTheoryEvidence D) : DimensionTheoryClosed D :=
  And.intro E.dimensionAxiomsClosed
    (And.intro E.dimensionZeroForBottomClosed
      (And.intro (fun x y h => E.dimensionMonotoneClosed x y h)
        (And.intro (fun x y => E.dimensionCoverFormulaClosed x y)
          (fun f h => E.dimensionContinuousClosed f h))))

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
