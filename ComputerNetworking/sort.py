with open('ogrenciList.txt', encoding='utf-8') as f:
    lines = f.readlines()
f.close()
lines.sort()
counter = 0
w = open('nameListSorted.txt', 'w', encoding='utf-8')
while counter < 45:
    w.write(lines[counter])
    counter += 1

f.close()
