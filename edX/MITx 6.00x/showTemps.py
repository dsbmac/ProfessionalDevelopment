# 6.00x L12 P3: reading file and showing data

import pylab
    
def showPlot(filename, title, x_label, y_label):
    """
    What information does the plot produced by this function tell you?
    """
    highs = []
    lows = []
    day = []
    
    with open(filename, 'r') as f:
        lines = f.readlines()
        for line in lines:            
            data = line.strip().split(' ')
            if data[0].isdigit():                
                day.append(data[0])
                highs.append(data[1])
                lows.append(data[2])                               
    
    pylab.plot(day, highs)
    pylab.plot(day, lows)
    pylab.title(title)
    pylab.legend(('High', 'Low'))
    pylab.xlabel(x_label)
    pylab.ylabel(y_label)
    pylab.show()
    
showPlot('julyTemps.txt', 'Boston July Temperatures', 'Day', 'Temperature')
