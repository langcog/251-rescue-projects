# 251-rescue-projects

**Note:** If you are a windows user and get an error about overly long file names, please see [this stackoverflow post](https://stackoverflow.com/questions/22575662/filename-too-long-in-git-for-windows) or [this github issue](https://github.com/desktop/desktop/issues/17882) for how to fix it. Alternatively, you can download a zip of the repo from [the osf copy](https://osf.io/cyk5w/files/github) by clicking "Download this folder".

## Reproducing this project
The preregistration for this project is at https://osf.io/5qz7v

The overall manuscript can be reproduced by knitting manuscript/manuscript.Rmd
* This file reads data from data/combined_data.csv and data/boyce_2023_data.csv
* This file uses code/helper/parse_stats.R 

**data/combined_data.csv has links to the write-ups, pre-registrations, and projects (code/data) for the replications and rescues.** Additionally, the project repos are contained in first-replication-projects and individual-rescue-projects. Archival copies of the write-ups are in first-replication-reports and individual-rescue-reports (download/clone the repo and then open the html files in a web browser to view them). 

The numeric results in data/combined_data.csv (effect size measures, sample sizes, number of trials) were coded off of the papers and reports. Where the effect size measures were not presented in the needed format, recalculations were done (see reconstruct_effect_sizes for data and code for these). 

## Folder structure

### Code
* initial_criteria.R describes the process for determining which projects were eligible for rescue
* process.Rmd is a draft analysis script
	* it pulls the coded data from our google sheet and merges it with study-level variables from Boyce 2023 replication data to write data/combined_data.csv 
	* it checks that we don't have parsing errors in our data format
	* it does analyses (those in the manuscript have their analysis duplicated in manuscript/manuscript.Rmd)
* helper/parse_stats.R parses our raw effect size format and calculates standardized effect sizes  and helper/stats.R wraps p_original and prediction_interval functions (used by process.Rmd but not manuscript.Rmd)

### Data
* combined_data.csv is the raw data coding sheet with links to pre-registrations, etc
* parsed_data.csv is a saved intermediate that has the results of parsing effect sizes and computing standardized effect sizes
* boyce_2023_data.csv is a copy of data from [Boyce et al 2023](https://royalsocietypublishing.org/doi/full/10.1098/rsos.231240) which reports on the first replications

### Manuscript
* manuscript.Rmd is the manuscript, with analysis code embedded
* manuscript.pdf is the result of knitting manuscript.Rmd
* 251rescue.bib is the bibliography
* apa7.csl, generic_article_template.tex are helper files for formatting the manuscript
* coverletter/, title_page.Rmd, and manuscript_anon.Rmd are leftovers of the submission process

### First-replication-projects and Individual-rescue-projects
* include the individual replication and rescue projects (aka github repos) respectively
* the rescue projects repos have been checked and include data, code/reproducible report, and the materials to run the experiment

### First-replication-reports and Individual-rescue-reports
* archival copies of the reports from individual projects, in case the rpubs links break or are overwritten
* to view, download the repo and open the html files in a browser

### reconstruct_effect_sizes 
In a few cases, the effect size information we needed for comparable SMDs was not available from published papers or project write-ups, and we had to construct it.
* schectman_es.Rmd calculates the effect size for the original [Schechtman et al.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6634660/) The original paper reports a p-value but not exact values, but the authors were kind enough to send their matlab data files.
This uses the three DataTest*.mat files.  Additionally, we looked at the rescue data to recalculate trial counts (subject_data_final_full_processed.csv)
* [Denis et al](https://www.pnas.org/doi/pdf/10.1073/pnas.2202657119) is an additonal replication of Payne et al 2008; however the analysis reported in the paper is not the same as the analysis Payne et al used. Luckily data was available, so we calculate the corresponding result in denis_es.Rmd using data in Expt1_OverallRecognition.csv and Expt1_SpecificRecognition.csv. 
* For Hopkins et al, the main effect of interest is a coefficient in a linear model. However, coefficients cannot be converted to SMD easily, so we calculate the mean and sds instead in hopkins_es.Rmd. The original data is in hopkins_raw.csv, the replication and rescue data is sourced from their github repos. 

### So you want to rescue a project ...
* this is a copy of a list of potential reasons for replication failures shared with the rescuers in the early stages of the rescues


