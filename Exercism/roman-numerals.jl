"""
       1 => I
       5 => V
      10 => X
      50 => L
     100 => C
     500 => D
    1000 => M

    Only 10^x values are put on the left-hand-side of numerals
    90 => XC
    4  => IV
    9  => IX
"""
function numeral_divide!(number::Integer, divisor::Integer)
    return number ÷ divisor, rem(number, divisor)
end

function to_roman(number::Integer)
    numeral_vals  = [1, 5, 10, 50, 100, 500, 1000]
    numeral_chars = ["I", "V", "X", "L", "C", "D", "M"]
    numeral_vals  = reverse(numeral_vals)
    numeral_chars = reverse(numeral_chars)

    io = IOBuffer()
    remainder = number
    for (i, (val, ch)) in enumerate(zip(numeral_vals, numeral_chars))

        i % 2 == 0 && continue                          # only iterate over 1000, 100, 10, 1, the 5's are special cases
        count_i_left, count_v, count_ii = [0, 0, 0]     # these are special cases - set the counts to 0 to begin

        if i > 1
            ch_v  = numeral_chars[i-1]
            ch_ii = numeral_chars[i-2]
        else
            ch_v  = ""
            ch_ii = ""
        end

        count_i, remainder = numeral_divide!(remainder, val)

        if count_i >= 4         # if there are more than 4 I, X, C, then need to use a V, L, D
            if count_i == 9
                count_i_left = 1
                count_ii = 1
                count_i = 0
            else
                count_v = 1
                if count_i == 4
                    count_i_left = 1
                    count_i = 0
                else
                    count_i = rem(count_i, 5)
                end
            end
        end

        write(io, ch^count_i_left * ch_ii^count_ii * ch_v^count_v * ch^count_i)
    end

    return String(take!(io))

end

numeral_vals  = [1, 5, 10, 50, 100, 500, 1000]
numeral_chars = ["I", "V", "X", "L", "C", "D", "M"]
numeral_vals  = reverse(numeral_vals)
numeral_chars = reverse(numeral_chars)

# println(numeral_vals[1:2:end])
#         MMCDLXXXIX
# 2489 => MMCDLXXXIX
test_number = 2489

println(to_roman(test_number))

# remainder = test_number
#
# io = IOBuffer()
# for (i, (val, ch)) in enumerate(zip(numeral_vals, numeral_chars))
#     global remainder
#
#     i % 2 == 0 && continue                          # only iterate over 1000, 100, 10, 1, the 5's are special cases
#     count_i_left, count_v, count_ii = [0, 0, 0]     # these are special cases - set the counts to 0 to begin
#
#     if i > 1
#         ch_v  = numeral_chars[i-1]
#         ch_ii = numeral_chars[i-2]
#     else
#         ch_v  = ""
#         ch_ii = ""
#     end
#
#     count_i, remainder = numeral_divide!(remainder, val)
#
#     if count_i >= 4         # if there are more than 4 I, X, C, then need to use a V, L, D
#         if count_i == 9
#             count_i_left = 1
#             count_ii = 1
#             count_i = 0
#         else
#             count_v = 1
#             if count_i == 4
#                 count_i_left = 1
#                 count_i = 0
#             else
#                 count_i = rem(count_i, 5)
#             end
#         end
#     end
#
#     write(io, ch^count_i_left * ch_ii^count_ii * ch_v^count_v * ch^count_i)
# end
#
# println(String(take!(io)))
