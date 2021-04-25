using Test
using SimpleGraphs

include("../src/utils/ischordal.jl")

@testset "ischordal" begin
    g = Path(3)
    @test ischordal(g)
    add!(g, 1, 3)
    @test ischordal(g)
    g = Path(4)
    add!(g, 1, 4)
    @test !ischordal(g)
    add!(g, 1, 4)
    add!(g, 2, 4)
    @test ischordal(g)
end
