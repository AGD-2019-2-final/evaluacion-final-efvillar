import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
curkey = None
maxi = -100000
mini = 100000

##
## cada linea de texto recibida es una
## entrada clave \tabulador valor
##
for line in sys.stdin:

    key, val = line.split(",")
    val = float(val)

    if key == curkey:

        if val < mini:
            mini = val 
        
        if val > maxi:
            maxi = val
    else:
        ##
        ## Se cambio de clave. Se reinicia el
        ## acumulador.
        ##
        if curkey is not None:
            ##
            ## una vez se han reducido todos los elementos
            ## con la misma clave se imprime el resultado en
            ## el flujo de salida
            ##
            sys.stdout.write("{}\t{}\t{}\n".format(curkey, maxi, mini))

        curkey = key
        mini = val
        maxi = val

sys.stdout.write("{}\t{}\t{}\n".format(curkey, maxi, mini))