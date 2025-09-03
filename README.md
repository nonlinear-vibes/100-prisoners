# 100 Prisoners

Monte Carlo simulation and exact analysis of the [100 prisoners problem](https://en.wikipedia.org/wiki/100_prisoners_problem), generalized to $n$ prisoners. \
Compares the loop strategy to independent random guesses.

![preview](docs/preview.png)

## Problem
- Given $n$ numbered prisoners and $n$ boxes, a random permutation of labels $1, …, n$ is placed in boxes in a room.
- Each prisoner walks into the room and may open at most $n/2$ boxes to find their own label.
- They can agree on a strategy beforehand, but cannot communication during play.
- They are released if everyone finds their label.

## Strategies
1. **Loop (cycle-following)**: Prisoner $i$ starts at box $i$, opens it, reads label $j$,
   then opens box $j$, and so on (up to $n/2$ steps).
2. **Random baseline**: Each prisoner opens $n/2$ uniformly random distinct boxes.
