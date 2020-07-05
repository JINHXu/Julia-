# Exercise 03
# Jinghua Xu 4.July, 2020

# the function takes a vector of vectors and return true if the vectors are of the same length, false otherwise
function same_length(v)
    # param check
    if !isa(v, Array{})
        throw(ArgumentError("The input is not a vector!"))
    else
        for i in collect(2:length(v))
            if !isa(v[i-1], Array{})
                throw(ArgumentError("Invalid input, not a vector of all vectors!"))
            else
                if length(v[i]) != length(v[i-1])
                    return false
                end
            end
        end
    end
    return true
end

# tests
v1 = [1,2,3]
v2 = [[1],2,3]
v3 = [[1],[2],[3]]
v4 = [[1],[2],[3,4,5,6]]
v5 = [[[[1]]],[[[2]]]]

# print(same_length(v1))
# print(same_length(v2))
# print(same_length(v3))
# print(same_length(v4))
# print(same_length(v5))

# fibonacci that computes the ​n-th Fibonacci number for each natural number ​n>0
function fibonacci(n)
    # param check
    if n<=0 || !isa(n, Int64)
        throw(ArgumentError("Invalid argument! n has to be a natural number."))
    end
    if n==1 || n==2
        return 1
    end
    fibs = Int64[1,1]
    for i in collect(3:n)
        append!(fibs, fibs[i-1]+fibs[i-2])
    end
    return last(fibs)
end

# tests
# fibonacci(0)
# fibonacci(-5)
# fibonacci(1.7)
fibonaccis = []
for n in collect(1:10)
    append!(fibonaccis, fibonacci(n))
end

fibs = [1
1
2
3
5
8
13
21
34
55]

@assert fibonaccis == fibs


# computes the ​th Fibonacci number for each natural number ​and stores the result into a dictionary which exists outside the function. fibonacciM should use the precomputed results in this dictionary wherever possible rather than recomputing smaller Fibonacci numbers over and over again.
fibM = Dict()
function fibonacciM(n, fibM)
    # param check
    if n<=0 || !isa(n, Int64)
        throw(ArgumentError("Invalid argument! n has to be a natural number."))
    end
    if !(n in keys(fibM))
        for idx in collect(length(fibM)+1 : n)
            if idx == 1 || idx == 2
                fibM[idx] = 1
            else
                fibM[idx] = fibM[idx-1]+fibM[idx-2]
            end
        end
    end
    return fibM[n]
end

# tests
f = []
for n in collect(1:10)
    append!(f, fibonacciM(n,fibM))
end

fibs = [1
1
2
3
5
8
13
21
34
55]

@assert f == fibs

# compare the runtime of the two functions
n=10
fibM = Dict()
@time begin
    fibonacci(n)
end
@time begin
    fibonacciM(n,fibM)
end

n=15
@time begin
    fibonacci(n)
end
@time begin
    fibonacciM(n,fibM)
end

n=20
@time begin
    fibonacci(n)
end
@time begin
    fibonacciM(n,fibM)
end
