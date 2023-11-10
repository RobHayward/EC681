# blockchainexample.R
# This comes from https://www.datacamp.com/community/tutorials/blockchain-r
# Install the digest package if necessary
#install.packages('digest')
require(digest)
# An example of a block
# In this case we make a list
block_example <- list(index = 1, 
                      timestamp = "2018-01-05 17:05 UCT", 
                      data = "some data", 
                      previous_hash = 0, 
                      proof = 9, 
                      new_hash = NULL)
# The list contains 
# the index (where is it in the chain
# a time stamp
# the data.  For Bitcoin this would be the transaction that has been completed. 
# The proof of work that allows the block to be added to the chain
# The new hash of the information in the block
# Take a look
block_example
#===================================================================
# We now create a block chain. This is made up of four functions
# A hashing function
# A proof of work (pay the effort to be allowed to create a block)
# A function to create a block
# A function to add the block to the chain
#===================================================================
# Function to create the hashed block
hash_block <- function(block){
  block$new_hash <- digest(c(block$index, 
                             block$timestamp, 
                             block$data, 
                             block$previous_hash), "sha256")
  return(block)
}



# New information requires the creation of new blocks. 
# Proof of work algo will determine the difficulty of creating new blocks
# We want it to be hard to create but easy to verify
# This is a very simple proof of work algo
# It is a number that is divisible by 9
# this will just add numbers until we get one that is divisible by 9
# %% will give the remainder so 10 %% 9 will give 1 as 10 divided by 9 leaves 1 remainder. 
proof_of_work <- function(last_proof){
  proof <- last_proof + 1
  # increment the proof until a number is found that is divisible by 99 and
  # by the proof of the previous block
  while(!(proof %% 99 == 0 & proof %% last_proof == 0)){
    proof <- proof + 1
  }
  return(proof)
}
#===========================================================
# A function that takes the previous block and some data (in our case the block 
# number)
gen_new_block <- function(previous_block){
  # Proof of work
  new_proof <- proof_of_work(previous_block$proof)
  
  # Create new block
  new_block <- list(index = previous_block$index + 1, 
                    timestamp = Sys.time(),
                    data = paste0("this is block ", previous_block$index +1),
                    previous_hash = previous_block$new_hash,
                    proof = new_proof)
  
  # hash the new block
  
  new_block_hashed <- hash_block(new_block)
  
  return(new_block_hashed)
  
}
#===========================================================
# Create the Genesis block (this is the first block in the chain)
# Define the Genesis block (index 1 and arbitrary previous hash)
block_genesis <- list(index = 1, 
                      timestamp = Sys.time(), 
                      data = "Genesis Block", 
                      previous_hash = "0", 
                      proof = 1)
# Now build the blockchain
blockchain <- list(block_genesis)
previous_block <- blockchain[[1]]

# How many blocks to add

num_of_blocks_to_add <- 4

# Now this for loop will just loop from i = 1 to i = 4 (giving us 4 blocks)

for(i in 1:num_of_blocks_to_add) {
  block_to_add <- gen_new_block(previous_block)
  blockchain[[i + 1]] <- list(block_to_add)
  previous_block <- block_to_add
  
  # This will just print out the progress
  
  print(cat(paste0("Block ", block_to_add$index, " has been added", "\n", 
                   "\t", "Proof: ", block_to_add$proof, "\n", 
                   "\t", "Hash: ", block_to_add$new_hash)))
}
str(blockchain)
