using Neighborhood
using Neighborhood.Testing


skip3(i) = i % 3 == 0
skip3bulk(i, j) = skip3(i + j)


@testset "Euclidean" begin
    metric = Euclidean()
    data = [rand(3) for _ in 1:100]

    ss = searchstructure(VPTree, data, metric)
    @test Neighborhood.datatype(ss) === eltype(data)
    @test Neighborhood.getmetric(ss) === metric

    queries = [rand(3) for _ in 1:10]

    for t in [WithinRange(0.5), NeighborNumber(10)]
        for skip in [nothing, skip3]
            for query in queries
                results = search_allfuncs(ss, query, t, skip)
                @test cmp_bruteforce(results, data, metric, query, t, skip)
            end
        end

        for skip in [nothing, skip3bulk]
            test_bulksearch(ss, queries, t, skip)
        end
    end
end
