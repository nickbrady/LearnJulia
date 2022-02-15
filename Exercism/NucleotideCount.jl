println()
strand = "GTACTAAG"

function count_nucleotides(strand::String)
    x = [s in ['A', 'C', 'G', 'T'] for s in strand]
    if !all(x)
        throw(DomainError("expects only A, C, G, or T"))
    end

    A, C, G, T = [0, 0, 0, 0]
    for s in strand
        println(s)

        if s == 'A'
            A += 1

        elseif s == 'C'
            C += 1

        elseif s == 'G'
            G += 1

        elseif s == 'T'
            T += 1
        end

    end

    strand_dict = Dict('A' => A, 'C' => C, 'G' => G, 'T' => T)

    return strand_dict

end


println(count_nucleotides(strand))
