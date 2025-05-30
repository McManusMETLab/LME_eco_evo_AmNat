Citable as <a href="https://doi.org/10.5281/zenodo.15549499"><img src="https://zenodo.org/badge/DOI/10.5281/zenodo.15549499.svg" alt="DOI"></a>


This repository consists of data files, code scripts, and this README document for the manuscript ‘Rate of temperature increase and genetic diversity drives marine metapopulation persistence under climate change.’ 

Authors:

Eojin Lee<sup>1,2</sup>, Lisa C. McManus<sup>3*</sup>

Affiliations: 

<sup>1</sup> Applied Physics and Applied Mathematics, Columbia University, New York, NY 10027

<sup>2</sup> Geophysics, Stanford University, Stanford, CA 94305 

<sup>3</sup>Hawaiʻi Institute of Marine Biology, University of Hawaiʻi at Mānoa, Kāneʻohe, 96744
*Corresponding author; e-mail: mcmanusl@hawaii.edu

STUDY SUMMARY

Our study aimed to quantify the relative contribution of population and environmental characteristics to metapopulation persistence under climate change. Using an eco-evolutionary model, we simulated 25 population types with varying thermal tolerance breadth and genetic variance, impacting the strength of selection and rate of evolutionary response, respectively. 

DATA & CODE FILE OVERVIEW 

Data: 
1. Directory /constant_45: simulation outputs for constant temperature scenario
- Abundance (N) outputs: “N0_region_x_w[i]_V[j].npy”
    - N is the fractional abundance relative to the carrying capacity for each subpopulation. A single value of N is computed for each subpopulation for a given region, thermal tolerance, and additive genetic variance value. 

- SST outputs: “SST_region_x_w[i]_V[j].npy”
    - SST (degrees C) is the sea surface temperature for each region. A single value of SST is computed for each subpopulation for a given region, thermal tolerance, and additive genetic variance value.

- Trait value (Z) outputs: “Z0_region_x_w[i]_V[j].npy”
    - Z (degrees C) is the local mean trait value for each subpopulation.  A single value of Z is computed for each subpopulation for a given region, thermal tolerance, and additive genetic variance value. 

- In the file names, x denotes region number, i is the thermal tolerance value, and j is the additive genetic variance. 

2. Directory /change_45: simulation outputs for changing temperature scenario. The outputs follow the convention outlined for the /constant_45 directory. 
- Abundance (N) outputs: “N1_region_x_w[i]_V[j].npy” 
- SST outputs: “SST1_region_x_w[i]_V[j].npy”
- Trait value (Z) outputs: “Z1_region_x_w[i]_V[j].npy” 
- In the file names, x denotes region number, i is the thermal tolerance value, and j is the additive genetic variance. 

3. Directory /linear: simulation outputs for linear network. The file naming convention is consistent with the constant temperature and changing temperature scenarios. Only data for regions 50 and 60 are included. 

4. Directory /mort_fun: simulation outputs for no additional mortality. The file naming convention is consistent with the changing temperature scenario. Only data for regions 13, 50, 53, and 60 are included. 

5. D_rand.npy and D_reg.npy: defines connectivity matrices for input in “Coral_Networks.ipynb” 

6. lme66.topojson: contains coordinates to define region geometry for figures. This file is originally from Bowden and Borruso (2014). 

7. regional_temp.csv: contains region number, region name, thermal steepness, initial mean SST, minimum mean SST, maximum mean SST, average mean SST, mean SST variance, and thermal gradient for RCP 2.6, 4.5, and 8.5. This data was generated from CMIP5 outputs via the Climate Change Web Portal (Scott et al., 2016).
    - SST is in units of degrees C. The units of variance are degrees C squared. The thermal gradient is given in degrees C/year. 

9. range_roc.csv: contains LME region number, thermal gradient for RCP 2.6, 4.5, and 8.5, as well as thermal steepness. This data was condensed from “regional_temp.csv.”
    - The thermal gradient is given in degrees C/year. The thermal steepness is in units of degrees C. 

11. rcp45.csv: contains region number, thermal gradient and steepness, w, V, and number of persistent population types at the end of the simulation period. Combines information from “range_roc.csv” and changing temperature simulations.
    - The thermal gradient is given in degrees C/year. The thermal steepness is in units of degrees C. The units of w are degrees C. The units of V are degrees C squared. 

13. GLM_inputs.csv: contains LME, w, V, patch “rank,” thermal gradient and steepness, and final abundance data. Data combines information from “range_roc.csv” and changing temperature simulations.
    - The thermal gradient is given in degrees C/year. The thermal steepness is in units of degrees C. The final abundance is a fractional value. 

Python Code: 
1. Coral_Networks.ipynb: Generates simulation outputs and figures S7, S8. Uses the ‘D_rand.npy,’ ‘D_reg.npy,’ and ‘regional_temp.csv.’
   - Steps: Once the “Load packages” and “FUNCTIONS” sections are run, the notebook can be run without modification to generate output for the constant temperature experiments. Once the constant temperature scenario is run,  the changing temperature, zero mortality, and linear connectivity experiments can be run. The path names may require modification. 

3. Manuscript_Figures.ipynb: Generates figures 1, 3, 4, 5, and S3-6. The simulation outputs used in our analysis are available in the ‘Data/constant_45’ and ‘Data/change_45’ directories. In addition to simulation outputs, the script uses ‘lme66.topojson,’ ‘range_roc.csv,’ ‘rcp45.csv,’ and ‘GLM_inputs.csv,’ which are also included in the ‘Data’ directory.
   - Steps: Once the “Load packages” and “Parameters” sections are run, the notebook can be run to generate figures from the manuscript. All of the code blocks under each figure heading (e.g., “Figure 1. Range and rate of change”) should be run for each figure. 

R Code:
1. eco_evo_stats.R: Code for the statistical elements–including the LM, GLM, and Figure S2. The script uses files ‘GLM_inputs.csv’ and ‘rcp45.csv.’
   - Steps: Once the libraries at the top of the script are loaded, the notebook should be run sequentially to generate statistical analysis and the corresponding figures. 

SOFTWARE VERSIONS

Python version 3.8.8 (2021-02-24). Uses packages ‘numpy (v.1.21.2),’ ‘pandas (v.1.3.5),’ ‘seaborn (v.0.11.2),’ ‘matplotlib (v.3.5.0),’, ‘time,’ ‘random,’ ‘csv (v.1.0),’, ‘shapefile (v.2.1.3),’ ‘geopandas (v.0.9.0),’ ‘pylab,’ ‘ipywidgets (v.7.6.5),’ ‘__future__,’ ‘netCDF4 (v.1.5.3),’ and ‘sklearn (v.1.0.1).’

R version 4.4.1 (2024-06-14). Uses packages ‘ggplot2 (v.3.5.1),’ ‘broom.mixed (v.0.2.9.5),’ and ‘jtools (v.2.2.2).’

REFERENCES

Bowden, J. A. and A. Borruso. 2014. LME Large Marine Ecosystems. GitHub repository, https://github.com/datasets/lme-large-marine-ecosystems. 

Scott, J. D., Alexander, M, A., Murray, D. R., Swales, D., and J. Eischeid. 2016. The Climate Change Web Portal: A System to Access and Display Climate and Earth System Model Output from the CMIP5 Archive. Bulletin of the American Meteorological Society, 97(4): 523-530. 


