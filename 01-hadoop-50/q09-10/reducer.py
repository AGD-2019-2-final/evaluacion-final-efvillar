import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
b=[]
for line in sys.stdin:
    key1, date, val = line.split(",")
    val = int(val)
    b.append((key1,date,val))
b.sort(key=lambda b: b[2])
b = b[0:6]

for item in b:
    sys.stdout.write("{}\t{}\t{}\n".format(item[0],item[1],item[2]))