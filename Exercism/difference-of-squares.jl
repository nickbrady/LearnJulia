"Square the sum of the first `n` positive integers"

function square_of_sum(n::Integer)
    return sum(1:n)^2
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n::Integer)
    x = Array(1:n)'
    return sum(x.^2)
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n::Integer)
    return square_of_sum(n) - sum_of_squares(n)
end
