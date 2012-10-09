#balance: the outstanding balance on the credit card
#annualInterestRate: annual interest rate as a decimal

def balanceRemaining(balance, annualInterestRate, minMonthlyPayment):
    monthlyInterestRate = annualInterestRate / 12
    updatedBalance = balance
    
    for i in range(1, 13):        
        updatedBalance = (updatedBalance - minMonthlyPayment) * (1 + monthlyInterestRate)
        interest =  (updatedBalance - minMonthlyPayment) * monthlyInterestRate
    
    return round (updatedBalance,2)

def payDebt(balance, annualInterestRate):
    epsilon = 0.06
    monthlyInterestRate = (annualInterestRate) / 12    
    low = balance / 12
    high = ( balance * (1 + monthlyInterestRate) ** 12 ) / 12
    ans = round ( (high + low) / 2 , 2)
    balanceRem = balanceRemaining(balance, annualInterestRate, ans)
    while abs (balanceRem ) > epsilon:
        #print ans, balanceRem
        if balanceRem > 0:
            low = ans
        else:
            high = ans
        ans = round ( (high + low) / 2 , 2)        
        balanceRem = balanceRemaining(balance, annualInterestRate, ans)        
    print 'Lowest Payment: ', ans

payDebt(balance, annualInterestRate)

