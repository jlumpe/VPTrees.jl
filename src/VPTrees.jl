module VPTrees

using Requires


include("vantage_point_tree.jl")

export VPTree, find, find_nearest


function __init__()
    @require Neighborhood="645ca80c-8b79-4109-87ea-e1f58159d116" include("neighborhood_api.jl")
end

end # module
