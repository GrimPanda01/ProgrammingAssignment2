## My first function (makeCacheMatrix) creates a list of functions to cache the values of and return a target matrix
## and its inverse, and my second function (cacheSolve) either returns the cached inverse of a target
## matrix or computes the inverse, caches it, and returns it.

## The function makeCacheMatrix takes a matrix, and creates a list of four functions which another function can call in order to
## either (1) return the cached inverse of that matrix, or (2) compute the inverse, (3) cache it, and (4) deliver it.

makeCacheMatrix <- function(x = matrix()) {

        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## The function cacheSolve first checks to see whether the inverse of a target matrix has been cached by makeCacheMatrix. If it has, 
## the function returns that inverse. If it has not, then cacheSolve gets the matrix cached by makeCacheMatrix, computes its inverse, 
## calls makeCacheMatrix to cache the inverse, and finally returns the value of the inverse matrix. Note that the value of the target
## matrix for which the user wishes to compute the inverse matrix must be set using makeCacheMatrix, either when the user initially
## calls makeCacheMatrix, or by using the set function defined in makeCacheMatrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data)
        x$setinverse(i)
        i		
		
		
}
