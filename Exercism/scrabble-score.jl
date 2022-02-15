"""
Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10
"""

function score(ch::Char)
    ch == "" && return 0

    ch = uppercase(ch)

    if ch in ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T']
        ch_val = 1
    elseif ch in ['D', 'G']
        ch_val = 2
    elseif ch in ['B', 'C', 'M', 'P']
        ch_val = 3
    elseif ch in ['F', 'H', 'V', 'W', 'Y']
        ch_val = 4
    elseif ch in ['K']
        ch_val = 5
    elseif ch in ['J', 'X']
        ch_val = 8
    elseif ch in ['Q', 'Z']
        ch_val = 10
    else
        ch_val = 0
    end


    return ch_val
end

function score(str::String)

    value = 0
    for letter in str
        value += score(letter)
    end

    return value
end
