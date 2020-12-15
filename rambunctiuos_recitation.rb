startNums = File.open("in.txt").read.chomp.split(",").map(&:to_i)

saidNums = {}
lastNumSpoken = 0
i = 0
while i < 30000000
    if startNums.length != 0
        if saidNums[startNums[0]] == nil
            saidNums[startNums[0]] = []
        end
        saidNums[startNums[0]] << i
        lastNumSpoken = startNums.shift
    else
        last = lastNumSpoken
        if saidNums[last][-2] == nil
            saidNums[0] << i
            lastNumSpoken = 0
        else
            lastSeen = saidNums[last][-2]
            if saidNums[i - lastSeen - 1] == nil
                saidNums[i - lastSeen - 1] = []
            end
            saidNums[i - lastSeen - 1] << i
            lastNumSpoken = i - lastSeen - 1
        end
    end
    i += 1
end

puts lastNumSpoken