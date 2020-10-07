bla <- matrix(c(10,11,12,13), 2, 2)
solve(bla)

## Create a cache for a inversion of the matrix

## Creates a list that stores the inversion of the matrix

makeCacheMatrix <- function(x = matrix()) {
        
        solution <- NULL
        set <- function(y){
                
                x <<- y
                solution <<- NULL
        }
        get <- function() x 
        setsol <- function(sol) solution <<- sol
        getsol <- function() solution
        
        list(set = set, get = get,
             setsol = setsol,
             getsol = getsol)
}


## Makes the inversion of the matrix or retreives the solution if it was made 
## before

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        solution <- x$getsol()
        if(!is.null(solution)) {
                message("getting cached data")
                return(solution)
        }
        data <- x$get()
        solution <- solve(data, ...)
        x$setsol(solution)
        solution
}
blabla <- makeCacheMatrix(bla)
cacheSolve(blabla)
