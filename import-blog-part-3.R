# read files
readr::read_file('hsb.txt')

# read lines
# skip first 5 lines and read max 10 lines
readr::read_lines('hsb.txt', skip = 5, n_max = 10)

# base
# scan: allow user to input data from console or read data from a file
# and store the input as a vector or list.
x <- scan()
x

x <- scan("", what = integer())
x
class(x)

x <- scan("", what = list(name = "", age = 0))
x

# prompt user for an input and store the same as a character vector
name <- readline(prompt = "What is your name?: ")
name

# read data from a file
readLines("hsb.txt")
readLines("hsb.txt", n = 10)

# read data from a file in table format and create data.frame
read.table('hsb.txt', header = TRUE, sep = ' ')

# load: reloads saved data sets and workspaces
load('employees.RData')

# source: reads R code from a script and makes those codes available in
# the current session
source('addition.R')
