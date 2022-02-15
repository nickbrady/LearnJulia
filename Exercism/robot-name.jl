# function reset!(instance::Robot)
#
# end
using Random

alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
numbers = "0123456789"
RobotName = randstring(alphabet, 2) * randstring(numbers, 3)

RobotNames_List = []

while length(RobotNames_List) < 100
    alphabet = "ABC"
    numbers = "012"
    RobotName = randstring(alphabet, 2) * randstring(numbers, 3)
    if RobotName in RobotNames_List
        continue
    end
    append!(RobotNames_List, [RobotName])
end

println(3^5)

println(RobotNames_List)
println(length(RobotNames_List))
println(length(unique(RobotNames_List)))


# rand_num = rand(0:999)
# rand_num = lpad(rand_num, 3, "0")
# println(rand_num)
