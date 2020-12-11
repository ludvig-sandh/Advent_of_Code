grid = File.open("in.txt").readlines.map(&:chomp)
$lastS = 0

def countSeatsAround(grid, r, c)
    count = 0
    dr = [-1, 0, 1, 1, 1, 0, -1, -1]
    dc = [-1, -1, -1, 0, 1, 1, 1, 0]
    i = 0
    while i < dr.length
        found = false
        cr = r
        cc = c
        while !found
            cr += dr[i]
            cc += dc[i]
            if cr >= grid.length || cr < 0
                break
            end
            if cc >= grid[0].length || cc < 0
                break
            end
            if grid[cr][cc] == "#"
                found = true
                break
            end
            if grid[cr][cc] == "L"
                break
            end
        end
        if found
            count += 1
        end
        i += 1
    end
    return count
end

def countTotalSeats(grid)
    count = 0
    for row in grid do
        i = 0
        while i < row.length
            if row[i] == "#"
                count += 1
            end
            i += 1
        end
    end
    return count
end

def copyGrid(grid)
    newGrid = []
    i = 0
    while i < grid.length
        add = ""
        j = 0
        while j < grid[0].length
            add += grid[i][j]
            j += 1
        end
        newGrid << add
    i += 1
    end
    return newGrid
end

def round(grid, lastSeatsTaken)
    newGrid = copyGrid(grid)
    r = 0
    while r < grid.length
        c = 0
        while c < grid[r].length
            if grid[r][c] == "L"
                if countSeatsAround(grid, r, c) == 0
                    newGrid[r][c] = "#"
                end
            elsif grid[r][c] == "#"
                if countSeatsAround(grid, r, c) >= 5
                    newGrid[r][c] = "L"
                end
            end
            c += 1
        end
        r += 1
    end
    if countTotalSeats(newGrid) == lastSeatsTaken
        puts lastSeatsTaken
        exit
    end
    $lastS = countTotalSeats(newGrid)
    return newGrid
end

while true
    grid = round(grid, $lastS)
end