include("merge.jl")
include("molzhan.jl")

function minimize_sliwak(cliques::AbstractVector, cliquetree::AbstractVector, alpha, beta, m, nb_lc)
    costs = [sliwak_heuristic(cliques, edge, alpha, beta, m, nb_lc) for edge in cliquetree]
    index = argmin(costs)
    return cliquetree[index]
end


function sliwak_heuristic(cliques::AbstractVector, edge, alpha, beta, m, nb_lc)
    clique1 = cliques[edge[1]]
    clique2 = cliques[edge[2]]
    size_intersect = length(intersect(clique1, clique2))
    size_clique1 = length(clique1)
    size_clique2 = length(clique2)
    size_fusion_clique = size_clique1 + size_clique2 - size_intersect
    nb_lc_new = nb_lc - size_intersect * (2 * size_intersect + 1)
    q2 = (m + nb_lc_new)^3
    cost = alpha * (- size_clique1^3 - size_clique2^3 + size_fusion_clique^3) 
           + beta * q2
    return cost
end


function merge_sliwak(cliques::AbstractVector, cliquetree::AbstractVector,
                      alpha, beta, m, nb_lc;
                      treshold::Union{Int,Function}=treshold_percent(cliques, 0.1),
                      kmax=3)
    edges = Set()
    if typeof(treshold) <: Int
        treshold_value = treshold
        treshold = x -> length(x) >= treshold_value
    end
    k = 0
    while treshold(cliques)
        edge = k <= kmax ?
                    minimize_sliwak(cliques, cliquetree, alpha, beta, nb_lc, m) :
                    minimize_molzhan(cliques, cliquetree)
        size_intersect = length(intersect(cliques[edge[1]], cliques[edge[2]]))
        nb_lc -= size_intersect * (2 * size_intersect + 1)
        edges = vcat(edges..., get_added_edges(cliques[edge[1]], cliques[edge[2]])...)
        cliques, cliquetree = merge_cliques(cliques, cliquetree, edge)
        k += 1
    end
    return cliques, cliquetree, edges
end
