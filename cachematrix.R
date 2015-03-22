## These functions are very closely immitating the examples we
## were given using vectors.  All I really did was to change from
## using Vectors to a Matrix.
## 

## The makeCacheMatrix returns a list of functions that can be used to return
## its inverse ... solve. 

makeCacheMatrix <- function(x = matrix()) {
	m<-NULL
	set<-function(y){
		x <<- y
		m <<- NULL
	}
	        
	get <- function() x
	setmatrix <- function(solve) m <<- solve
	getmatrix <- function() m
	list(set = set, 
	get = get,
	setmatrix = setmatrix,
	getmatrix = getmatrix)

}


## This function computes the invers of the matrix that is returned by
## the makeCacheMatrix function

cacheSolve <- function(x, ...) {
  
	m<-x$getmatrix()
	if(!is.null(m)){
		message("getting cached data")
		return(m)
	}
		  
	matrix<-x$get()
	m<-solve(matrix, ...)
	x$setmatrix(m)
			  
	## Return the inverse of the matrix
	m
}
