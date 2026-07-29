import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | ContinuousGeometryObject G => G.closureOperator G.carrier = G.carrier
  | _ => False

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  match A.object with
  | ContinuousGeometryObject G => 
    have h := G.idempotent G.carrier
    by
      simp [bridgeClosed, h]
  | _ => False.elim (by
    have : A.object ≠ ContinuousGeometryObject (default) := by
      intro h; injection h
    exact this rfl)

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse