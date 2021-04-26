module Triangulation


using LightGraphs
using MetaGraphs
using Combinatorics
using LinearAlgebra
using SparseArrays

include("./EG.jl")
include("./MD.jl")
include("./LEX_M.jl")
include("./Cholesky.jl")

export EG, EG!
       MD, MD!
       choleskydec,
       LEX_M, LEX_M!,


end # module
