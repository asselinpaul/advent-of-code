with open("input.txt") as f:
    lines = [line.rstrip() for line in f]

slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
tree_count = 1
line_length = len(lines[0])

for slope in slopes:
    x, y = 0, 0
    count = 0
    while y < len(lines) - 1:
        x = (x + slope[0]) % line_length
        y = y + slope[1]
        if lines[y][x] == "#":
            count += 1
    tree_count = tree_count * count
    print(count)
print(tree_count)
