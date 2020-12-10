input = File.open("in.txt").readlines
count = -1
allBags = []
lastBags = ["shiny gold"]
lastLength = 0
while lastBags.length != lastLength
    le = lastBags.length
    i = 0
    while i < input.length
        row = input[i]
        sentence = row.split(" contain ")
        outBag = sentence[0]
        innerBags = sentence[1][0..-3].split(", ")
        j = 0
        while j < lastBags.length
            if outBag.include?(lastBags[j])
                lastBags.delete_at(j)
                count += 1
                k = 0
                while k < innerBags.length
                    bag = innerBags[k]
                    lim = bag.split()[0]
                    len = lim.length
                    lim = lim.to_i
                    type = bag[len + 1..-1]
                    l = 0
                    while l < lim
                        lastBags << type
                        l += 1
                    end
                    k += 1
                end
            end
            j += 1
        end
        i += 1
    end
    lastLength = le
end
print count