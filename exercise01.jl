# Exercise 01: Strings, Vectors and Functions
# Jinghua Xu, 21. June 2020

#=
A function `myreverse` that takes a vector as an argument and returns a vector of the same length, with the order of the elements reversed.
=#
function myreverse(vec)
    # reversed_vec = Int64[] to restrict element type to Int64
    reversed_vec = []
    for idx in range(1, length=length(vec))
        push!(reversed_vec, vec[idx])
    end
    return reversed_vec
end

# test
vec1 = [1,2,3]
println(myreverse(vec1))

vec2 = ['a','b','c','d','e']
println(myreverse(vec2))

#=
Write a function `uppercaseWords` that takes a string as input, splits it at all whitespaces and returns a vector of the words that start with an uppercase letter.
=#
function uppsercaseWords(str)
    return [word for word in split(str) if isuppercase(word[1])]
end

# test
str = "The name is Julia"
println(uppsercaseWords(str))

#=
function uppercaseWords(str)
    uppercaseWords = []
    for word in split(str)
        if isuppercase(word[1])
            push!(uppercaseWords, word)
        end
    end
    return uppercaseWords
end

# test
str = "The name is Julia"
println(uppercaseWords(str))
=#

#=
a function `prettyPlus` that takes to numbers as arguments and returns a string representating the equation with the addition on the left hand side and the string on the right hand side
=#
function prettyPlus(x,y)
    println("$x + $y = $(x+y)")
end

# test
prettyPlus(1,2)
