import re


def parse_color_string(s):
    pattern = r"(\d+)\s+(\w+)"
    matches = re.findall(pattern, s)
    return {color: int(number) for number, color in matches}


lines = open("input.txt").read().split("\n")

acc = 0

for line in lines:
    game_number = int(line.split(": ")[0].split(" ")[1])
    revealed = map(parse_color_string, line.split(": ")[1].split(";"))
    max_per_color = {}
    for color_dict in revealed:
        for color, value in color_dict.items():
            if color not in max_per_color or value > max_per_color[color]:
                max_per_color[color] = value
    acc += (
        max_per_color.get("red", 1)
        * max_per_color.get("green", 1)
        * max_per_color.get("blue", 1)
    )
    # print(
    #     line,
    #     "max_per_color: ",
    #     max_per_color,
    #     "product:",
    #     max_per_color.get("red", 1)
    #     * max_per_color.get("green", 1)
    #     * max_per_color.get("blue", 1),
    # )

print(acc)
