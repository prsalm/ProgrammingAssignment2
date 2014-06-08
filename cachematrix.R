## Matrix inversion is usually a costly computation and their may be some benefit to 
## caching the inverse of a matrix rather than compute it repeatedly. This pair of 
## functions cache the inverse of a matrix. The functions are called independently of 
## each other.  The function makeCacheMatrix must be called first though in order to
## initialize the cached matrix. If cacheSolve is called and makeCacheMatrix was never
## never called, it will error out because it tests for whether the value of the 
## cached matrix is NULL, and the cached matrix will not exist without the first function
## being run.


## makeCacheMatrix: This function creates a special "matrix" object that can cache its 
## inverse.

makeCacheMatrix <- function(x = matrix()) {
  ## initialize global variables of the matrix to be cached, and the inverted matrix to be
  ## generated.
        
  invertedMatrix <<- NULL
  CacheMatrix <<- x
}

## cacheSolve:  This function computes the inverse of the special "matrix" returned by 
##              makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not
##              changed), then cacheSolve retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        if(!is.null(invertedMatrix)) {
                message("getting cached data")
                return(invertedMatrix)
        }
        invertedMatrix <<- solve(CacheMatrix)
}
