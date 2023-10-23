# this subsets the list of 251 projects (from 251 MA OSF) to 
#those that were offered as *options* for rescue projects

library(tidyverse)
library(testthat)
all_projects <- read_csv("https://raw.githubusercontent.com/vboyce/251-254-MA/main/data/raw_data.csv")

filtered <- all_projects |>
  mutate(sub_rep=ifelse(replicated_instructor_code==replicated_report_code, 
                 replicated_report_code, 
                 adjudicated_replication_code)) |> 
  filter(sub_rep %in% c(0,.25, .5)) |> 
  filter(include!="no") |> 
  filter(target_N <=200) |> 
  filter(academic_year %in% c("2015-2016", "2016-2017", "2017-2018", "2018-2019", 
                              "2019-2020", "2020-2021","2021-2022", "2022-2023")) 
# what we really want is whether there was a github, but that column is private and so not in the public raw data
# but 2015 is the first year where we have github links

test_that("number of rows in filtered", {expect_equal(nrow(filtered),49)})

#given this sample, we then sought original replicator permission, 
#since it would involve sharing their repo and write-up with a new student
#which wouldn't have been anticipated at original classtime

#we heard back from 29 students of the 49 we attempted to contact 
#(1 we couldn't contact due to email bouncing) 
#2 responses were negative, rest were positive, for 27 options

approved <- c("krauss2003","yeshurun2003", "daffner2000", "ngo2019",
              "child2018", "schechtman2010", "payne2008", "paxton2012",
              "hart2018", "lewis2015", "tarampi2016", "jara-ettinger2022",
              "porter_2016_1", "hopkins2016", "birch2007_2", "gong2019",
              "correll2007", "pilditch2019", "daw2011", "dehaene2009",
              "sofer2015", "todd2016_1", "chou2016", "mani2013", 
              "haimovitz2016_2", "haimovitz2016_1", "craig2014")
options <- filtered |> filter(target_lastauthor_year %in% approved)

test_that("number of rows in options", {expect_equal(nrow(options),27)})

# students were then given this list and the opportunity to choose what to do

# projects that we believe are being rescued (as of Oct 23)

chosen <- c("sofer2015", "birch2007_2", "jara-ettinger2022", "porter_2016_1",
            "hopkins2016", "yeshurun2003", "craig2014", "tarampi2016", 
            "mani2013", "krauss2003", "schechtman2010", "child2018",
            "haimovitz2016_1", "todd2016_1", "haimovitz2016_2", "payne2008", 
            "paxton2012", "dehaene2009", "chou2016", "ngo2019", "gong2019")

final_sample <- options |> filter(target_lastauthor_year %in% chosen)

test_that("number of rows in final sample", {expect_equal(nrow(final_sample),21)})


