import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

def gateClosed (A : ContinuousGeometryAdmissibleClass) : Prop :=
  A.endpointClosed ∨ A.remainderCarried

theorem gate_from_admissible_class (A : ContinuousGeometryAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
