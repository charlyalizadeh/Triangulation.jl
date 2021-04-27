include("../utils/merge.jl")

function select(cliques::AbstractVector, cliquetree::AbstractVector;
                selection=minimize_molzhan)
    return selection(cliques, cliquetree)
end


function merge(cliques::AbstractVector, cliquetree::AbstractVector;
               treshold::Union{Int,Function}=treshold_percent(cliques, 0.1),
               selection::Function=minimize_molzhan, kwargs...)
    edges = Set()
    if typeof(treshold) <: Int
        treshold_value = treshold
        treshold = x -> length(x) >= treshold_value
    end
    while treshold(cliques; kwargs...)
        edge = selection(cliques, cliquetree)
        edges = vcat(edges..., get_added_edges(cliques[edge[1]], cliques[edge[2]])...)
        cliques, cliquetree = merge_cliques(cliques, cliquetree, edge)
    end
    return cliques, cliquetree, edges
end


# General function for merge, not used for the moment
#function merge(cliques::AbstractVector, cliquetree::AbstractVector, nb_lc::Int;
#               treshold::Union{Int,Function}=treshold_percent(cliques, 0.1),
#               minimizes::Vector{Function}=[minimize_molzhan],
#               choose_heuritic::Union{Bool,Function}=false,
#               heuristics_args...)
#    if typeof(treshold) <: Int
#        treshold = (;cliques, kwargs...) -> length(cliques) >= treshold
#    end
#    stop = false
#    it = 0
#    nb_cliques_old = length(cliques)
#    while !stop
#        h_index = choose_heuristic(;cliques=cliques,
#                                   cliquetree=cliquetree, 
#                                   it=it,
#                                   nb_cliques_old=nb_cliques_old,
#                                   heuristics_args...)
#        edge = minimizes[h_index](cliques, cliquetree, heuristics_args...)
#        edges = vcat(edges..., get_added_edges(cliques[edge[1]], cliques[edge[2]])...)
#        cliques, cliquetree = merge_cliques(cliques, cliquetree, edge)
#        stop = treshold(;cliques=cliques,
#                        cliquetree=cliquetree, 
#                        it=it,
#                        nb_cliques_old=nb_cliques_old,
#                        heuristics_args...)
#    end
#    return cliques, cliquetree, edges
#end
