input = File.open("in.txt").readlines.map(&:chomp).map(&:to_i)
last25 = []
i = 0
while i < 25
    last25[i] = input[i]
    i += 1
end

def checkIfPair(last25, sum)
    i = 0
    while i < last25.length
        j = 0
        while j < last25.length
            if j != i
                if last25[i] != last25[j]
                    if last25[i] + last25[j] == sum
                        return true
                    end
                end
            end
            j += 1
        end
        i += 1
    end
    return false
end

i = 25
num = 0
while i < input.length
    if !checkIfPair(last25, input[i])
        num = input[i]
        break
    end
    last25.shift()
    last25 << input[i]
    i += 1
end

def getSum(arr)
    i = 0
    sum = 0
    while i < arr.length
        sum += arr[i]
        i += 1
    end
    return sum
end

i = 0
j = 0
while true
    split = input[i..j]
    sum = getSum(split)
    if sum == num
        puts num
        puts split.min + split.max
        exit
    elsif sum < num
        j += 1
    else
        i += 1
        j = i
    end
end