import os
import math
from numpy import *

directoryPath = "C:\Program Files\AmiBroker\Test Data"
masterStockFilename = 'quotes.csv'
SENTINEL = '$NAME '

def list_files(directoryPath):
    filenames = os.listdir(directoryPath)
    print len(filenames), 'files found'
    return filenames

def process_file(filePath, data):
    with open(filePath) as f:            
            lines = f.readlines()
            
            #filters stocks with missing data
            if len(lines) != 253: return 

            #get the stock name
            name = '' 
            try:                
                index = lines[0].index(SENTINEL)
                name += lines[0][index + len(SENTINEL):]
            except:
                name +=  "'" + SENTINEL + "'" + " is missing from " + filePath +'\n'            
            name = name.strip()
            
            if data == []: #special case for no data
                data.append('')
                for i in range(1, len(lines)):
                    line = lines[i]
                    line = line.strip()
                    line = line.split(',')
                    
                    data.append(line[0])
            
            data[0] += ',' + name
            for i in range(1, len(lines)):
                line = lines[i]
                line = line.strip()
                line = line.split(',')
                
                data[i] += ',' + line[-1] #concat the close value
    
def process(filenames):
    print 'processing files...'
    data = []
    for filename in filenames: #creates a path from filename
        filePath = os.path.join(directoryPath, filename)
        process_file(filePath, data)

    return data

def write_list_to_file(lst, filename):
    result = ''
    for elem in lst:
        result += elem + '\n'

    #write to file                
    file = open(filename, 'w+')
    file.write(result)
    file.close()
    print "write complete"

def GetSharpe(filenames):
    data = process(filenames)                        
    #convert vect to string 
    write_list_to_file(data, 'results.csv')
    

def create_vect():
    result = []
    with open(masterStockFilename) as f:
        lines = f.readlines()
        for line in lines:
            lst = line.split(',')
            result.append([])
            result[-1] = lst
    return result

# Calculate mean of the values  
def calc_mean(values):
        size = len(values)  
        sum = 0.0  
        for n in range(0, size):  
                sum += values[n]  
        return sum / size;
    
def calc_mean_stDev_sharpe(values):
        size = len(values)
        mean = calc_mean(values)
        sum = 0.0  
        for n in range(0, size):  
                sum += math.sqrt((values[n] - mean)**2)
        sd = math.sqrt((1.0/(size-1))*(sum/size))
        sharpe = calc_sharpe(mean, sd)
        return mean, sd, sharpe

def list_daily_return(quotes):
    dailyReturns = []
    for i in range(len(quotes)-2, 0, -1):
        dailyReturn = quotes[i] / quotes[i+1] - 1
        dailyReturns.append(dailyReturn)

    return dailyReturns

def calc_sharpe(avgDailyReturn, stDev):
    return math.sqrt(252) * (avgDailyReturn / stDev)    

##def add_entry(annReturn, stock, master, filtered):
##    data = {'annReturn' = annReturn}
##    #calculated stdev
##    quotes = [] 
##    for date in range(1, len(master)):
##        quotes.append(master[date][stock])
##    sd = calc_stDev(quotes)
##    avgDailyReturn = calc_avgDailyReturn(quotes)
##
##    data["stdev"] = sd
##    data["avgDailyReturn"] = avgDailyReturn
##
##    master[stock] = data
    
def insert_sort(entry, filtered, rank):
    empty = {}
    if filtered == []:
        filtered.insert(0, entry)
    else:
        for i in range(len(filtered)):
            if entry['annReturn']  > filtered[i]['annReturn']:
                if len(filtered) > rank - 1:
                    filtered.pop()
                filtered.insert(i, entry)
                return
        if len(filtered) < rank:
            filtered.append(entry)

def extract_quotes(stock, master):
    result = []
    for i in range(1, len(master)):
        result.append(float(master[i][stock]))
    return result

def filter_stocks(rank):
    master = create_vect()
    filtered = []
    minAnnReturn = 0
    print len(master[0])
    for stockIndex in range(1, len(master[0])):
        quotes = extract_quotes(stockIndex, master)
        annReturn = quotes[0] / quotes[-1] - 1
        avgDailyRet, sd, sharpe = calc_mean_stDev_sharpe(list_daily_return(quotes))

        name = master[0][stockIndex]
        symbol = name.strip()
        entry = {'symbol':symbol, 'annReturn':annReturn, 'sharpe':sharpe, 'avgDailyRet':avgDailyRet, 'stdev':sd}
        #print name, annReturn, minAnnReturn
        if annReturn > minAnnReturn or len(filtered) < rank:
            #print True, name, annReturn
            insert_sort(entry, filtered, rank)
            minAnnReturn = filtered[-1]['annReturn']

    s = ''
    for stock in filtered:
        if len(s) > 0:
            s += ','
        s += stock['symbol']
        print stock['annReturn'], stock['avgDailyRet'], stock['stdev'], stock['sharpe']

    result = [s]
    write_list_to_file(result,'top' + str(rank) + '.csv')

def test():
    filenames = list_files(directoryPath)
    GetSharpe(filenames)    

filter_stocks(100)
