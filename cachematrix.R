## modified the original vector problem for matrix inversion
## original problem did the following:
## set value, get value, set mean, get mean
## the structure was kept the same but instead of a vector,
## we have a matrix and instead of a mean, we have an inverse
##
##
## So, the following function will:
## set a matrix value
## get a matrix value
## set a matrix inverse
## get a matrix inverse

## R code to accompany the two functions:
## > x<-matrix(1:4,nrow=2,ncol=2)
## which is a matrix that can be inverted
##
## > b<-makeCacheMatrix(x)
## > c<-cacheSolve(b)
## > c
## output will be the same as > solve(x)
## 
## if a matrix is used that can not be inverted
## an error is displayed: 'Error in solve.default(x)'

makeCacheMatrix <- function(x = matrix()) {
		m<-NULL
		set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## calculates the inverse of the special matrix
## generated by makeCacheMatrix
## it checks to see if the inverse has already been calculated
## the first time that
## > c<-cacheSolve(b)
## is run, it is calculating the inverse of the matrix
## if it is run a second time, the following message appears:
## 'getting cached data'
## typing 'c' afterwards will just display the cached inverted matrix


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}