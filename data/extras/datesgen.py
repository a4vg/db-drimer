import exrex # instalar con:  pip install exrex
from datetime import date, timedelta
import random
import csv

num_clientes = 1000


size = int(num_clientes *3) # se generan num_clientes*3 pedidos
with open('dump.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    writer.writerow(["fecha"])

    counter = 0

    # Conseguir intervalos
    start = date(2010, 1, 1)
    end = date(2018, 1, 1)
    delta = end - start

    # Garantizar al menos una compra por dia
    for i in range(delta.days + 1):
        counter+=1
        writer.writerow([start + timedelta(i)])
        if not counter%1000: print(counter)

    # Rellenar el resto de fechas al azar
    size-=delta.days+1
    for i in range(size):
        counter+=1
        random_date = timedelta(days=random.randint(0, delta.days))
        random_date += start
        writer.writerow([random_date])
        if not counter%1000: print(counter)

