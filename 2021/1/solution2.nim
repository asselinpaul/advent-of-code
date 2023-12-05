import strutils
import sequtils

let contents = readFile("input.txt")
let str_numbers = contents.splitLines()
let numbers = map(str_numbers, proc(x: string): int = parseInt(x))

var acc = 0

for idx, _ in numbers.pairs:
    if idx in [0, 1, len(numbers), len(numbers)-1]: continue
    if numbers[idx-2] + numbers[idx-1] + numbers[idx] < numbers[idx-1] +
            numbers[idx] + numbers[idx+1]:
        acc += 1

echo acc
