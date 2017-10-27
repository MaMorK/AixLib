within AixLib.Fluid.Movers.Compressors.Utilities.VolumetricEfficiency;
model ConstantEfficiency
  "General model that describes a constant overall volumetric efficiency"
  extends PartialVolumetricEfficiency;

  // Definition of parameters
  //
  parameter Modelica.SIunits.Efficiency lamHCon = 0.9
    "Constant overall volumetric efficiency";

equation
  // Calculate overall volumetric efficiency
  //
  lamH = lamHCon "Allocation of constant overall volumetric efficiency";

  annotation (Documentation(revisions="<html>
<ul>
  <li>
  October 20, 2017, by Mirko Engelpracht:<br/>
  First implementation
  (see <a href=\"https://github.com/RWTH-EBC/AixLib/issues/467\">issue 467</a>).
  </li>
</ul>
</html>"));
end ConstantEfficiency;