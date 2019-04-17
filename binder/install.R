### install regular packages

install.packages("reticulate",repos = "http://cran.us.r-project.org") # python support in RMarkdown
install.packages("ggplot2",repos = "http://cran.us.r-project.org") # for plotting
install.packages(c("rmarkdown", "caTools", "bitops"),repos = "http://cran.us.r-project.org") # for knitting
install.packages("dplyr",repos = "http://cran.us.r-project.org")

### install bioconductor packages
# install.packages("BiocManager")
# BiocManager::install("package")

### install GitHub packages (tag = commit, branch or release tag)
# install.packages("devtools")
# devtools::install_github("user/repo", ref = "tag")
