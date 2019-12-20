import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
for line in sys.stdin:
    line = line.strip()
    line = line.split(' ')
    data1 = line[0]
    data2 = line[3]
    data3 = int(line[6])
    sys.stdout.write("{},{},{}\n".format(data1,data2,data3))