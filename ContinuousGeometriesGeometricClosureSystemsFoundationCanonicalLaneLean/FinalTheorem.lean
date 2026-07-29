import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

def ConstrainedGeometryClosure (A : AdmissibleObject) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_geometry_endgame (A : AdmissibleObject) : ConstrainedGeometryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
