## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        ## At the begining, set cached value to NULL when nothings is cached
        cache = NULL
        
        ## Create fuction for set new matrix
        set_matrix<- function(new_val){
                x<<- new_val
                cache<<- NULL
        }
## Return set matrix
        get_matrix<- function(){
                x
        }
## Store the cache value
        cache_matrix<- function(solve){
                cache<<- solve
        }
## Get the cached value
        get_cache<- function(){
                cache
        }
## Return a list with each element of the list is declaired function above        
        list(set_matrix = set_matrix, get_matrix = get_matrix,
             cache_matrix = cache_matrix, get_cache = get_cache)
}


## Write a short comment describing this function

cacheSolve <- function(y, ...) {
        # get the cached value which is the inverse of the "special matrix"
        inv_matrix<- y$cache_matrix()
        # if cached value is not NULL then return it
        if(!is.null(inv_matrix)){
                message("getting cached data")
                return(inv_matrix)
        }
        # otherwise, compute the inverse and store it in cache
        data<- y$get_matrix()
        inv_matrix<- solve(data)
        y$cache_matrix(inv_matrix)
        
        
        ## Return a matrix that is the inverse of 'x'
        inv_matrix
}

