function is_leap_year(year::Int)
    leap_year = false

    if mod(year, 4) == 0
        leap_year = true

        if mod(year, 100) == 0
            leap_year = false

            if mod(year, 400) == 0
                leap_year = true
            end
        end
    end

    return leap_year

end

is_leap_year(1996)

is_leap_year(2000)
ß
is_leap_year(1000)
