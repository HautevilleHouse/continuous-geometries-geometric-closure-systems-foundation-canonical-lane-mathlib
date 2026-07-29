import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure GeometryClosureState where
  admissibleObject : AdmissibleObject

def geometryProjection : Projection GeometryClosureState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem geometry_projection_idempotent (x : GeometryClosureState) :
    geometryProjection.toFun (geometryProjection.toFun x) = geometryProjection.toFun x := by
  exact geometryProjection.idempotent x

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
