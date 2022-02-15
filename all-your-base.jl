function digits_value(digits::Vector, base::Integer)
    value = 0
    for (i, d) in enumerate(reverse(digits))
        value += d * base^(i-1)
    end

    return value

end


function integer_divide_with_remainder!(number::Integer, divisor::Integer)
    return number ÷ divisor, rem(number, divisor)
end


function all_your_base(digits::Vector, base_in::Integer, base_out::Integer)
    (base_in <= 1) | (base_out <= 1) && throw(DomainError("Base In and Base Out need to be positive and greater than or equal to 2"))

    !all(d >= 0 for d in digits) && throw(DomainError("All digits need to be greater than or equal to 0"))

    !all(d < base_in for d in digits) && throw(DomainError("All digits need to be less than the base_in value"))

    value = digits_value(digits, base_in)

    value == 0 && return [0]

    n = floor(Int, log(base_out, value))    # log base_out of value
    digits_out = Vector{Int}(undef, n+1)    # create an array of length n+1

    for (i, pow) in enumerate(n:-1:0)
        digit, value = integer_divide_with_remainder!(value, base_out^pow)
        digits_out[i] = digit
    end

    return digits_out
end


println(all_your_base([0, 0], 1, 3))

# value = 42
# base_out = 2
#
# n = floor(Int, log(base_out, value))    # log base_out of value
#
# # create an array of length n+1
# digits_out = Vector{Int}(undef, n+1)
#
# for (i, pow) in enumerate(n:-1:0)
#     global value, digits_out
#
#     digit, value = integer_divide_with_remainder!(value, base_out^pow)
#     digits_out[i] = digit
# end
#
# println(digits_out)
