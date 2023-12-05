lines = open("input.txt").read().split("\n")

acc = 0

for line in lines:
    digits = "".join(filter(str.isdigit, line))
    acc += int(digits[0] + digits[-1])

print(acc)
