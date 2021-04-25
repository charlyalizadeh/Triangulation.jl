function buildmeta(g)
    mg = MetaGraph(g)
    for v in vertices(mg)
        set_indexing_prop!(mg, v, :v, v)
    end
    return mg
end
