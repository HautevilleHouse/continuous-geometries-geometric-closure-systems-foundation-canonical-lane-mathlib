import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure ContinuousGeometryAdmittedObject where
  carrier : Type
  geometryClosure : carrier → Prop
  closureIdempotent : ∀ x, geometryClosure (geometryClosure x) = geometryClosure x
  closureExtensive : ∀ x, x → geometryClosure x

def GeometricWitnessClosed (O : ContinuousGeometryAdmittedObject) : Prop :=
  ∀ x, O.geometryClosure x

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse