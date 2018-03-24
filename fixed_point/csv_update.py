import csv

outs = []
with open("hasil.csv") as f:
# lis=[line.split() for line in f]        # create a list of lists
 reader = csv.reader(f)
 for row in reader:
# for i,x in enumerate(lis):              #print the list items 
#   print(x[1])
#   print(type(x))
  outs.append(row)

print(outs[0][1])
header = ['nomor fungsi fx', 'nomor gx', 'initial x', 'jumlah iterasi', 'tolerance', 'solusi ditemukan', 'error', 'elapsed time']
with open('hasil_dengan_label.csv', 'w') as csvfile:
 w = csv.writer(csvfile)
 w.writerow(header)
 for o in outs:
  w.writerow(o)

