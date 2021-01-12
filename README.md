# Knapsack problem
# About The Application
The backpack algorithm is a problem combinatorial optimization. It models a situation analogous to filling a bag with
back, which cannot support more than a certain weight, with all or part of a given set objects each having a weight and a value. Items put in the backpack must
maximize the total value, without exceeding the maximum weight.

# Solution
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

# Realization
## Picture I
<img src="https://user-images.githubusercontent.com/57563454/104369415-b7250000-551d-11eb-9772-8f89fc6f5255.jpg" width="300" height="450">

## Picture II
<img src="https://user-images.githubusercontent.com/57563454/104369486-cc9a2a00-551d-11eb-8c3d-7bdcb83caeb9.jpg" width="300" height="450">

## Picture III
<img src="https://user-images.githubusercontent.com/57563454/104370077-a32dce00-551e-11eb-8f58-281c20c8a11b.jpg" width="300" height="450">

# Realization
In computer research, the backpack problem and its derivatives are stillstudied a lot.
There are many variations: multi-dimensional backpack (several weight per object), several objective functions,...etc. 
Many exact algorithms and approaches are proposed for this type of problem.
