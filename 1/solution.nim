import strutils
import sequtils

let contents = readFile("input.txt")
let str_numbers = contents.splitLines()
let numbers = map(str_numbers, proc(x: string): int = parseInt(x))

var acc = 0

for idx, _ in numbers.pairs:
    if idx == 0: continue
    if numbers[idx] > numbers[idx-1]:
        acc += 1

echo acc
