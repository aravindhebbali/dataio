library(readr)
library(readxl)
library(haven)
library(jsonlite)
library(xml2)

# comma separated values
read.csv('hsb2.csv', header = TRUE)

# using readr
read_csv('hsb2.csv')
read_delim('hsb2.csv', delim = ',')

# data does not include column names
read_csv('hsb2.csv', col_names = FALSE)
read_delim('hsb2.csv', delim = ',', col_names = FALSE)

# skip a few lines
read_csv('hsb2.csv', skip = 5)
read_delim('hsb2.csv', delim = ',', skip = 5)

# maximum number of lines to read
read_csv('hsb2.csv', n_max = 50)
read_delim('hsb2.csv', delim = ',', n_max = 50)


# specify column types
read_csv('hsb2.csv',
  col_types = list(col_integer(), col_factor(levels = c(0, 1)), 
                   col_factor(levels = c(1, 2, 3, 4)),
                   col_factor(levels = c(1, 2, 3)), 
                   col_factor(levels = c(1, 2)), 
                   col_factor(levels = c(1, 2, 3)),
                   col_integer(), col_integer(), col_integer(),
                   col_integer(), col_integer())            
)

# read only specific columns
read_csv('hsb2.csv', 
  col_types = cols_only(id = col_integer(),
                        prog = col_factor(levels = c(1, 2, 3)),
                        read = col_integer())
)

# explain parse_* functions
# parse_character()
# parse_date()
# parse_datetime()
# parse_double()
# parse_factor()
# parse_integer()
# parse_guess()
# spec_csv()


