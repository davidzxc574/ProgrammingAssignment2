## These two funcions store a matrix and its inverse in temprary memory 

## This function creates a list of 4 functions
## 1.set the value of a matrix
## 2.get the value of a matrix
## 3.set the value of the inverse
## 4.get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  i<-NULL
  set<-function(y){
    x<<-y
    i<<-NULL
  }
  get<-function() x
  setinverse<-function(inverse) i<<-inverse
  getinverse<-function() i
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}

## This function check if a value is assigned to the inverse. 
## If yes, it returns that value. 
##If not, it calculates the inverse of the cached matrix from above function

cacheSolve <- function(x, ...) {
  i<-x$getinverse()
  if(!is.null(i)){
    message("getting cached inverse")
    return(i)
  }
  MyMatrix<-x$get()
  i<-solve(MyMatrix)
  x$setinverse(i)
  i        ## Return a matrix that is the inverse of 'x'
}
