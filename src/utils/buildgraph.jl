function buildmeta(g::AbstractGraph)
    mg = MetaGraph(g)
    for v in vertices(mg)
        set_indexing_prop!(mg, v, :v, v)
    end
    return mg
end

function build_graph_cliquetree(cliques::AbstractVector, cliquetree::AbstractVector)
    mg = MetaGraph(length(cliques))
    set_indexing_prop!(mg, :clique)
    for (i, c) in enumerate(cliques)
        set_indexing_prop!(mg, i, :clique, c)
    end
    for edge in cliquetree
        c1 = cliques[edge[1]]
        c2 = cliques[edge[2]]
        src = mg[src, :clique]
        dst = mg[dst, :clique]
        add_edge!(mg, src, dst)
        set_prop!(mg, src, dst, :weight, length(intersect(c1, c2)))
    end
    return mg
end
