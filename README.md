# R Package Templete

An R package is a useful tool to organize and share work. This repository holds some sample files and notes that can be used for developing an R package.



## Procedure for use

To use this repository as a templete:

1. Copy the contents of this repository to a new one (it is probably best to download the contents and upload them rather than forking).
2. Update the sample names in all available files (DESCRIPTION, LICENSE, .Rproj, etc.).
3. Develop R code and help files in the /R and /man directories (Some sample files are available for preview).

Further notes:

This package uses the GNU-3 public license. If you would like to change it, then remove the file and add a new one. Be sure to update the DESCRIPTION file to reflect any changes. If you need assistance in determining the appropriate license, then check out [this article](https://choosealicense.com/) by GitHub.
You can also check out [notes/How-to-Build-an-R-Package.html](https://htmlpreview.github.io/?https://github.com/ci2131a/Rpackage/blob/master/How-to-Build-an-R-Package.html) to see my notes on how to add a new license and build an R package from my own experience. This file exists within this repository in the directory (/notes) that is available on the GitHub repository but excluded from the R package build. This means anything stored in this directory would be available on GitHub but not in your package. It may be useful for notes and other miscellaneous files.
The book, "R Packages", by Hadley Wickham may be useful in further developing your R package. It discusses how to setup everything that has been done in this template repository with further tips and guidance. An online version of the book is available [here](https://r-pkgs.org/).
