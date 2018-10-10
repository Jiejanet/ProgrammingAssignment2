## makeCacheMatrix function can cache its inverse
## cacheSolve function can compute the inverse of matrix
## the two functions together acheive the magical caching ability of the inverse of a matrix
## basically i just mimic the cachemean fucntion 

## it take matrix as its input and return a list of function

makeCacheMatrix <- function(x = matrix()) {
        ix<-NULL #to initialize inverse matrix, if it hasn't been calculated it should be null
        set<-function(y=matrix()){#in case something other than matrix being used as input
                x<<-y
                ix<<- NULL # if reset then the ix should also be reset
        }
        get<- function () x #retrieve 
        setinverse<- function(invrmatrix) ix <<-invrmatrix #give this object a inversematrix 
        getinverse<- function() ix #retrieve
        list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)#return these function
}



## take a object of x,x should come from makecachematrix function instance

cacheSolve <- function(x, ...) {   # i still confused that why should we have ... ? to allow more arguments for what?? it did not seemd useful
        ix <- x$getinverse()
        if(!is.null(ix)){
                message("getting cached data")
                return(ix)
        }# return inverse matrix, if x has it already
        
        xmatrix<-x$get() #get the matrix data
        invr_x<-solve(xmatrix)
        x$setinverse(invr_x)
        invr_x
        
        
        
        ## Return a matrix that is the inverse of 'x'
}
