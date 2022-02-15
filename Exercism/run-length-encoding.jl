function encode(count::Integer, ch::Char)
    io = IOBuffer()

    if count != 1
        write(io, string(count))
    end
    write(io, ch)

    return String(take!(io))
end

function encode(s::AbstractString)
    length(s) == 0 && return ""

    count = 1
    io = IOBuffer()

    for i in 2:length(s)
        if s[i] == s[i-1]
            count += 1
            continue
        end

        write(io, encode(count, s[i-1]))
        count = 1

    end
    write(io, encode(count, s[end]))

    return String(take!(io))
end



function decode(match::RegexMatch)
    # RegexMatch("20W", 1="20", 2="W")
    # 1 is the count, 2 is the character
    if match[1] == ""
        count = 1
    else
        count = parse(Int, match[1])
    end

    return match[2]^count
end

function decode(s::AbstractString)
    io = IOBuffer()
    # count = ""

    reg = r"([0-9]*)([\w\W])"               # look for patter of #A###A
    matches = collect(eachmatch(reg, s))    # # - can be any length, but always
                                            # terminates with letter
    for match in matches
        write(io, decode(match))
    end

    return String(take!(io))

end


test1 = "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
test2 = "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWW"

println(encode(test1) == "12WB12W3B24WB")
println(encode(test2)  == "12WB12W3B25W")

test3 = "12WB12W3B24WB"

println(decode(test3) == "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
println(decode(""))


test5 = "20WB12W3B24WB"
println(decode(test5) == "WWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
