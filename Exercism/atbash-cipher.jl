"""
Plain:  abcdefghijklmnopqrstuvwxyz
Cipher: zyxwvutsrqponmlkjihgfedcba
"""

function encode(s::Char)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    rev_alphabet = reverse(alphabet)

    ind = Int(s) - Int('a') + 1
    return rev_alphabet[ind]

end

function encode(input::AbstractString)
    input = lowercase(input)
    input = replace(input, r" ,.:;?!()"=>"")
    # input = replace(input, [r"[,.:;?!()]"], [""])

    io = IOBuffer()
    for letter in input
        write(io, encode(letter))
    end
    return String(take!(io))
end



function decode(s::Char)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    rev_alphabet = reverse(alphabet)

    ind = Int(s) - Int('z') + 26
    return alphabet[ind]

end

function decode(input::AbstractString)
    input = lowercase(input)
    input = replace(input, r" "=>"")

    io = IOBuffer()
    for letter in input
        write(io, encode(letter))
    end
    return String(take!(io))
end


alphabet = "abcdefghijklmnopqrstuvwxyz"
rev_alphabet = reverse(alphabet)

println(alphabet)
println(rev_alphabet)

# map(alphabet, rev_alphabet)

test = "test" # --> gvhg
rev_test = "gvhg"

println(Int('a'))
println(Int('z'))

println(encode(test))
println(decode(rev_test))
