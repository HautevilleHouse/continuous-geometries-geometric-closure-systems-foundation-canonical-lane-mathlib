import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure CompleteLatticeEmbedding (C : GeometricClosureSystem G) where
  lattice : Type u
  latticeOrder : PartialOrder lattice
  latticeSup : lattice → lattice → lattice
  latticeInf : lattice → lattice → lattice
  embedding : G → lattice
  supPreserved : ∀ x y : G, embedding (C.geometry.closureOperator x) ⊔ embedding (C.geometry.closureOperator y) = embedding (C.geometry.closureOperator (C.geometry.closureOperator x ⊔ C.geometry.closureOperator y))
  infPreserved : ∀ x y : G, embedding (C.geometry.closureOperator x) ⊓ embedding (C.geometry.closureOperator y) = embedding (C.geometry.closureOperator (C.geometry.closureOperator x ⊓ C.geometry.closureOperator y))

def LatticeEmbeddingClosed (E : CompleteLatticeEmbedding C) : Prop :=
  E.supPreserved ∧ E.infPreserved

theorem lattice_embedding_closed_from_property (E : CompleteLatticeEmbedding C) : LatticeEmbeddingClosed E :=
  And.intro E.supPreserved E.infPreserved

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse