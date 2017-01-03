## Put comments here that give an overall description of what your
## functions do

## 2 functions to calcualte a transpose function of a matrix

## Write a short comment describing this function
## this function allows to create and retrieve for future use a value
makeCacheMatrix <- function(x = matrix()) {
  tr <- NULL
  set <- function(y) {
    x <<- y
    tr <<- NULL
  }
  get <- function() x
  settranspose <- function(transpose) tr <<- transpose
  gettranspose <- function() tr
  list(set = set, get = get,
       settranspose = settranspose,
       gettranspose = gettranspose)
}


## Write a short comment describing this function
#transpose a matrix using cache if available, otherwise it calculates the transpose

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  tr <- x$gettranspose()
  if(!is.null(tr)) {
    message("getting cached data")
    return(tr)
  }
  data <- x$get()
  tr <- t(data, ...)
  x$settranspose(tr)
  tr
}

test <- matrix(1:20,20,2)
test
makeCacheMatrix(test)
cacheSolve(test)
