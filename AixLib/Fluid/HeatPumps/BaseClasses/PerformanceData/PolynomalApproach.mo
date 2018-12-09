﻿within AixLib.Fluid.HeatPumps.BaseClasses.PerformanceData;
model PolynomalApproach
  "Calculating heat pump data based on a polynomal approach"
  extends BaseClasses.PartialPerformanceData;

  replaceable function PolyData =
      AixLib.Fluid.HeatPumps.BaseClasses.Functions.Characteristics.PartialBaseFct
                                                                           "Function to calculate peformance Data" annotation(choicesAllMatching=true);
protected
  Real Char[2];
equation
  Char = PolyData(sigBusHP.N,sigBusHP.T_ret_co,sigBusHP.T_flow_ev,sigBusHP.m_flow_co,sigBusHP.m_flow_ev);
  if sigBusHP.N > Modelica.Constants.eps then
    //Get's the data from the signal Bus and calculates the power and heat flow based on the function one chooses.
    QCon = Char[2];
    Pel = Char[1];
  else //If heat pump is turned off, all values become zero.
    QCon = 0;
    Pel = 0;
  end if;
  QEva = -(QCon - Pel);
  annotation (Icon(graphics={
        Text(
          lineColor={0,0,255},
          extent={{-136,109},{164,149}},
          textString="%name"),
        Ellipse(
          lineColor = {108,88,49},
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent={{-86,-96},{88,64}}),
        Text(
          lineColor={108,88,49},
          extent={{-90,-108},{90,72}},
          textString="f")}), Documentation(revisions="<html>
 <li><i>November 26, 2018&nbsp;</i> by Fabian Wüllhorst: <br/>First implementation (see issue <a href=\"https://github.com/RWTH-EBC/AixLib/issues/577\">#577</a>)</li>
</html>", info="<html>
<p>This model is used to calculate the three values based on a functional approach. The user can choose between several functions or use their own.</p>
<p>As the <a href=\"modelica://AixLib.Fluid.HeatPumps.BaseClasses.Functions.Characteristics.PartialBaseFct\">base function</a> only returns the electrical power and the condenser heat flow, the evaporator heat flow is calculated with the following energy balance:</p>
<p>				<i>QEva = QCon - P_el</i></p>
</html>"));
end PolynomalApproach;
