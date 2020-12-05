input = File.open("help.txt").readlines
nums = input.map(&:to_i)
i = 0
while i < nums.length
    j = 0
    while j < nums.length
        k = 0
        while k < nums.length
            if i != j && j != k && k != i
                if nums[i] + nums[j] + nums[k] == 2020
                    puts nums[i] * nums[j] * nums[k]
                    exit
                end
            end
            k += 1
        end
        j += 1
    end
    i += 1
end