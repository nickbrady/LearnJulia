"Your optional docstring here"
function distance(a::String, b::String)
    if length(a) != length(b)
        throw(ArgumentError("DNA strands not equal length"))
    end

    distance_ = 0

    for x in 1:length(a)
        if a[x] != b[x]
            distance_ += 1
        end
    end

    return distance_

end

a = "GAGCCTACTAACGGGAT"
b = "CATCGTAATGACGGCCT"

println(distance(a, b))
