import canonicalLaneMathlib.AdmissibleClass
import ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean.GeometricClosureSystem

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean

structure GeometricLattice (G : GeometricClosureSystem) where
  carrier : Set G.carrier
  join : carrier -> carrier -> carrier
  meet : carrier -> carrier -> carrier
  isLattice : Prop
  isGeometric : Prop

structure GeometricLatticeEvidence {G : GeometricClosureSystem} (L : GeometricLattice G) where
  isLatticeClosed : L.isLattice
  isGeometricClosed : L.isGeometric

def GeometricLatticeClosed {G : GeometricClosureSystem} (L : GeometricLattice G) : Prop :=
  L.isLattice ∧ L.isGeometric

theorem geometric_lattice_closed_from_evidence
    {G : GeometricClosureSystem} (L : GeometricLattice G) (E : GeometricLatticeEvidence L) :
    GeometricLatticeClosed L := by
  exact And.intro E.isLatticeClosed E.isGeometricClosed

end ContinuousGeometriesGeometricClosureSystemsFoundationCanonicalLaneLean
end HautevilleHouse