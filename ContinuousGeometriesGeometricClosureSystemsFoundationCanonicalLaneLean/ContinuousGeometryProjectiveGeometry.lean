import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure ProjectiveGeometry where
  pointSet : Type u
  lineSet : Type v
  incidence : pointSet → lineSet → Prop
  incidenceAxioms : Prop
  incidenceEvidence : incidenceAxioms

def ProjectiveGeometryClosed (P : ProjectiveGeometry) : Prop := P.incidenceAxioms

theorem projective_geometry_closed (P : ProjectiveGeometry) : ProjectiveGeometryClosed P := P.incidenceEvidence

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse
