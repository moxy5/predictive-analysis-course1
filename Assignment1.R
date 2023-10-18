#matrices
# syntax

myMatrix <- matrix(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
                     16,17,18,19,20,21,22,23,24), nrow= 6)

print(myMatrix)
print(myMatrix[3,3])

mVector <- c(3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3) 

myMatrix <- matrix(mVector, ncol=4)

print(myMatrix)

# dataframes

dFrame <- data.frame(person = c("Stan", "Francine", "Steve", 
                                "Roger", "Hayley", "Klaus"),
                     sex = factor(c("M", "F", "M", "M", "F", "M"))
) 

funny = factor (c("High", "Med", "Low", "High", "Med", "Med"))

dFrame <- cbind(dFrame, funny)


age = c(41, 41, 15, 1600, 21, 60)

dFrame <- cbind(dFrame, age)