## ---------------------------
##
## Script name: 01_prepareData.R
##
## Purpose of script: downloads and formats data for use in analysis.
##
## Author: Dr.François-Nicolas Robinne, Data/Habitat analyst
##
## Date Created: 2025-01-21
##
## Email: frobinne@psf.ca
##
## ---------------------------
##
## Notes:
##  
##
##  
## ---------------------------

## Options ---------------------------------------------------------------------
options(timeout = 1000)

## load up the packages we will need -------------------------------------------

# Load Pacman for package management by default (or install it if necessary)
if (!require("pacman")) install.packages("pacman"); library(pacman)

# List of necessary packages
pacman::p_load(dplyr, readr, sf, tidyr, here)

# dplyr => data manip
# readr => quick data read
# sf => spatial data manip
# stringr => character vector manip
# measurements => unit conversion
# textclean => clean text
# datastreamr => access to DataStream API (see https://github.com/datastreamapp/datastreamr)
# ckanr => access to CKAN-based open data repositories
# tictoc => compute run time for script execution
# readxl => read XLS files
# lubridate => deals with date data formats
# tidyr => data manip

## set working directory -------------------------------------------------------
here::i_am("src/01_prepareData.R")

## Load functions ----------------------------------------------------------


## Load data ---------------------------------------------------------------



#####################################
## 1) Prepare protected area layer ##
#####################################

pa_url <- "https://data-donnees.az.ec.gc.ca/api/file?path=%2Fspecies%2Fprotectrestore%2Fcanadian-protected-conserved-areas-database%2FDatabases%2FProtectedConservedArea_2023.zip"
pa_dir <- tempdir()
pa_file <- tempfile(tmpdir = pa_dir, fileext = ".zip")

download.file(pa_url, pa_file)

unzip(pa_file, exdir = here("data/raw"), overwrite = T, unzip = "unzip")
