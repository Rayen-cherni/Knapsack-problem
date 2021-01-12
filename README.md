# Knapsack problem
## About The Application
The backpack algorithm is a problem combinatorial optimization. It models a situation analogous to filling a bag with
back, which cannot support more than a certain weight, with all or part of a given set objects each having a weight and a value. Items put in the backpack must
maximize the total value, without exceeding the maximum weight.
## Solution
We noticed that the exact methods lead to the optimal solution, but they are too greedy in terms of computing time and memory space required. 
However, the approximate methods require reasonable research costs.
But, they don't do not guarantee the optimality of the solution.

Here we will illustrate the principle of Dynamic Programming by a game implemented in Flutter application.
I decided to create a game that combines fun with learning. 
Items appear on the game interface with values and weights.
The user taps on the objects to add them to the urn / bag. 
We will not always be able to put all the objects in the bag because since the sum of the weights of the objects cannot exceed the maximum capacity.
So the user will look for the best solution to maximize the objects. 
This game will be developed on Android and its use by users is almost immediate since the environment is simple and efficient.
## Realization
