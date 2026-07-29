import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

def bridgeClosed (A : ContinuousGeometryAdmissibleClass) : Prop :=
  ContinuousGeometryWitnessClosed A.object

theorem bridge_from_admissible_class (A : ContinuousGeometryAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
