a = c(1,2,4,9,8,3,2,1,5,7,1,2,9,3,5,3,7,2,5,1,3,4,6,6,6,1,9,6,1,4,7,7,1,6,5,9,1,3,4,5,2,1,6,5,4,2,1,2,1,3,9,1,1,2,1,3,6,8,2,5,3,5,4,7,8,3,1,2,5,2,6,1,7,9,5,1,4,9,4,2,1,1,7,8, 3,3,5,1,6,4, 9,1,8,5,2, 2,1,8,1, 5,4,3, 9,6,7)
m1 = matrix(0,15,15)
m1[lower.tri(m1,diag = F)] <-a
m2 = t(m1)
mat = m1+m2
mat
#theta original
theta = c(1:15,1)
theta

#distance function
distance <- function(theta){
  d = 0
  for (i in 1:15){
    d = d + mat[theta[i],theta[i+1]]
  }
  return(d)
}

#simulated annealing

shortest.distance = c()

SA <- function(iteration, theta, tau,m,min.tau){
  for (j in 1:iteration){
    for (i in 1:m){
      change = sample(1:15, 2, replace = FALSE) 
      thetanew = theta
      thetanew[change] = theta[c(change[2],change[1])]
      thetanew[16] = thetanew[1]
      delta = distance(thetanew) - distance(theta)
      if(delta <= 0){
        theta = thetanew
      }else{
        uniform.random.number = runif(1,0,1)
        if(uniform.random.number < exp(-delta/tau)){
          theta = thetanew
        }else{
          theta = theta
        }
      }
    }
    if(tau < min.tau){break}
    tau = tau*0.999
  }
  return(list(theta, distance(theta)))
}


for (i in 1:100){
  dis = SA(10000,theta,400,100,0.001)
  print(dis)
}
