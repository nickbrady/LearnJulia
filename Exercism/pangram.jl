sentence = "Hello, World!"

function ispangram(input::String)
    input = lowercase(input)

    alphabet = "abcdefghijklmnopqrstuvwxyz"

    is_letter_in_input = [letter in input for letter in alphabet]
    return all(is_letter_in_input)

end

println(ispangram(sentence))
