#balance: the outstanding balance on the credit card
#annualInterestRate: annual interest rate as a decimal

def balanceRemaining(balance, annualInterestRate, minMonthlyPayment):
    monthlyInterestRate = annualInterestRate / 12
    totalPaid, totalPaid2 = 0,0
    updatedBalance = balance
    
    for i in range(1, 13):        
        updatedBalance = (updatedBalance - minMonthlyPayment) * (1 + monthlyInterestRate)
        interest =  (updatedBalance - minMonthlyPayment) * monthlyInterestRate
        totalPaid += minMonthlyPayment
    
    return round (updatedBalance,2)

def payDebt(balance, annualInterestRate):
    ans = 0
    balanceRem = balance
    while balanceRem > 0:
        ans += 10
        balanceRem = balanceRemaining(balance, annualInterestRate, ans)        
    print 'Lowest Payment: ', ans

payDebt(balance, annualInterestRate)


