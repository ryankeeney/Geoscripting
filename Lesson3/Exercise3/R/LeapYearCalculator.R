#Ryan Keeney
#4/24/2017
#Leap Year Calculator


LeapYearCalculator <- function(x) {
  # Function to determine whether a year is a leap year or not.
  # x (numeric) is the year you were born
  if (!is.numeric(x)) {
    stop("Use number class.")
  } else { #x is numeric
      if (x %%4 != 0) {
      print("This is a common year.")
    } else if (x %% 100 != 0) {
      print("This is a leap year.")
    } else if (x %% 400) {
      print("This is a common year.")
    } else
      print("This is a leap year")
  }
}