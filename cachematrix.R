## This set of functions can be used to get the invers of a matrix. The computation is just done once.
## When the function is called a second time the value is given from the first calculation
## This behaviour can be used as a "cash"-function to save computation time 



## The function makeCacheMatrix returns a list of four functions to get and set the matrix 
## and the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {

      m <- NULL
      set <- function(y) {
         x <<- y
         m <<- NULL
      }
      get <- function() x
      setinverse <- function(inverse) m <<- inverse
      getinverse <- function() m
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse) 
}


## The function cacheSolve can be used with the output of the makeCacheMatrix and returns the inverse of the matrix. 
## For the first call the invers is computed from the second call on the inverse is just read from the cash


cacheSolve <- function(x, ...) {
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
