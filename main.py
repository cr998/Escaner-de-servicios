# -*- coding: utf-8 -*-
import socket
import MySQLdb
import random
import threading

from config import *
from respuesta import *

def run_query(query=''):
   datos = [DB_HOST, DB_USER, DB_PASS, DB_NAME]

   conn = MySQLdb.connect(*datos)
   cursor = conn.cursor()
   cursor.execute(query)

   if query.upper().startswith('SELECT'):
      data = cursor.fetchall()
   else:
      conn.commit()
      data = None

   cursor.close()
   conn.close()

   return data

def escanear(ip, puerto):
   try:
      socket.setdefaulttimeout(2)
      s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
      s.connect((ip, puerto))
      s.send(enviar(puerto))
      banner = s.recv(2048)
      s.close()
      return banner.decode('ascii')
   except:
      s.close()
      return "Error"

def bucle():
   while (1):
      n1 = random.randint(0,255)
      n2 = random.randint(0,255)
      n3 = random.randint(0,255)
      n4 = random.randint(0,255)

      while ((n1 == 10) or (n1 == 127 and n2 == 0 and n3 == 0 and n4 == 1) or (n1 == 172 and (16 <= n2 >= 31)) or (n1 == 192 and n2 == 168)):
         n1 = random.randint(0,255)
         n2 = random.randint(0,255)
         n3 = random.randint(0,255)
         n4 = random.randint(0,255)
        
      ip = str(n1) + "." + str(n2) + "." + str(n3) + "." + str(n4)
      
      puerto = random.choice(puertos)
      banner = escanear(ip, puerto)

      try:
         if (banner != "Error"):
            if not banner:
               banner = "Puerto abierto"
            query = "INSERT INTO datos (ip, puerto, banner) VALUES ('%s','%s','%s')" % (ip, puerto, banner)
            run_query(query)
            print ip + ":" + str(puerto)
      except:
         print "SQL error"

def multihilo(hilos):
   threads = list()
   for i in range(hilos):
      t = threading.Thread(target=bucle)
      threads.append(t)
      t.start()

def main():
   try:
      multihilo(hilos)
   except (KeyboardInterrupt, SystemExit):
      print "Has cerrado el programa"
      raise

main()
