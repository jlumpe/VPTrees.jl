# Implement search API in Neighborhood.jl

using Neighborhood


Neighborhood.searchstructure(::Type{VPTree}, data, metric; kw...) = VPTree(data, metric; kw...)


Neighborhood.datatype(::Type{<:VPTree{InputType}}) where InputType = InputType
Neighborhood.getmetric(tree::VPTree) = tree.metric


function Neighborhood.isearch(tree::VPTree, query, t::NeighborNumber, skip=alwaysfalse)
    return find_nearest(tree, query, t.k, skip)
end

function Neighborhood.isearch(tree::VPTree, query, t::WithinRange, skip=alwaysfalse)
    return find(tree, query, t.r, skip)
end

function Neighborhood.search(tree::VPTree, query, t::SearchType, skip=alwaysfalse)
    idxs = isearch(tree, query, t, skip)
    return idxs, [tree.metric(query, tree.data[i]) for i in idxs]
end
