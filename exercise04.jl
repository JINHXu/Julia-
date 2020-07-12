# Ex 04
# 11. July 2020, Jinghua Xu

# returns a list of all vowels in the input string, throw an error if the input is not a vowel
function collectVowels(str)
    # param check
    if typeof(str) != String
        throw(ArgumentError("The input is not a String!"))
    end
    vowels=['a','i','e','o','u','ü','ä','ö']
    vowels_collection = Char[]
    for char in str
        if lowercase(char) in vowels
            push!(vowels_collection,char)
        end
    end
    return vowels_collection
end

# tests
println(collectVowels("Julia"))
println(collectVowels("Tübingen"))
println(collectVowels("Überlingen"))


# checks whether the letter is voiced. It should take a character as an argument and return `true` if the character represents a voiced consonant in Turkish, `false` if the character does not represent a voiced consonant in Turkish, and throw an error if the argument is not a character.
function voiced(l)
    # param check
    if typeof(l) != Char
        throw(ArgumentError("The input is not a String!"))
    end
    voiced_consonants = Char['b', 'c', 'd', 'g', 'ğ', 'j', 'l', 'm', 'n', 'r', 'v', 'y', 'z']
    if lowercase(l) in voiced_consonants
        return true
    else
        return false
    end
end

# tests
print(voiced('ğ'))
print(voiced('M'))
print(voiced('ä'))
# print(voiced("a"))

# takes a number x as an argument and returns a vector of floating point numbers starting with x and each subsequent number being 0.5 smaller than the preceding number as long as the numbers are positive. (Small rounding errors are tolerated.)
function halfstepDown(x)
    # param check
    if !(isa.(x, Number))
        throw(ArgumentError("The input is not a number!"))
    end
    if x <= 0
        return Float64[]
    else
        numbers = Float64[x]
        next = last(numbers)-0.5
        while next > 0
            push!(numbers, next)
            next = last(numbers)-0.5
        end
    end
    return numbers
end

# tests
print(halfstepDown(2.1))
print(halfstepDown(-1))
# print(halfstepDown("abc"))
