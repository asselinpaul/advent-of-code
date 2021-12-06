import strutils
import sequtils
import parseutils

proc toString(str: seq[char]): string =
  result = newStringOfCap(len(str))
  for ch in str:
    add(result, ch)

let contents = readFile("input.txt") 
let lines = contents.splitLines()

var acc = newSeq[int](12)

for idx, val in lines.pairs:
    for n in 0 .. 12-1:
        acc[n] += parseInt($val[n])

var output = map(acc, proc(x: int): char = (if x>int(len(lines)/2): '1' else: '0'))
var output_reversed = map(acc, proc(x: int): char = (if x>int(len(lines)/2): '0' else: '1'))
var gamma, epsilon: int
discard parseBin(toString(output), gamma)
discard parseBin(toString(output_reversed), epsilon)
echo gamma * epsilon