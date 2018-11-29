import exrex # instalar con:  pip install exrex
import random
from datetime import date, timedelta, datetime
from math import ceil
import csv


num_clientes = 10000

num_pedidos = num_clientes*3
size = num_clientes*4 # se generan num_clientes*4 Tiene

productos_file = "Productos/Productos.csv"
catalogo_file = "Catalogo.csv"
write_to = "Tiene_{}.csv".format(num_clientes)


with open(catalogo_file, 'r', newline='') as readfile:
    reader = csv.reader(readfile, delimiter=',')
    next(reader)
    tiendas_prod = [[], [], [], [], []]

    for line in reader:
        tienda_id = line[1]
        producto_id = line[0]
        tiendas_prod[int(tienda_id)-1].append(producto_id)

with open("dump.csv", 'w', newline='') as writefile:
    writer = csv.writer(writefile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    no_recibo = 1
    rand = False

    previos = set()

    for i in range(size):
        str_no_recibo = str(no_recibo).zfill(10)
        rand_tienda_id = random.randint(0,4)
        rand_producto_id = random.choice(tiendas_prod[int(rand_tienda_id)])
        rand_cantidad = random.randint(1, 10)
        rand_tienda_id +=1


        while (rand_producto_id, int(str_no_recibo)) in previos:
            rand_producto_id = random.choice(tiendas_prod[int(rand_tienda_id-1)])

        previos.add((rand_tienda_id, rand_producto_id, int(str_no_recibo)))

        writer.writerow([str_no_recibo, rand_producto_id, rand_tienda_id, rand_cantidad])

        if (no_recibo)<num_pedidos and not rand:
            no_recibo+=1
        else:
            no_recibo = random.randint(1, num_pedidos-1)
            rand = True

        if not i%1000: print(i)

with open("dump.csv", 'r', newline='') as unorderedfile:
    with open(write_to, 'w', newline='') as orderedfile:
        reader = csv.reader(unorderedfile, delimiter=',')
        writer = csv.writer(orderedfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

        writer.writerow(["no_recibo", "producto_id", "tienda_id", "cantidad"])
        
        lines = unorderedfile.readlines()
        lines.sort()
        orderedfile.writelines(lines)

        print("Sort done! :)")



