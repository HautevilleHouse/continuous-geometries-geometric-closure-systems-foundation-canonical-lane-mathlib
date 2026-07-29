import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleObject) : Prop :=
  A.isAdmissible ∨ A.compatibility

theorem gate_from_admissible_class (A : AdmissibleObject) : gateClosed A := by
  refine Or.inr ?_
  exact A.compatibilityTerm

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
