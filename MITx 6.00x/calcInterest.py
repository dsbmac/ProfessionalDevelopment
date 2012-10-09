#balance: the outstanding balance on the credit card
#annualInterestRate: annual interest rate as a decimal
#monthlyPaymentRate: minimum monthly payment rate as a decimal

def calcInterest(balance, annualInterestRate, monthlyPaymentRate):        
    
    monthlyInterestRate = annualInterestRate / 12
    totalPaid, totalPaid2 = 0,0
    updatedBalance = balance
    minMonthlyPayment = 0
    
    for i in range(1,13):
        minMonthlyPayment = monthlyPaymentRate * updatedBalance
        updatedBalance = (updatedBalance - minMonthlyPayment) * (1 + monthlyInterestRate)
        interest =  (updatedBalance - minMonthlyPayment) * monthlyInterestRate
        totalPaid += minMonthlyPayment

        print 'Month:', i
        print 'Minimum monthly payment:',  round(minMonthlyPayment, 2)
        print 'Remaining balance:', round (updatedBalance, 2)

    print 'Total paid: ', round (totalPaid, 2)
    print 'Remaining balance: ', round (updatedBalance,2)

balance = 3329 
annualInterestRate = 0.2
monthlyPaymentRate = 310.0 / balance

calcInterest(balance, annualInterestRate, monthlyPaymentRate)
