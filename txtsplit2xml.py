#!/usr/bin/env python3

import os


processed_dir = "Py_processed"
if not os.path.exists(processed_dir):
    os.mkdir(processed_dir)

#with open('Cosa-Catalog-2014-testpy.txt','r', encoding="utf8") as records:
records = open('Cosa-Catalogue-2015-test.txt','r', encoding="utf8")
newrecord = ''
start = 0
cntr = 1
os.chdir(processed_dir)
for x in records.read().split("\n"):
    if (x=='-----' or x=='----------'):
        if (start==1):
            #with open('processed_'+ str(cntr) + '.xml', 'w') as newfile:
            newfile = open('processed_'+ str(cntr) + '.xml', 'w')
            newfile.write(newrecord)
            newfile.close()
            print(newfile.name + " is Done!")
            newrecord = ''
            cntr += 1
                
        else:
            start = 1
            
    else:
        if (newrecord==''):
            newrecord = x
        else:
            newrecord = newrecord + "\n" + x


records.close()
