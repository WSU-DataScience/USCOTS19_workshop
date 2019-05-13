library(dplyr)
library(tidyr)
setwd("~/Dropbox/Current_Classes/DSCI210/assignments/HW_7_Stack_and_Unstack_3")

survey <- read.csv("./health_survey.csv")
reverse <- 
  read.csv("./ReverseCodingItems.csv") %>%
  select(Column.Name, Needs.Reverse.Coding.) %>%
  mutate(Column.Name = as.character(Column.Name),
         Needs.Reverse.Coding. = as.character(Needs.Reverse.Coding.)) 


survey %>%
  gather("Question",
         "Response",
         -X) %>%
  left_join(reverse,
            by = c("Question"="Column.Name")) %>%
  mutate(question.type = substr(Question, 1, 2),
         regular.response = recode(Response,
                                 `Strongly Agree` = 5,
                                 `Somewhat Agree` = 4,
                                 `Neither Agree nor Disagree` = 3,
                                 `Somewhat Disagree` = 2,
                                 `Strongly Disagree` = 1,
                                 .default = 0),
         reverse.response = ifelse(regular.response == 0, 
                                   0, 
                                   6 - regular.response),
         coded.response = ifelse(Needs.Reverse.Coding. == "Yes",
                                 regular.response,
                                 reverse.response)) %>%
  group_by(X, question.type) %>%
  summarise(total = sum(coded.response)) %>%
  spread(question.type, total) -> new

write.csv(new, "./health_survey_key.csv")
