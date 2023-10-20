# install the package
install.packages("tidyverse")
# load the package
library(tidyverse)

# view datasets available in R
data()

# load dataset
df_titanic <- read_csv("titanic.csv")

# view df_titanic dataset
view(df_titanic)
# challenge:
# find duplicates and remove them
# create a new column from an existing column

glimpse(df_titanic)
class(df_titanic)
class(df_titanic$class)
class(df_titanic$age)
unique(df_titanic)
unique(df_titanic$age)

# find duplicates and remove them
anyDuplicated(df_titanic)

df_titanic <- df_titanic[-c(48),]

df_titanic <- df_titanic[,-c(12)]

isnull(df_titanic)

df_titanic %>% 
  select(age) %>% 
  filter(!complete.cases(.)) %>%
  view()

view(df_titanic)

is.null(df_titanic)

mean(df_titanic[, 4])

unique(df_titanic$age)
df_titanic$age <- as.numeric(df_titanic$age)

glimpse(df_titanic)

df_titanic$age <- as.numeric(df_titanic$age)
glimpse(df_titanic)

# histogram - analyze one numerical variable
# can also use boxplot and density plot
view(df_titanic)
ggplot(df_titanic, mapping=aes(x=age)) + geom_histogram()

df_titanic %>% 
  drop_na(age) %>% 
  ggplot(mapping=aes(x=age)) + geom_histogram()

df_titanic %>% 
  filter(age < 50) %>% 
  ggplot(aes(age)) +
  geom_histogram() +
  labs (title = "Ages of Passengers under 50") +
  theme_bw()

df_titanic %>% 
  filter(age > 50.) %>% 
  ggplot(aes(fare)) +
  geom_histogram() +
  labs (title = "Fares of Passengers under 50") +
  theme_bw()

# bar chart - categorical value
df_titanic %>%
  # remove N/A
  drop_na(class) %>% 
  filter( class %in%
            c("First", "Second", "Third")) %>% 
  ggplot(aes(class)) +
  geom_bar(alpha = 0.5) +
  facet_wrap(~sex) +
  labs(title = "Passengers Sex and Class Status", 
       x = "Status of Class",
       y = "Number of Each Sex")

# scatter plot: 2 numerical variables
df_titanic %>%
  drop_na(fare, age) %>% 
  filter(fare < 21.) %>% 
  ggplot(aes(fare, age)) +
  geom_point(aes(color=sex, alpha=0.5)) +
  geom_smooth(method="lm") +
  labs(title = "Passengers Age with Fares less than 21") + 
  theme_light()

# box plot: 2 numerical variables
df_titanic %>%
  drop_na(fare, who) %>% 
  ggplot(aes(fare, who)) +
  geom_boxplot(aes(color=sex, alpha=0.5)) +
  geom_smooth(method="lm") +
  labs(title = "Fare and Description of Passenger") + 
  theme_light()

df_titanic %>%
  drop_na(who, fare) %>% 
  ggplot(aes(who, fare)) +
  geom_boxplot(aes(color=sex, alpha=0.5)) +
  geom_smooth(method="lm") +
  labs(title = "Description and Fare of Passenger") + 
  theme_light()

df_titanic %>%
  drop_na(who, age) %>% 
  ggplot(aes(who, age)) +
  geom_boxplot(aes(color=sex, alpha=0.7)) +
  geom_smooth(method="lm") +
  labs(title = "Description and Age of Passenger") + 
  theme_light()

# create a stacked bar chart
# between eye_color and sex
df_titanic %>%
  drop_na(sex, who) %>% 
  ggplot(aes(sex, fill=who)) +
  geom_bar(alpha = 0.5) +
  facet_wrap(~survived) +
  labs(title = "Passengers that did not survive on the left", 
       x = "Non-Survivors vs Survivors",
       y = "Quantities") +
  theme_minimal()