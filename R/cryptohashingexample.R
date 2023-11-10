# Crypto hashing example
# this comes from https://www.ft.com/content/aa24d82e-16c7-4e3e-868e-42bd32f593be
# Install the digest package if necessary
#install.packages('digest')
require(digest)
# A hash function takes something as an input and gives you an unique, encrypted 
# output. 
# The Best team in the Premier League are a55c08e3241438f4179129ca4d49c5cb310c4dacb2960e4d3c92a3a2e10e1
# Try to find the best team. 
# You need to use the function digest.  
# The arguments are you guess and the hashing algo. In this case it is 'sha256').
# Take a look at the function
?digest
# Here are some guesses for you. 
digest("Spurs", "sha256")
digest("Arsenal", "sha256")
# If you are really optimistic
digest("Newcastle", "sha256")
# If you get the same hash as the one on line 8, you have discovered the correct team. 
# email me at rh49@brighton.ac.uk for a prize if you do that. 
#