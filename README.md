This repository includes multiple analytic files, including the functions used within those files. 

There are multiple versions of the validation markdown, called tables.Rmd, Validation.Rmd, model3_validation.Rmd, model4_validation.Rmd, and model_final_anaysis.

Functions:
1. faceted_comp_plot.R: comparison plot, faceted, non-weighted linear regression
2. faceted_comp_plot_wt.R: comparison plot, faceted, weighted linear regression
3. pivot_data_longer.R: customized version of pivot_longer function from dplyr library
4. rank.R: calculates rank after taking in soccer output and coder file
5. read_coder_file.R: creates list columns for coder file to allow for ranking
6. summarize_df.R: create summary dataframe with average agreement per interval to create soccer score vs. agreement plots
7. summarize_df_weighted.R: same as above, but now weighted by # of jobs per score category
8. xwalk_num.R: calculates how many possible crosswalked jobs exist from xwalk file (rowwise)
