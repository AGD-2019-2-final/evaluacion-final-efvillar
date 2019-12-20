import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
curkey = None
total = 0

for line in sys.stdin:

    key, val = line.split("\t")
    val = int(val)
    tipo = key

    if key == curkey:
        ##
        ## No se ha cambiado de clave. Aca se
        ## acumulan los valores para la misma clave.
        ##
        if val > total:
            total = val
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
            sys.stdout.write("{}\t{}\n".format(curkey, total))

        curkey = key
        total = val

sys.stdout.write("{}\t{}\n".format(curkey, total))