"""
Determine if a word or phrase is an isogram.

An isogram (also known as a "nonpattern word") is a word or phrase without a repeating letter, however spaces and hyphens are allowed to appear multiple times.

Examples of isograms:

lumberjacks
background
downstream
six-year-old

The word isograms, however, is not an isogram, because the s repeats.

Isograms are case insensitive.
"""

function isisogram(s::AbstractString)

    s = replace(s, r" "=>"")  # remove spaces
    s = replace(s, r"-"=>"")  # remove hyphens - these are allowed to repeat

    # if the length of the unique (lowercase) letters equals the length of the word, then it is an isogram

    length(s) == length(unique(lowercase(s))) && return true
    # else
    return false

end


test = "Emily Jung Schwartzkopf"
test = replace(test, r" "=>"")  # remove spaces
test = replace(test, r"-"=>"")  # remove hyphens - these are allowed to repeat
println(test)

println(length(test))
println(length(unique(lowercase(test))))
