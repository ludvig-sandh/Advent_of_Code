input = File.open("help.txt").read.split("\n")
height = input.length
width = input[0].length
map = []
i = 0
while i < input.length
    map[i] = input[i].split("")
    i += 1
end


allSlopes = [[1, 1], [1, 3], [1, 5], [1, 7], [2, 1]]
i = 0
treesFound = []
while i < allSlopes.length
    slope = allSlopes[i]
    j = 0
    trees = 0
    start = [0, 0]
    
    print slope
    while j < height
        start[0] += slope[0]
        start[1] += slope[1]
        if start[1] >= width
            start[1] -= width
        end
        if start[0] >= height
            break
        end
        if map[start[0]][start[1]] == "#"
            trees += 1
        end
        j += 1
    end
    treesFound[i] = trees
    i += 1
end

i = 1
product = treesFound[0]
while i < treesFound.length
    product *= treesFound[i]
    i += 1
end
puts product