library(readr)
library(readxl)
library(haven)
library(jsonlite)
library(xml2)
library(foreign)
library(sas7bdat)

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

# semicolon separated values
read.csv2('hsb.csv', header = TRUE)

# using readr
read_csv2('hsb.csv')
read_delim('hsb.csv', delim = ';')

# data does not include column names
read_csv2('hsb.csv', col_names = FALSE)
read_delim('hsb.csv', delim = ';', col_names = FALSE)

# skip a few lines
read_csv2('hsb.csv', skip = 5)
read_delim('hsb.csv', delim = ';', skip = 5)

# maximum number of lines to read
read_csv2('hsb.csv', n_max = 50)
read_delim('hsb.csv', delim = ';', n_max = 50)


# specify column types
read_csv2('hsb.csv',
         col_types = list(col_integer(), col_factor(levels = c(0, 1)), 
                          col_factor(levels = c(1, 2, 3, 4)),
                          col_factor(levels = c(1, 2, 3)), 
                          col_factor(levels = c(1, 2)), 
                          col_factor(levels = c(1, 2, 3)),
                          col_integer(), col_integer(), col_integer(),
                          col_integer(), col_integer())            
)

# read only specific columns
read_csv2('hsb.csv', 
         col_types = cols_only(id = col_integer(),
                               prog = col_factor(levels = c(1, 2, 3)),
                               read = col_integer())
)

# tab separated values
read.delim('mtcars.tsv', dec = '.')  # use read.delim2 if decimal separator is ,
read.table('mtcars.tsv', sep = '\t', header = TRUE, dec = '.')

# using readr
read_tsv('mtcars.tsv')
read_delim('mtcars.tsv', delim = '\t')

# data does not include column names
read_tsv('mtcars.tsv', col_names = FALSE)
read_delim('mtcars.tsv', delim = '\t', col_names =  FALSE)

# skip a few lines
read_tsv('mtcars.tsv', skip = 5)
read_delim('mtcars.tsv', delim = '\t', skip = 5)

# maximum number of lines to read
read_tsv('mtcars.tsv', n_max = 10)
read_delim('mtcars.tsv', delim = '\t', n_max = 10)


# specify column types
read_tsv('mtcars.tsv',
          col_types = list(col_double(), col_factor(levels = c(4, 6, 8)), 
                           col_double(), col_double(), col_double(),
                           col_double(), col_double(),
                           col_factor(levels = c(0, 1)), 
                           col_factor(levels = c(0, 1)), 
                           col_factor(levels = c(3, 4, 5)),
                           col_factor(levels = c(1, 2, 3, 4, 6, 8)))            
)

# read only specific columns
read_tsv('mtcars.tsv', 
          col_types = cols_only(mpg = col_double(),
                                cyl = col_factor(levels = c(4, 6, 8)),
                                disp = col_double(),
                                gear = col_factor(levels = c(3, 4, 5)))
)


# space separated values
read.table('hsb1.csv', header = TRUE, sep = " ")
read_table('hsb1.csv')  # fails
read_table2('hsb1.csv')

# data does not include column names
read_table2('hsb1.csv', col_names = FALSE)

# skip a few lines
read_table2('hsb1.csv', skip = 5)

# maximum number of lines to read
read_table2('hsb1.csv', n_max = 10)

# specify column types
read_table2('hsb1.csv',
          col_types = list(col_integer(), col_factor(levels = c(0, 1)), 
                           col_factor(levels = c(1, 2, 3, 4)),
                           col_factor(levels = c(1, 2, 3)), 
                           col_factor(levels = c(1, 2)), 
                           col_factor(levels = c(1, 2, 3)),
                           col_integer(), col_integer(), col_integer(),
                           col_integer(), col_integer())            
)

# read only specific columns
read_table2('hsb1.csv', 
          col_types = cols_only(id = col_integer(),
                                prog = col_factor(levels = c(1, 2, 3)),
                                read = col_integer())
)

# read .txt files
read_csv('hsb.txt')  # incorrect
read_delim('hsb.txt', delim = ',')  # incorrect
read_table('hsb.txt')  # incorrect
read_table2('hsb.txt')  # correct


# read excel files
# list sheets in a excel file
excel_sheets('sample2.xls')
readxl::read_excel('sample2.xls', sheet = 1)
readxl::read_excel('sample2.xls', sheet = 2)

# remember first row is always column name in excel
# so add 1 to row number while selecting the cell

# read specific cells
readxl::read_excel('sample2.xls', sheet = 2,
                   range = "B3:C7")

readxl::read_excel('sample2.xls', sheet = 2,
                   range = "A3:C5")

# single row
readxl::read_excel('sample2.xls', sheet = 2,
                   range = "A3:C4")

readxl::read_excel('sample2.xls', sheet = 2,
                   range = anchored("A4", dim = c(3, 2)),
                   col_names = FALSE)

# specify only rows
readxl::read_excel('sample2.xls', sheet = 2,
                   range = cell_rows(3:6))

# specify only columns
readxl::read_excel('sample2.xls', sheet = 2,
                   range = cell_cols(2:3))

# single column
readxl::read_excel('sample2.xls', sheet = 2,
                   range = cell_cols(2))

# use cell_limits to specify one end of the rectangle
# such as top left or top right

readxl::read_excel('sample2.xls', sheet = 2,
                   range = cell_limits(c(1, 2), c(NA, NA)))


readxl::read_excel('sample2.xls', sheet = 2,
                   range = cell_limits(c(3, NA), c(NA, 2)))

# mention other packages that can be used to import the files
# sas: sas7bdat (last updated in 2014; version 0.5)
# stata, spss: foreign (maintained; version 0.8)

# stata
haven::read_dta('airline.dta')    # tibble
haven::read_stata('airline.dta')  # tibble
foreign::read.dta('airline.dta')  # data.frame

# spss
read_sav('employee.sav')   # tibble
read_spss('employee.sav')  # tibble
foreign::read.spss('employee.sav', use.value.labels = FALSE,
                   to.data.frame = TRUE)

# stata
read_sas('airline.sas7bdat')
sas7bdat::read.sas7bdat('airline.sas7bdat')
