function f()
    #println("Enter num searched")
    #num_searched = parse(Int64, readline())
    num_searched = 100
    a = 1
    b = 1
    c = 1
    result = "Nothing found in the $num_searched sorry"
    index = 1
    loop = 1
    loop1 = 1
    add = 1
    location = 1
    multiply = ones(Int64, (4, (num_searched^3)))
    sorted = ones(Int64, (4, (num_searched * (num_searched - 1) * (num_searched - 2))))
    #this num idk how to make big enough aleways
    save2 = ones(Int64, (3, num_searched^3))

    #finding all the numbers
    while a <= num_searched
        while b <= num_searched
            while c <= num_searched
                if b == c || a == b || a == c
                else
                    multiply[1, index] = a
                    multiply[2, index] = b
                    multiply[3, index] = c
                    multiply[4, index] = a^2 + b^2 + c^2
                end
                index = index + 1
                c = c + 1
            end
            c = 1
            b = b + 1
        end
        b = 1
        a = a + 1
    end

    index = 1

    #sorting
    for i in 14 : (num_searched^2 + (num_searched - 1)^2 + (num_searched - 2)^2)
        for index in 1 : (num_searched^3)
            if multiply[4, index] == i
                sorted[4, location] = multiply[4, index]
                sorted[3, location] = multiply[3, index]
                sorted[2, location] = multiply[2, index]
                sorted[1, location] = multiply[1, index]
                location = location + 1
            end
            index = index + 1
        end
    end

    loop = 1
    loop1 = 0
    index = 1

    #Finding the square
    for val in 14 : sorted[4, (num_searched * (num_searched - 1) * (num_searched - 2))]
        while loop <= (num_searched * (num_searched - 1) * (num_searched - 2)) && sorted[4, loop] == val
            while (loop + loop1) <= (num_searched * (num_searched - 1) * (num_searched - 2)) && sorted[4, (loop + loop1)] == val
                if sorted[1, loop] != sorted[1, (loop + loop1)] && sorted[1, loop] != sorted[2, (loop + loop1)] && sorted[1, loop] != sorted[3, (loop + loop1)] &&
                   sorted[2, loop] != sorted[1, (loop + loop1)] && sorted[2, loop] != sorted[2, (loop + loop1)] && sorted[2, loop] != sorted[3, (loop + loop1)] &&
                   sorted[3, loop] != sorted[1, (loop + loop1)] && sorted[3, loop] != sorted[2, (loop + loop1)] && sorted[3, loop] != sorted[3, (loop + loop1)]

                    add = loop1 + 1

                    while (loop + add) <= (num_searched * (num_searched - 1) * (num_searched - 2)) && sorted[4, (loop + add)] == val
                        if sorted[1, loop] != sorted[1, (loop + add)] && sorted[1, loop] != sorted[2, (loop + add)] && sorted[1, loop] != sorted[3, (loop + add)] &&
                           sorted[2, loop] != sorted[1, (loop + add)] && sorted[2, loop] != sorted[2, (loop + add)] && sorted[2, loop] != sorted[3, (loop + add)] &&
                           sorted[3, loop] != sorted[1, (loop + add)] && sorted[3, loop] != sorted[2, (loop + add)] && sorted[3, loop] != sorted[3, (loop + add)] &&
                           sorted[1, (loop + loop1)] != sorted[1, (loop + add)] && sorted[1, (loop + loop1)] != sorted[2, (loop + add)] && sorted[1, (loop + loop1)] != sorted[3, (loop + add)] &&
                           sorted[2, (loop + loop1)] != sorted[1, (loop + add)] && sorted[2, (loop + loop1)] != sorted[2, (loop + add)] && sorted[2, (loop + loop1)] != sorted[3, (loop + add)] &&
                           sorted[3, (loop + loop1)] != sorted[1, (loop + add)] && sorted[3, (loop + loop1)] != sorted[2, (loop + add)] && sorted[3, (loop + loop1)] != sorted[3, (loop + add)]
                           if (((sorted[1, loop])^2) + ((sorted[1, (loop + loop1)])^2) + ((sorted[1, (loop + add)])^2)) == sorted[4, loop] &&
                              (((sorted[2, loop])^2) + ((sorted[2, (loop + loop1)])^2) + ((sorted[2, (loop + add)])^2)) == sorted[4, loop] &&
                              (((sorted[3, loop])^2) + ((sorted[3, (loop + loop1)])^2) + ((sorted[3, (loop + add)])^2)) == sorted[4, loop] &&
                              (((sorted[1, loop])^2) + ((sorted[2, (loop + loop1)])^2) + ((sorted[3, (loop + add)])^2)) == sorted[4, loop] &&
                              (((sorted[3, loop])^2) + ((sorted[2, (loop + loop1)])^2) + ((sorted[1, (loop + add)])^2)) == sorted[4, loop]
                               println("#############")
                               println(string(sorted[1, loop]) * ", " * string(sorted[2, loop]) * ", " * string(sorted[3, loop]) * ", " * string(sorted[4, loop]))
                               println(string(sorted[1, (loop + loop1)]) * ", " * string(sorted[2, (loop + loop1)]) * ", " * string(sorted[3, (loop + loop1)]) * ", " * string(sorted[4, (loop + loop1)]))
                               println(string(sorted[1, (loop + add)]) * ", " * string(sorted[2, (loop + add)]) * ", " * string(sorted[3, (loop + add)]) * ", " * string(sorted[4, (loop + add)]))
                               println("#############")
                               stopper = readline()
                               save2[1, index] = loop
                               save2[2, index] = (loop + loop1)
                               save2[3, index] = (loop + add)
                               index = index + 1
                           end
                       end
                       add = add + 1
                   end
                end
                loop1 = loop1 + 1
            end
            loop1 = 0
            loop = loop + 1
        end
    end
    return result
end

@show f()
