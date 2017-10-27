# LCS Problem in Linear Space

[![Build Status](https://travis-ci.org/c910335/LCS-Problem-in-Linear-Space.svg?branch=master)](https://travis-ci.org/c910335/LCS-Problem-in-Linear-Space)

Solve Longest Common Subsequence Problem in Linear Space in Several Languages

## Languages

- Ruby
- Crystal
- C++ (C++17)

## Problem

Given two sequences X =〈x<sub>1</sub>, x<sub>2</sub>, … , x<sub>m</sub>〉and Y = 〈y<sub>1</sub>, y<sub>2</sub>, … , y<sub>n</sub>〉, find a longest common subsequence of X and Y.

### Input

First line contains an integer **T**, representing the number of testcases.
In the next **T** lines, each line contains two string **X** and **Y**.

- 2 ≤ T ≤ 20
- X and Y =~ `/^[A-Za-z0-9]{5,1000}$/`

### Output

For each test case, output the LCS of X and Y on one line.
If there exist more than one LCS, any one is acceptable.
If the LCS doesn't exist, output a blank line.

### Sample Input

```
2
ABACABAC CABCBAAB
lRk3W1I9WxwL8u3l2GA4 3In9qxKcLuN963Yxlvq4
```

### Sample Output

```
ABAAB
3I9xLu3l4
```

## Contributing

1. Fork it ( https://github.com/c910335/LCS-Problem-in-Linear-Space/fork )
2. Create your feature branch (git checkout -b add-new-language)
3. Commit your changes (git commit -am 'add new language')
4. Push to the branch (git push origin add-new-language)
5. Create a new Pull Request

## Contributors

- [c910335](https://github.com/c910335) Tatsujin Chin - creator, maintainer
- [david50407](https://github.com/david50407) David Kuo - C++17
