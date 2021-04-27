module Triangulation


using LightGraphs
using MetaGraphs
using Combinatorics
using LinearAlgebra
using SparseArrays

include("./TriangulationAlgos/EG.jl")
include("./TriangulationAlgos/MD.jl")
include("./TriangulationAlgos/LEX_M.jl")
include("./TriangulationAlgos/MCS_M.jl")
include("./TriangulationAlgos/Cholesky.jl")

export EG, EG!
       MD, MD!
       choleskydec,
       LEX_M, LEX_M!,
       MCS_M, MCS_M!


end # module
