# Solving-Travelling-Salesman-Problem-by-Simulated-Annealing
## Restatement of travelling salesman problem
In the traveling salesman problem, the aim is to find the shortest path for passing through the 15 cities
with a given distance matrix, which fullfill certain requirements: 
- Each city should be visit one and only one time.
- The saleman has to go back to whichever city he/she started travelling.
## Reason to choose simulated annealing
- The number of possible routes are huge. Local search will take forever to finish.
- Simulated annealing can be thought of as a randomized local search algorithm. Moreover, reheating stratygy can be used to prevent being trapped in local minima.
## Basic setup in this code
Our initial temperature is τ = 400. We repeat it for 10000 iterations, every iteration τ will be p = 0.999 times of before, and we set our stopping criterion as: stop when temperature τ <= 0.0001.
