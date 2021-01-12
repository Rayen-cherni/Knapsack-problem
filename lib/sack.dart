import 'dart:math';

class Knapsack{

  // Il va retourner la val max qu'on peut mettre dans le sac à dos du poids w
  int knapsackValue(int w,List<int> wt,List<int> val,int n){
    if(n == 0 || w == 0){
      return 0;
    }
    if (wt[n-1] > w)
            return knapsackValue(w, wt, val, n-1);

        else return max( val[n-1] + knapsackValue(w-wt[n-1], wt, val, n-1),
                knapsackValue(w, wt, val, n-1)
        );
  }
}