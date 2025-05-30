#1. makeCacheMatrix
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    get <- function() x 
    
    setInverse <- function(inverse) inv <<- inverse
    
    getInverse <- function() inv
    
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

#2. cacheSolve
cacheSolve <- function(x, ...) {
    inv <- x$getInverse()
    
    if (!is.null(inv)) {
        message("Getting cached inverse...")
        return(inv)
    }
    
    mat <- x$get()
    inv <- solve(mat, ...)
    x$setInverse(inv)
    inv
}
