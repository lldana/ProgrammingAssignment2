## Put comments here that give an overall description of what your
## functions do

## 2 functions to calcualte the inverse of a matrix

## Write a short comment describing this function
## this function allows to create and retrieve for future use a value
makeCacheMatrix <- function(x = matrix()) {
  tr <- NULL
  set <- function(y) {
    x <<- y
    tr <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) tr <<- inverse
  getinverse <- function() tr
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
#inverse a matrix using cache if available, otherwise calculate the inverse

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  tr <- x$getinverse()
  if(!is.null(tr)) {
    message("getting cached data")
    return(tr)
  }
  data <- x$get()
  tr <- solve(data, ...)
  x$setinverse(tr)
  tr
}
