import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure GeometricClosureClosedObject where
  closure : Prop
  closureClosed : closure

def GeometricClosureClosed (O : GeometricClosureClosedObject) : Prop :=
  O.closure

structure ContinuousGeometriesGeometricClosureAdmittedObject where
  object : GeometricClosureClosedObject
  conclusion : GeometricClosureClosed object

def sourceRepository : String :=
  "continuous-geometries-geometric-closure-systems-foundation-canonical-lane"

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse