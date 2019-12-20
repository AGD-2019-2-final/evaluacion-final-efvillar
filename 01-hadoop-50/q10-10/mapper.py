import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
for line in sys.stdin:
    line = line.strip()
    line = line.split('\t')
    #print (line)
    data1 = line[0]
    data2 = line[1].split(',')
    for i in range(len(data2)):
        sys.stdout.write("{};{}\n".format(data2[i],int(data1)))       