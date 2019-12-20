import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
b=[]
for line in sys.stdin:
    key1, date, val = line.split(",")
    val = int(val)
    b.append((key1,date,val))
b.sort(key=lambda b: (b[0],b[2]))

for line in b:
    sys.stdout.write("{}\t{}\t{}\n".format(line[0],line[1],line[2]))
