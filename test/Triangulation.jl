using Test

include("../src/Triangulation.jl")
include("../src/utils/ischordal.jl")
using Main.Triangulation; const trg = Triangulation
using Main.Triangulation.LightGraphs; const lg = Triangulation.LightGraphs

# Very poor test coverage
# TODO: Better test
@testset "EG" begin
    g = lg.cycle_graph(1000)
    @test !ischordal(g)
    trg.EG!(g)
    @test ischordal(g)
end


@testset "MD" begin
    g = lg.cycle_graph(1000)
    @test !ischordal(g)
    trg.MD!(g)
    @test ischordal(g)
end


@testset "Cholesky" begin
    g = lg.cycle_graph(1000)
    @test !ischordal(g)
    g, data = trg.choleskydec(g)
    @test ischordal(g)
end


@testset "LEX_M" begin
    g = lg.cycle_graph(1000)
    @test !ischordal(g)
    data = trg.LEX_M!(g)
    @test ischordal(g)
end


@testset "MCS_M" begin
    g = lg.cycle_graph(1000)
    @test !ischordal(g)
    g, data = trg.MCS_M(g)
    @test ischordal(g)
end
