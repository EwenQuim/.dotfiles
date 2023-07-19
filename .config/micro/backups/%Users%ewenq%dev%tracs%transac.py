file1 = open('couples.txt', 'r')
Lines = file1.readlines()

count = 0
# Strips the newline character
explored = []


def users_gives_to(a): 
    froms = []
    for line in Lines:
        fro, to = line.split(";") 
        if to == a:
            froms.append(fro)

