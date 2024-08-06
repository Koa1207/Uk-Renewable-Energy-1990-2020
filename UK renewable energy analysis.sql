--Create the table--

Create Table UK_Renewable_Energy_Consumption 
("Year" int, 
"Energy_from_renewable/waste_sources" float, 
"Total_energy_consumption_of_primary_fuels/equivalents" float, 
"Fraction_from_renewable/waste" float, 
"Hydroelectric_power" float, 
"Wind/Wave/Tidal" float, 
"Solar_photovoltaic" float, 
"Geothermal_aquifers" float, 
 "Landfill_gas" float, 
"Sewage_gas" float, 
"Biogas_from_autogen" float, 
"Municipal_solid_waste(MSW)" float, 
"Poultry_litter" float, 
"Straw" float, 
"Wood" float, 
"Charcoal" float, 
"Liquid_bio_fuels" float, 
"Bioethanol" float, 
"Biodiesel" float, 
"Biomass" float, 
"Cross-boundary_Adjustment" float); 

---Checking for null values: 

Select *FROM uk_Renewable_Energy_Consumption  
 WHERE  
"Year" Is null OR  
"Total_energy_consumption_of_primary_fuels/equivalents" IS null OR  
     "Fraction_from_renewable/waste" IS null  OR  
    "Hydroelectric_power" IS null  OR  
     "Wind/Wave/Tidal" IS null OR  
     "Solar_photovoltaic" IS null OR  
    "Geothermal_aquifers" IS null  OR  
     "Landfill_gas" IS null  OR  
     "Sewage_gas" IS null OR  
     "Biogas_from_autogen" Is null  OR  
     "Municipal_solid_waste(MSW)" IS null  OR  
     "Poultry_litter" IS null OR  
     "Straw"  IS null  OR  
     "Wood"  IS null  OR  
     "Charcoal"  IS null OR  
     "Liquid_bio_fuels" IS null  OR   
    "Bioethanol" IS null OR  
    "Biodiesel" IS null OR  
     "Biomass" IS null OR  
     "Cross-boundary_Adjustment" IS null; 
----
select * from UK_Renewable_Energy_consumption
--Top 10 years with the least energy consumption from renewable/waste sources: 

Select "Year", "Energy_from_renewable/waste_sources" 
from Uk_Renewable_Energy_Consumption 
Order by "Energy_from_renewable/waste_sources" ASC 
Limit 10; 

--Top 10 years with the least Total energy consumption of primary fuels and equivalents: 

Select "Year", "Total_energy_consumption_of_primary_fuels/equivalents"  from Uk_renewable_energy_consumption 
Order by "Energy_from_renewable/waste_sources" ASC 
Limit 10; 

--Top 10 years with the Most energy consumption from renewable/waste sources: 
Select "Year", "Energy_from_renewable/waste_sources"  
from Uk_Renewable_Energy_Consumption 
Order by "Energy_from_renewable/waste_sources" DESC 
Limit 10; 

--Top 10 years with the most Total energy consumption of primary fuels and equivalents: 

Select "Year", "Total_energy_consumption_of_primary_fuels/equivalents" 
from Uk_Renewable_Energy_Consumption 
Order by "Energy_from_renewable/waste_sources" DESC 
Limit 10; 

--Total Consumption over the 30 years: 
Select Sum( "Total_energy_consumption_of_primary_fuels/equivalents")
FROM uk_renewable_energy_consumption ; 

--Analyzing trends in renewable energy consumption over the years: 

Select "Year", sum ("Energy_from_renewable/waste_sources") As Total_Renewable_Consumption 
From Uk_Renewable_Energy_Consumption  
Group by "Year" 
Order by "Year" DESC; 

--The year with the highest Total Energy consumption: 

Select "Year", "Total_energy_consumption_of_primary_fuels/equivalents"  
FROM uk_renewable_energy_consumption  
WHERE  "Total_energy_consumption_of_primary_fuels/equivalents" = 
(Select Max( "Total_energy_consumption_of_primary_fuels/equivalents") 
from uk_renewable_energy_consumption ); 

--Impact of cross-boundary adjustments on renewable sources: 

Select "Year", "Bioethanol", "Biodiesel", "Cross-boundary_Adjustment"  
From Uk_Renewable_Energy_Consumption
Order By "Cross-boundary_Adjustment" DESC;

--Total consumption percentage change 1990-2020: 

Select  "Year", "Total_energy_consumption_of_primary_fuels/equivalents", 
100*(("Total_energy_consumption_of_primary_fuels/equivalents"- 225.532)/225.532) AS Percentage_Change 
FROM uk_renewable_energy_consumption 
Where "Year" in (1990,2020); 

--Year order of percentage change from highes to lowest: 

Select  "Year", "Total_energy_consumption_of_primary_fuels/equivalents", 100*(("Total_energy_consumption_of_primary_fuels/equivalents"- 225.532)/225.532) AS Percentage_Change
FROM uk_renewable_energy_consumption 
Order by Percentage_change DESC ; 

--Total consumption of all renewable energy sources: 

Select  
Sum ("Hydroelectric_power") AS Total_hydro, 
Sum ("Wind/Wave/Tidal") AS Total_Wind/Wave/Tidal, 
Sum ("Solar_photovoltaic") AS Total_Solar, 
sum ("Geothermal_aquifers") As Total_Geothermal, 
Sum ("Landfill_gas") AS Total_landfill, 
Sum ("Sewage_gas") AS Total_Sewage, 
sum ("Biogas_from_autogen") AS Total_Biogas, 
sum("Municipal_solid_waste(MSW)") As Total_MSW, 
sum ("Poultry_litter") AS Total_Poultry, 
sum ("Straw") AS Total_Straw, 
sum ("Liquid_bio_fuels") AS Total_Liquid_bio, 
Sum ("Bioethanol") As Total_bioethanol, 
sum("Biodiesel") AS Total_biodiesel, 
sum ("Biomass") AS Total_Biomass 
FROM uk_renewable_energy_consumption; 



