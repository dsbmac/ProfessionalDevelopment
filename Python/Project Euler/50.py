def is_prime(x):
    if x == 2:
        return True

    if x <= 1 or x % 2 == 0:
        return False
    
    for i in range(3,int(x**0.5) + 1, 2):
        if x % i == 0:
            return False
        
    return True

def prime_list(x, y):
    result = []
    for i in range(x,y):
        if is_prime(i):
            result.append(i)
    return result

def max_chain_prime():
    limit = 1000000
    p_list =  prime_list(1, limit)
    #print "p_list:", str(p_list)
    sum_list = []
    #print "sum_list initialization:", str(sum_list)
    max_chain = 0
    chain = []

    for i in range(len(p_list)-1):
        print
        print "*******************************"
        #print "i loop:", str(i)
        sum_list.insert(0, p_list[i])
        #print "sum_list (ins):", str(sum_list)
        prime_sum = sum(sum_list)        
        skip = True
        j = p_list.index(sum_list[-1])
        #print "j bookmark:", str(j) 
        while prime_sum < limit and j < len(p_list):
            #print
            #print "j loop:", str(j)
            link =[]
            if not skip:   
                sum_list.append(p_list[j])
                #print "sum_list:", str(sum_list)
                prime_sum = sum(sum_list)

            if prime_sum < limit and len(sum_list) > max_chain and is_prime(prime_sum):
                print "***THIS IS A MAX PRIME***"
                link.append(len(sum_list))
                link.append(prime_sum)
                link.append(tuple(sum_list))
                #print "link:", str(link)
                chain.append(link)
                #print "chain:", str(chain)
                max_chain = max(chain)[0]
                print "Max_chain:", max_chain  
            j +=1
            #print "j++:", str(j)
            skip = False

        if len(sum_list) < max_chain:
            print "len(sum_list) < max_chain"
            break
        elif len(sum_list) >= 3:            
            sum_list.pop(0)
            sum_list.pop(0)
            sum_list.pop(-1)
            #print "sum_list (popx3):", str(sum_list)
            skip = False
        else:
            break
        
    print            
    print "Final MAX_chain:", max(chain)[0]
    #print "chain:", chain            

max_chain_prime()
