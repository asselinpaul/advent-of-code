lines = open("input.txt").read().split("\n")

acc = 0

for line in lines:
    # print("input: ", line)
    line = (
        line.replace("nine", "n9e")
        .replace("eight", "e8t")
        .replace("seven", "s7n")
        .replace("six", "s6x")
        .replace("five", "f5e")
        .replace("four", "f4r")
        .replace("three", "t3e")
        .replace("two", "t2o")
        .replace("one", "o1e")
    )
    # print("processed: ", line)
    digits = "".join(filter(str.isdigit, line))
    # print(f"{digits=}", "\n")

    acc += int(digits[0] + digits[-1])

print(acc)
