def bubble(lst):
    Flag = True
    print lst
    while Flag:
        Flag = False
        for i in range(len(lst)-1):
            if lst[i] > lst[i+1]:
                temp = lst[i+1]
                lst[i+1] = lst[i]
                lst[i] = temp
                Flag = True
        print lst 
    return lst

test = [11, 5, 3, 6, 9, 8]
print bubble(test)
