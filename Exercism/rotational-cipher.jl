alphabet = "abcdefghijklmnopqrstuvwxyz"

ROT = 0
ROT = mod(ROT,26)

println(alphabet[1+ROT:end], alphabet[1:ROT])


# omg gives trl

text = "omg"
println(['o' == l for l in alphabet])

println(Int('O'))
println(Int('P'))

println(Int('o'))
println(Int('p'))



function rotational_cipher(text, ROT)
    ROT = mod(ROT, 26)

    # go through every character
    # if character not in alphabet, just return character
    # else get index of letter in alphabet
    # add ROT to index, return that letter from alphabet



end


function R13(text)



    # return
end
