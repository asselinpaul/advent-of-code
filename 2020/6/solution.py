lines = open("input.txt").read().split("\n\n")

uniques = []

for line in lines:
    line = line.replace("\n", "")
    unique_chars = "".join(set(line))
    uniques.append(len(unique_chars))

print(sum(uniques))
