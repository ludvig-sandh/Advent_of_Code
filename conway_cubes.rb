input = File.open("in.txt").readlines.map(&:chomp)

grid = []

m = 0
while m < 20
    i = 0
    grid[m] = []
    while i < 20
        grid[m][i] = []
        j = 0
        while j < 20
            grid[m][i][j] = ""
            k = 0
            while k < 20
                grid[m][i][j][k] = "."
                if i == 10 && m == 10 && j >= 7 && j <= 14 && k >= 7 && k <= 14
                    grid[m][i][j][k] = input[j - 7][k - 7]
                end
                k += 1
            end
            j += 1
        end
        i += 1
    end
    m += 1
end

grid[10][10] = input
for g in grid[10][10] do
    p g
end


def copy1(grid)
    newGrid = []
    i = 0
    while i < grid.length
        newGrid[i] = grid[i]
        i += 1
    end
    return newGrid
end


def copy2(grid)
    newGrid = []
    i = 0
    while i < grid.length
        newGrid[i] = copy1(grid[i])
        i += 1
    end
    return newGrid
end

def copy3(grid)
    newGrid = []
    i = 0
    while i < grid.length
        newGrid[i] = copy2(grid[i])
        i += 1
    end
    return newGrid
end

def copy4(grid)
    newGrid = []
    i = 0
    while i < grid.length
        newGrid[i] = copy3(grid[i])
        i += 1
    end
    return newGrid
end

def inside(a, b, c, d)
    if a < 0 || a == 20
        return false
    end
    if b < 0 || b == 20
        return false
    end
    if c < 0 || c == 20
        return false
    end
    if d < 0 || d == 20
        return false
    end
    return true
end

def countAround(grid, x, y, z, w)
    e = 0
    a = 0
    while a < 3
        b = 0
        while b < 3
            c = 0
            while c < 3
                d = 0
                while d < 3
                    if a != 1 || b != 1 || c != 1 || d != 1
                        if inside(x - 1 + a, y - 1 + b, z - 1 + c, w - 1 + d)
                            if grid[x - 1 + a][y - 1 + b][z - 1 + c][w - 1 + d] == "#"
                                e += 1
                            end
                        end
                    end
                    d += 1
                end
                c += 1
            end
            b += 1
        end
        a += 1
    end
    return e
end

def updateGrid(grid)
    newGrid = copy4(grid)
    x = 0
    while x < 20
        y = 0
        while y < 20
            z = 0
            while z < 20
                w = 0
                while w < 20
                    countAround = countAround(grid, x, y, z, w)
                    if grid[x][y][z][w] == "."
                        if countAround == 3
                            newGrid[x][y][z][w] = "#"
                        end
                    else
                        if countAround == 2 || countAround == 3
                            newGrid[x][y][z][w] = "#"
                        else
                            newGrid[x][y][z][w] = "."
                        end
                    end
                    w += 1
                end
                z += 1
            end
            y += 1
        end
        x += 1
    end
    return newGrid
end

i = 0
while i < 6
    puts "New layer-------------------------------------------------------------------------------------------------------"
    n = -1
    for g in grid do
        n += 1
        if n != 10
            next
        end
        puts "\n---\n"
        for g2 in g do
            puts "\n"
            for g3 in g2 do
                p g3
            end
        end
    end
    gets
    grid = copy4(updateGrid(grid))
    i += 1
end

c = 0
x = 0
while x < 20
    y = 0
    while y < 20
        z = 0
        while z < 20
            w = 0
            while w < 20
                if grid[x][y][z][w] == "#"
                    c += 1
                end
                w += 1
            end
            z += 1
        end
        y += 1
    end
    x += 1
end
puts c