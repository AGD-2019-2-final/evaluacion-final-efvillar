
##! /usr/local/bin/python3
r"""Test cases
>>> run_answer() # doctest: +NORMALIZE_WHITESPACE
Boyer,BOYER,Boyer
Coffey,COFFEY,Coffey
Conway,CONWAY,Conway
Crane,CRANE,Crane
Diaz,DIAZ,Diaz
Estes,ESTES,Estes
Fry,FRY,Fry
Garrett,GARRETT,Garrett
Guy,GUY,Guy
Hamilton,HAMILTON,Hamilton
Holcomb,HOLCOMB,Holcomb
Jarvis,JARVIS,Jarvis
Kinney,KINNEY,Kinney
Klein,KLEIN,Klein
Knight,KNIGHT,Knight
Noel,NOEL,Noel
Sexton,SEXTON,Sexton
Silva,SILVA,Silva
<BLANKLINE>

"""
import doctest
import subprocess
import os

def run_answer():
    '''Codigo especifico para ejecutar la respuesta'''
    #----------------------------------------------------------------------------------------------
    # Ejecuta el código del estudiante
    #----------------------------------------------------------------------------------------------
    result = os.popen("pig -execute 'run question.pig'").read()
    result = os.popen("cat output/*").read()
    print(result)

#--------------------------------------------------------------------------------------------------
# Grader (generic)
#--------------------------------------------------------------------------------------------------
subprocess.run(['rm', '-f', '_SUCCESS']) # borra el flag de exito de la corrida
RESULT = doctest.testmod()               # ejecuta el doctest
FAIL, _ = RESULT                         # fail, total
if FAIL == 0:                            # grading
    open('_SUCCESS', 'a').close()        #
else:
    print('\n')
#--------------------------------------------------------------------------------------------------
