input = File.open("in.txt").readlines
adapters = input.map(&:to_i)

start = Time.now()

adapters.sort!
adapters.insert(0, 0)
adapters << adapters[-1] + 3

mem = []

def solve(index, max, adapters, mem)
    if adapters[index] == max
        return 1
    end

    if mem[index] != nil
        return mem[index]
    end

    count = 0
    next3 = adapters[index + 1..index + 3]
    i = 1
    while i <= next3.length
        if next3[i - 1] == nil
            i += 1
            next
        end
        if next3[i - 1] <= adapters[index] + 3
            count += solve(index + i, max, adapters, mem)
        end
        i += 1
    end
    mem[index] = count
    return count
end

stop = Time.now()
puts "Dif: #{stop - start}s"

puts solve(0, adapters[-1], adapters, mem)