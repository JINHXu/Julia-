# Exercise 2
# Jinghua Xu, 28. June, 2020

# a function `rowwise` that takes a vector of vectors of equal length and returns a matrix where the input vectors are the rows of the resulting matrix. If the input vectors are of unequal length, the function should raise an error
function rowwise(vectors)
    # param check
    for i in collect(2:length(vectors))
        if length(vectors[i]) != length(vectors[i-1])
            throw(ArgumentError("The input vectors are of unequal length!"))
        end
    end
    return permutedims(hcat(vectors...))
end

# tests
print(rowwise([[1,2],[3,4]]))

# expecting an error raised by the function
# print(rowwise([[0],[1,1,1]]))

# a function `interleave` that takes a vector of vectors of equal length as input and returns a vector which starts with all the first elements of the input vectors (in the order of the input), followed by the second elements etc.
function interleave(vectors)
    # param check
    for i in collect(2:length(vectors))
        if length(vectors[i]) != length(vectors[i-1])
            throw(ArgumentError("The input vectors are of unequal length!"))
        end
    end

    interleaved_vec = []
    for idx in collect(1:length(vectors[1]))
        for vector in vectors
            push!(interleaved_vec, vector[idx])
        end
    end
    return interleaved_vec
end

# test
print(interleave([[1,2,3], ["a", "b", "c"]]))

# a function `issort` that takes a vector as an argument and returns `true` in case the vector is sorted, and false otherwise. It should work for different types. So for a vector of numbers, the it should test for sorting by size and for a vector of strings it should test for lexigraphic ordering.
function issort(vector)
    if vector == sort(vector)
        return true
    else
        return false
    end
end

# tests

print(issort([1,5,4]))
# false

print(issort([1,4,5]))
# true

print(issort(split("My name is Julia")))
# false

print(issort(split("my name was zeno")))
# true
