function minimize_molzhan(cliques::AbstractVector, cliquetree::AbstractVector)
    deltas = [molzhan_heuristic(cliques, edge) for edge in cliquetree]
    index = argmin(deltas)
    return cliquetree[index]
end


function molzhan_heuristic(cliques::AbstractVector, edge)
    size_intersect = length(intersect(cliques[edge[1]], cliques[edge[2]]))
    size_clique1 = length(cliques[edge[1]])
    size_clique2 = length(cliques[edge[2]])
    size_fusion = size_clique1 + size_clique2 - size_intersect
    delta = size_fusion * (2 * size_fusion + 1) -
            size_clique1 * (2 * size_clique1 + 1) -
            size_clique2 * (2 * size_clique2 + 1) -
            size_intersect * (2 * size_intersect + 1)
    return delta
end
