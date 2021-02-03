# Fusarium wilt of lettuce

MetaboDirect pipeline/notebooks for my Fusarium wilt of Lettuce project.

# Content

- [1 - Project overview](#1---project_overview)
- [2 - Main objectives of direct infusion](#2---main_objectives_of_direct_infusion)
- [3 - How to run the pipeline](#3---how_to_run_the_pipeline)
- [4 - Main findings and future directions](#4---main_findings_and_future_directions)

---
## 1 - Project overview

Fusarium wilt (FW) of lettuce, caused by the fungus *Fusarium oxysporum* f. sp. *lactucae* race 1, is an important pathogen of lettuce (*Lactuca sativa* L.) in the southwest, which is the largest US production region of iceberg and romaine lettuce.

This pathogen is seed- and soilborne, and infects lettuce plants by penetrating through secondary roots and moving into the vascular system. Belowground symptoms include internal discoloration of the tap root and collapse of the root system, which negatively affects the uptake of water and nutrients. As the disease progresses, aboveground lettuce plants show yellowing, stunting, leaf necrosis, and death of plants resulting in unmarketable lettuce. The key management strategy of FW of lettuce is the adoption of cultivars with good genetic resistance or tolerance to the pathogen.


Metabolomics is a fast-emerging technology in life sciences research that remains relatively untapped in agriculture and breeding programs. Fourier transform Ion Cyclotron Resonance mass spectrometry (FTICR-MS) by direct infusion in untargeted approach is a high-throughput metabolomics technique in which samples are injected directly into the ionization source of the mass spectrometer. This technique allows samples to be fully processed within minutes. The ultra-high mass accuracy and resolving power of FTICR instruments allows for molecular formula assignment on thousands of peaks in each mass spectrum.


Our main goal was to demonstrate the capabilities of direct infusion FTICR-MS in agriculture by profiling the metabolome of two healthy and infected lettuce cultivars (Raider, susceptible, and Meridiam, tolerant).


---
## 2 - Main objectives of direct infusion

Untargeted direct infusion (DI) mass spectrometry is a metabolomics technique for bulk metabolite characterization because of the high-throughput capabilities. FTICR instruments are ultra-high resolution and mass accuracy, which allows for the detection of a greater number of metabolites with similar masses compared to other lower resolution instruments.

DI techniques are used for **bulk characterization** of compounds, and comparing the metabolite fingerprinting across samples. DI is not reliable for structural characterization of a few compounds.

In our untargeted DI studies, peaks detected in the mass spectrometer are assignned a candidate molecular formula by softwares such as Formularity []. Subsequently, we calculate several molecular ratios and indices that assign a candidate class (e.g., carbohydrate, lipid, lignin) to these compounds, which then allows us to make comparisons across samples.

We face great challenges in the identification of compounds in DI by FTICR approaches, particularly in environmental studies and studies of non-model organisms because a lot of these metabolites are "known unknowns and unknowns unknowns" [].

---
## 3 - How to run the pipeline

1. After samples were scanned in FTICR instrument in negative mode, spectrum for each sample was exported to `.xml`. In very simplistic terms, these data contain a list of numbers, which are the mass over charge ratio (m/z) of each metabolite detected by the mass spectrometer.

2. Formularity [] was used to assign a molecular formula to these m/z values, and we normally only consider the following elements: CHONSP. Formularity is a GUI open-source software that is only available for Windows OS, which makes reproducibility and automation difficult. The output data from Formularity is a table that contains the m/z, molecular formula, error in ppm of the molecular formula assignment, and the raw intensity values across samples. This is the datafile used in this analysis pipeline.

3. Ready for MetaboDiret:

    1. Jupyter notebook [1_Preprocessing](./1_Preprocessing.ipynb).

        The output from Formularity is a file called `Report.csv`. It's important to work with the output file from Formularity as is.

        These are the steps in the preprocessing:

            - Filter predicted formulas with 13C
            - Optional: filter m/z between a m/z range
            - Error range correction, between -0.5 and 0.5 ppm
            - Calculate soil organic C indices and class of compounds
            - Calculate a summary output of elemental and class composition per sample
            - Calculate a summary output of median and weighted mean of indices per sample
            - Make matrix for downstream analyses

    2. Jupyter notebook [2_Diagnostics](./1_Diagnostics.ipynb)

        It's important to assess data quality at this point. Here, I demonstrate how to assess the mean number of molecular formula across samples, and the error range with and without applying error correction.

        ![Formulas](./images/stats_formula_per_sample.png)

        I expected to see a more even molecular formula assignment across samples because. This can come chomp my derrière later...

         This can reveal issues with extraction protocol, instrument biases, data acquisition problems like accumulation time in the instrument.

        ![Error](./images/error_ditribution_per_sample.png)



---
## 4 - Main findings and future directions
