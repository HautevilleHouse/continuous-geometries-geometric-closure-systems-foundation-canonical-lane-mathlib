import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure AdmissibleObject where
  closureSystem : GeometricClosureSystem
  geometry : ContinuousGeometry
  isAdmissible : Prop
  compatibility : Prop
  compatibilityTerm : compatibility

def admittedClosure (A : AdmissibleObject) : Prop :=
  GeometricClosureClosed A.closureSystem ∧ ContinuousGeometryClosed A.geometry

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
