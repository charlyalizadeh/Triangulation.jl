include("./utils/operator.jl")
include("./utils/buildgraph.jl")


function EG!(g::AbstractGraph, order=vertices(g))
    added_edges = []
    mg = buildmeta(g)
    old_mv = 0
    for v in order
        mv = vertex_s2m(mg, v)
        sedges = getsaturate(mg, mv)
        add_edges!(mg, sedges)
        sedges::Vector{Vector{Int}} = [edge_m2s(mg, e[1], e[2]) for e in sedges]
        push!(added_edges, sedges)
        add_edges!(g, sedges)
        rem_vertex!(mg, mv)
        old_mv = mv
    end
    data = Dict("added_edges" => added_edges)
    return data
end


function EG(g::AbstractGraph, order=vertices(g))
    cg = deepcopy(g)
    EG!(cg, order)
    return cg, data
end
