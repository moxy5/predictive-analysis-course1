# connecting with SQL server management studio

# 1st step: install RODBC package for SQL connection
install.packages("RODBC")

# 2nd step: load the RODBC library
library(RODBC)

# 3rd step: list the connection
#syntax: variable_name <- odbcConnect("connectionName, rows_at_time = 1)
db_conn <- odbcConnect("myDatabase", rows_at_time = 1)

# 4th step: write the query
# syntax: queryName <- "SQL Query goes here"

regionalQuery <- "select [Group], SUM([SalesYTD]) as Sales
  from [AdventureWorks2019].[Sales].[SalesTerritory]
  group by [Group]"

# 5th step: execute the query 
# syntax: name <- sqlQuery(connection,
# query, stringAsFactors = FALSE)
regionalResult <- sqlQuery(db_conn,
                           regionalQuery,
                           stringsAsFactors = FALSE)

# 5th step: view the query result
head(regionalResult)

# 6th step: close the close.connection
odbcClose(db_conn)


# install the package
install.packages("tidyverse")
# load library
library(tidyverse)

# Create a data frame
df <- data.frame(
  category = c("Europe", "North America", "Pacific"),
  value = c(13590506, 33182889, 5977815)
)


# Create the pie chart
ggplot(df, aes(x="Group", y=value, fill=category)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  labs(title = "TOTAL REGIONAL SALES") +
  theme_void()







