using LinearAlgebra

function minor(m, i, j)
    m[1:end.!=i, 1:end.!=j]
end

function tr(a)
    n = size(a)

    for i in a

    end
end

function laplace(a, i=1)
    if size(a)[1] != size(a)[2]
        return "Matrix is not squared"
    end

    if size(a) == (1, 1)
        return a[1, 1]
    else
        return reduce(+, [(-1)^(i + j) * a[i, j] * laplace(minor(a, i, j)) for j in 1:size(a)[1]])
    end
end

function gauss(a)
    if size(a)[1] != size(a)[2]
        return "Matrix is not squared"
    end

    m = copy(a)
    if size(m)[1] == 1
        return m[1, 1]
    end

    res = (-1)^(findfirst(x -> x != 0, m[:, 1]) - 1) * m[1, 1]
    m[1, :] /= m[1, 1]
    for j in 2:size(m)[1]
        m[j, :] -= m[j, 1] * m[1, :]
    end

    return reduce(*, res * gauss(minor(m, 1, 1)))
end


