include("./utils/operator.jl")
include("./utils/buildgraph.jl")


function MD!(g::AbstractGraph)
    mg = buildmeta(g)
    for i in 1:nv(g)
        mv = mindeg(mg)
        sedges = getsaturate(mg, mv)
        add_edges!(mg, sedges)
        sedges::Vector{Vector{Int}} = [edge_m2s(mg, e[1], e[2]) for e in sedges]
        add_edges!(g, sedges)
        rem_vertex!(mg, mv)
    end
end


function MD(g::AbstractGraph)
    cg = deepcopy(g)
    MD!(cg)
    return cg
end
