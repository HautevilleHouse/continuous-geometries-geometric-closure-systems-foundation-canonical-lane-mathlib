import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure Independence (L : Type u) [CompleteLattice L] where
  independentSet : Set L
  independenceDefinition : Prop
  independentJoin : ∀ S ⊆ independentSet, ⋁ S ∈ independentSet → False
  independentClosurePreserved : closureOperator (⋁ S) = ⋁ (closureOperator '' S)
  exchangeProperty : ∀ x y, x ∉ closureOperator {y} → y ∉ closureOperator {x} → closureOperator {x} = closureOperator {y}

structure IndependenceEvidence (I : Independence L) where
  independenceDefinitionClosed : I.independenceDefinition
  independentJoinClosed : ∀ S h, I.independentJoin S h
  independentClosurePreservedClosed : I.independentClosurePreserved
  exchangePropertyClosed : ∀ x y h1 h2, I.exchangeProperty x y h1 h2

def IndependenceClosed (I : Independence L) : Prop :=
  I.independenceDefinition ∧ (∀ S, S ⊆ I.independentSet → I.independentJoin S) ∧
  I.independentClosurePreserved ∧ (∀ x y, x ∉ closureOperator {y} → y ∉ closureOperator {x} → I.exchangeProperty x y)

theorem independence_closed_from_evidence (I : Independence L)
    (E : IndependenceEvidence I) : IndependenceClosed I :=
  And.intro E.independenceDefinitionClosed
    (And.intro E.independentJoinClosed
      (And.intro E.independentClosurePreservedClosed E.exchangePropertyClosed))

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
