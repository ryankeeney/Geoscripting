#Ryan Keeney
#4/24/2017
#Leap Year Calculator

# Function to determine whether a year is a leap year or not.
LeapYearCalculator <- function(x) {
    # Make sure X is numeric. 
  if (!is.numeric(x)) {
    stop("Use number class.")
  } else { 
      # See if X is divisible by 4. If not, is is a common year.
      if (x %%4 != 0) {
      print("This is a common year.")
      # Then see if X is divisible by 100. If not, is is a leap year.
    } else if (x %% 100 != 0) {
      print("This is a leap year.")
      # Then see if x is divisible by 400. If not is a common year.
    } else if (x %% 400 != 0) {
      print("This is a common year.")
    } else
      print("This is a leap year")
  }
}