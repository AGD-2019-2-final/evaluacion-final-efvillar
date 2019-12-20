import sys

##  >>> Escriba el codigo del mapper a partir de este punto <<<

curkey = "A"
total = 0
suma = 0 

for line in sys.stdin:   

    key, val = line.split(",")
    val = float(val)

    if key == curkey:
        
        total += 1
        suma += val
        prom = suma / total

    else:

        sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma, prom))
        total=1
        suma=val
        prom=suma/total
        curkey=key       



sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma, prom))