import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

def ConstrainedContinuousGeometryClosure (A : ContinuousGeometryAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_continuous_geometry_endgame (A : ContinuousGeometryAdmissibleClass) :
    ConstrainedContinuousGeometryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
