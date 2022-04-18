using LinearAlgebra

"""
    List out all the combinations 
"""
function Combinator!(
    s::Vector, 
    start::Int, # offset for the array index. 
    m::Int,     # number of elements to choose. 
    accumulate::Vector, 
    results::Vector{Vector}
)
    if m <= 1
        for e in start:(s|>length)
            push!(results, vcat(accumulate, e))
        end
    return end
    for II in start:((s|>length) + 1 - m)
        push!(accumulate, s[II])
        Combinator!(
            s, II + 1, m - 1, accumulate, results
        )
        accumulate |> pop!
    end
    
return end

function Combinator(s::Int, m::Int)
    s = 1:s |> collect
    v = Vector{Int}()
    r = Vector{Vector}()
    Combinator!(s, 1, m, v, r)
return r end


function VertexSearch(A::AbstractMatrix)
    TightConstraints = Vector{Vector{Int}}()
    Vertices = Vector{Vector{AbstractFloat}}()
    for Indices in Combinator(size(A, 1), size(A, 2))
        SubMatrix = A[Indices, :]
        x = SubMatrix\(b[Indices])
        if (SubMatrix |> det) != 0 && all(A*x .<= b)
            SubMatrix |> display    
            println("This is in the Polytope")
            push!(Vertices, x)
        end
    end
    println("List of tight constraints are: ")
    TightConstraints |> display
    println("List of all vertices are")
    Vertices |> display

return end

A = [1 1 0; 0 1 1; 1 0 1; -2 -1 0; 0 -1 -2; -2 0 -1]
b = [2; 4; 3; 3; 3; 2]
VertexSearch(A)

