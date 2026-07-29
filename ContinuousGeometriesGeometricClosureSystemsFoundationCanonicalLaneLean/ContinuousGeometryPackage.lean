import ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean.ClosureSystemsPackage

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure ContinuousGeometry where
  closureSystem : ClosureSystem
  continuousJoinOp : closureSystem.carrier → closureSystem.carrier → closureSystem.carrier
  continuousMeetOp : closureSystem.carrier → closureSystem.carrier → closureSystem.carrier
  joinClosed : ∀ a b, closureSystem.closureOp (continuousJoinOp a b) = continuousJoinOp a b
  meetClosed : ∀ a b, closureSystem.closureOp (continuousMeetOp a b) = continuousMeetOp a b
  distributiveLaw : ∀ a b c, continuousMeetOp a (continuousJoinOp b c) = continuousJoinOp (continuousMeetOp a b) (continuousMeetOp a c)
  continuousJoinContinuous : ∀ a, Continuous (continuousJoinOp a)
  continuousMeetContinuous : ∀ a, Continuous (continuousMeetOp a)

structure ContinuousGeometryEvidence (G : ContinuousGeometry) where
  joinClosed : G.joinClosed
  meetClosed : G.meetClosed
  distributiveLaw : G.distributiveLaw
  joinContinuous : G.continuousJoinContinuous
  meetContinuous : G.continuousMeetContinuous

def ContinuousGeometryClosed (G : ContinuousGeometry) : Prop :=
  G.joinClosed ∧ G.meetClosed ∧ G.distributiveLaw ∧ G.continuousJoinContinuous ∧ G.continuousMeetContinuous

theorem continuous_geometry_closed_from_evidence (G : ContinuousGeometry) (E : ContinuousGeometryEvidence G) :
    ContinuousGeometryClosed G := by
  exact And.intro E.joinClosed (And.intro E.meetClosed (And.intro E.distributiveLaw (And.intro E.joinContinuous E.meetContinuous)))

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse