import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleObject) : Prop :=
  admittedClosure A

theorem bridge_from_admissible_class (A : AdmissibleObject) : bridgeClosed A := by
  exact A.compatibilityTerm

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
