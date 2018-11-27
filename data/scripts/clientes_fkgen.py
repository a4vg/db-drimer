import exrex # instalar con:  pip install exrex
import random
from datetime import date, timedelta, datetime
import csv


num_clientes = 100000

size = num_clientes*3 # se generan num_clientes*3 pedidos
read_from = "{}/cliente_{}.csv".format(num_clientes, num_clientes)
write_to = "pedidos_{}.csv".format(num_clientes)

with open(read_from, 'r', newline='') as readfile:
    with open("dump.csv", 'w', newline='') as writefile:
        reader = csv.reader(readfile, delimiter=',')
        writer = csv.writer(writefile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

        next(readfile) # skip header
        counter = 0

        # Copiar todos los DNIs de Cliente a Pedido
        # (garantiza que todos los clientes tengan al menos un pedido)
        for line in reader:
            writer.writerow([line[3]])
            counter+=1
            if counter%100==0: print(counter)
        size-=num_clientes

        # Elegir random DNIs de clientes para completar Pedido
        # (algunos clientes tienen mas de un pedido)
        readfile.seek(0) # go to first line
        next(readfile) # skip header
        
        while size:
            for line in reader:
                if bool(random.getrandbits(1)):
                   writer.writerow([line[3]])
                   size-=1
                   counter+=1

                if not size: break
                
                if counter%100==0: print(counter)

            readfile.seek(0)
        print("dump generated! :)")

# Shuffle DNI rows and add header
with open("dump.csv", 'r', newline='') as orderedfile:
    with open("clientesfk_" + write_to, 'w', newline='') as shuffledfile:
        shuffledfile.write("cliente_dni\n")

        lines = orderedfile.readlines()
        random.shuffle(lines)
        shuffledfile.writelines(lines)

        print("Shuffled done! :)")