# Blockchain
# This is a blockchain example from 
# https://www.datacamp.com/community/tutorials/blockchain-r
# the block will contain financial transactions
block_example <- list(index = 1, 
                      timestamp = "2018-01-05 17:05 UCT", 
                      data = "some data", 
                      previous_hash = 0, 
                      proof = 9, 
                      new_hash = NULL)
block_example
require(digest)
# A hash function takes something as an input and gives you an unique, encrypted 
# output. 
# Best team in the Premier League is a55c08e3241438f4179129ca4d49c5cb310c4dacb2960e4d3c92a3a2e10e1
# Try to find the best team. 
digest("Spurs", "sha256")
digest("Arsenal", "sha256")
digest("Newcastle", "sha256")
#=========================
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
# Want it to be hard to create but easy to verify
# Simple proof of work algo
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
# Create the Genesis block
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

for(i in 1:num_of_blocks_to_add) {
  block_to_add <- gen_new_block(previous_block)
  blockchain[[i + 1]] <- list(block_to_add)
  previous_block <- block_to_add
  
  print(cat(paste0("Block ", block_to_add$index, " has been added", "\n", 
                   "\t", "Proof: ", block_to_add$proof, "\n", 
                   "\t", "Hash: ", block_to_add$new_hash)))
}
str(blockchain)
