lines = open("input.txt").read().strip().split("\n")
lines = [x for x in lines]

class Num: 
    def __init__(self, a): 
        self.a = a
  
    def __add__(self, o): 
        return Num(self.a + o.a) 

    # overload - for the multiplication step since can't change operator precedence
    def __sub__(self, o): 
        return Num(self.a * o.a) 


acc = 0

for line in lines:
    line = line.replace("*", "-")
    nums = "0123456789"
    for num in nums:
        line = line.replace(num, "Num("+str(num)+")")
    acc += eval(line).a

print(acc)
