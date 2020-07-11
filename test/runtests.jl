using Test
using VPTrees
using Random
using StringDistances


function hamming(a::Integer, b::Integer)
    count_ones(xor(a, b))
end


@testset "VPTree" begin include("vptree.jl") end
@testset "Neighborhood.jl API" begin include("neighborhood_api.jl") end
