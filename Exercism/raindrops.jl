function raindrops(number::Integer)

    result_string = ""

    if mod(number, 3) == 0
        result_string *= "Pling"
    end

    if mod(number, 5) == 0
        result_string *= "Plang"
    end

    if mod(number, 7) == 0
        result_string *= "Plong"
    end

    if result_string == ""
        return string(number)
    else
        return result_string
    end

end
