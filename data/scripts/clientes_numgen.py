import exrex # instalar con:  pip install exrex
from datetime import date, timedelta, datetime
import csv

'''
--- Disclaimer ---
Este script no garantiza que no se generen duplicados
'''

size = 50000

ruc = "[1-2]0[1-9]{8}[1-9]"
dni = "[0-9]{8}"
tlf = "([2-6][1-9]{6}|9[1-9]{8})"


with open('data.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    writer.writerow(["ruc", "dni_natural", "dni_repr", "tlf_natural", "tlf_repr", "tlf_empresa"])
    writer.writerow(["dni"])
    for i in range(size):
        writer.writerow([exrex.getone(ruc),
                        exrex.getone(dni),
                        exrex.getone(dni)
                        exrex.getone(tlf),
                        exrex.getone(tlf),
                        exrex.getone(tlf)
                        ])
        if i%1000==0: print(i)