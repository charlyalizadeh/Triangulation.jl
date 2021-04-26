# Triangulation.jl

A julia implementation of diverse graph theory triangulation algorithms (chordal extension) using [LightGraphs](https://github.com/JuliaGraphs/LightGraphs.jl) and [MetaGraphs](https://github.com/JuliaGraphs/MetaGraphs.jl).

## Implementation choices

Algorithms based on vertex elimination use [MetaGraphs](https://github.com/JuliaGraphs/MetaGraphs.jl) to keep vertices indices "intact". To do so we use the function `set_indexing_prop!` from MetaGraphs which allows fast retrieve of a vertex index given its label. The package [VertexSafeGraphs](https://github.com/matbesancon/VertexSafeGraphs.jl) allows such functionality with the counterpart that some LightGraphs funtions are slower which is why I decided to use MetaGraphs. The implementation is not as clean as it could be if we used VertexSafeGraphs but the main focus is performance.

## Triangulation algorithms

* [X] Elimination Game (`EG`) [[1]](#1)  
* [X] Minimum Degree (`MD`) [[2]](#2)  
* [X] Cholesky decomposition (`choleskydec`) [[3]](#3)
* [X] LEX-M (`LEX-M`) [[4]](#4)
* [ ] Saturate Minimal Separator (I may not implement it because finding minimal separators of a graph is not trivial) [[7]](#7)
* [X] MCS-M (`MCS-M`) [[5]](#5)
* [ ] CliqueMinTriang [[12]](#12)
* [ ] MinTriang [[12]](#12)

## Ordering

* [X] Lexicographic Breadth First Search | Lex-BFS (`lbfs`) [[4]](#4)
* [ ] Maximum Cardinality Search | MCS [[6]](#6)
* [ ] Maximum Label Search | MLS [[11]](#11)

## Merging algorithms

* [ ] Molzahn et al. algorithm [[8]](#8)
* [ ] Fujisawa et al. algorithm [[9]](#9)
* [ ] Sliwak et al. algorithm [[10]](#10)


## Credits

Additionnaly to the references I want to credit [Feathergunner](https://github.com/Feathergunner) for his repos [Triangulation](https://github.com/Feathergunner/Triangulation) that I looked sometimes for more concretes implementations than the ones described in the papers.

## References


<a id="1">[1]</a> S. Parter. The use of linear graphs in gauss elimination. *SIAM Review*, 3(2):119–130, 1961.


<a id="2">[2]</a> A. Berry, P. Heggernes, and G. Simonet. The minimum degree heuristic and the minimal triangulation process. *Graph-Theoretic Concepts in Computer Science Lecture Notes in Computer Science*, page 58–70, 2003.


<a id="3">[3]</a> M. Fukuda, M. Kojima, K. Murota, and K. Nakata. Exploiting sparsity in semidef- inite programming via matrix completion i: General framework. *SIAM Journal on Optimization*, 11(3):647–674, 2001.


<a id="4">[4]</a> D. J. Rose and R. E. Tarjan. Algorithmic aspects of vertex elimination on directed graphs. *SIAM Journal on Applied Mathematics*, 34(1):176–197, 1978.

<a id="5">[5]</a> A. Berry, J. R. S. Blair, P. Heggernes, and B. W. Peyton. Maximum cardinality search for computing minimal triangulations of graphs. *Algorithmica*, 39(4):287–298, 2004.


<a id="6">[6]</a> R. E. Tarjan and M. Yannakakis. Addendum: Simple linear-time algorithms to test chordality of graphs, test acyclicity of hypergraphs, and selectively reduce acyclic hypergraphs. *SIAM Journal on Computing*, 14(1):254–255, 1985.


<a id="7">[7]</a> **Missing reference**


<a id="8">[8]</a> D. K. Molzahn, J. T. Holzer, B. C. Lesieutre, and C. L. DeMarco. Implementation of a large-scale optimal power flow solver based on semidefinite programming. *IEEE Transactions on Power Systems,* 28(4):3987–3998, 2013.


<a id="9">[9]</a> K. Nakata, K. Fujisawa, M. Fukuda, M. Kojima, and K. Murota. Exploiting sparsity in semidefinite programming via matrix completion ii: Implementation and numerical results. *Mathematical Programming,* 95(2):303–327, 2003.


<a id="10">[10]</a> J. Sliwak, E. Andersen, M. F. Anjos, L. Letocart, and E. Traversi. A clique merging algorithm to solve semidenite relaxations of optimal power flow problems. *IEEE Transactions on Power Systems,* 2020.


<a id="11">[11]</a> A. Berry, R. Krueger, and G. Simonet. Maximal label search algorithms to compute perfect and minimal elimination orderings. *SIAM Journal on Discrete Mathematics,* 23(1):428–446, 2009.


<a id="12">[12]</a> [5] M. Mezzini and M. Moscarini. Simple algorithms for minimal triangulation of a graph and backward selection of a decomposable markov network. *Theoretical Computer Science*, 411(7-9):958–966, 2010.
