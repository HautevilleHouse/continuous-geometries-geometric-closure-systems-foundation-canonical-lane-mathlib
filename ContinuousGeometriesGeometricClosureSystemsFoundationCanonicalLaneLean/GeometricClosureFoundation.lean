import ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean.ContinuousGeometryPackage
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure GeometricClosureFoundation where
  continuousGeometry : ContinuousGeometry
  closurePreservesOpen : ∀ (U : Set continuousGeometry.closureSystem.carrier), IsOpen U → IsOpen (continuousGeometry.closureSystem.closureOp '' U)
  closurePreservesClosed : ∀ (C : Set continuousGeometry.closureSystem.carrier), IsClosed C → IsClosed (continuousGeometry.closureSystem.closureOp '' C)
  closureIntersection: ∀ (A : Set continuousGeometry.closureSystem.carrier), continuousGeometry.closureSystem.closureOp (sInf A) = sInf (continuousGeometry.closureSystem.closureOp '' A)

def GeometricClosureFoundationClosed (F : GeometricClosureFoundation) : Prop :=
  ContinuousGeometryClosed F.continuousGeometry ∧ F.closurePreservesOpen ∧ F.closurePreservesClosed ∧ F.closureIntersection

theorem geometric_closure_foundation_closed (F : GeometricClosureFoundation) (HG : ContinuousGeometryClosed F.continuousGeometry) :
    GeometricClosureFoundationClosed F := by
  exact And.intro HG (And.intro F.closurePreservesOpen (And.intro F.closurePreservesClosed F.closureIntersection))

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse