import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

curkey = "A"
numeros = []

for line in sys.stdin:
    key, val = line.split(";")
    val = int(val)

    if key == curkey:
        numeros.append(val)
    else:
        numeros.sort()
        numeros1 = ''.join(str(e)+"," for e in numeros)
        sys.stdout.write("{}\t{}\n".format(curkey,numeros1[:-1]))
        curkey = key
        numeros = []

numeros.sort()
numeros1 = ''.join(str(e)+"," for e in numeros)
sys.stdout.write("{}\t{}\n".format(curkey,numeros1[:-1]))