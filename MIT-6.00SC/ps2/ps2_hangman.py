# 6.00 Problem Set 3
# 
# Hangman
#


# -----------------------------------
# Helper code
# (you don't need to understand this helper code)
import random
import string

WORDLIST_FILENAME = "words.txt"

def load_words():
    """
    Returns a list of valid words. Words are strings of lowercase letters.
    
    Depending on the size of the word list, this function may
    take a while to finish.
    """
    print "Loading word list from file..."
    # inFile: file
    inFile = open(WORDLIST_FILENAME, 'r', 0)
    # line: string
    line = inFile.readline()
    # wordlist: list of strings
    wordlist = string.split(line)
    print "  ", len(wordlist), "words loaded."
    return wordlist

def choose_word(wordlist):
    """
    wordlist (list): list of words (strings)

    Returns a word from wordlist at random
    """
    return random.choice(wordlist)

# end of helper code
# -----------------------------------

# actually load the dictionary of words and point to it with 
# the wordlist variable so that it can be accessed from anywhere
# in the program
wordlist = load_words()

# your code begins here!
#returns the initial greeting and the word chosen for the game and the number of guess allowed
def start_game():
    # select a random word
    answer = choose_word(wordlist)
    ltrsLong = "I am thinking of a word that is " + str(len(answer)) + " letters long."
    print ""
    print ltrsLong

    return answer

def update_correctSoFar(correctSoFar, guess, answer):
    out = []
    for i, c in enumerate(answer):
        if c == guess:
            out.append(c)
        else:
            out.append(correctSoFar[i])
        #print i, c
        #print out
    return out
    
def hangman():


    

    #updates the status display after each turn return nothing
    # setup the display
        # number of letters in the word
        # letters guessed
        # remaining guesses
        # if over reveal word
    def update_display(guessedLtrs, ltrsCorrect, guessRemain):
        guessedLtrsStr = ''
        ansProgressDisplay = []
        
        for i in correctSoFar:
            ansProgressDisplay.append(i)
            if correctSoFar.index(i) < len(correctSoFar) - 1:
                ansProgressDisplay.append(" ")
            
        for i in guessedLtrs:
            guessedLtrsStr = guessedLtrsStr + (min(guessedLtrs.index(i),1) * ", ") + i
 

        print ""
        print ''.join(ansProgressDisplay)
        print ""
        print "Letters guessed: " + guessedLtrsStr
        print "You have " + str(guessRemain) + " guesses left."
        print ""

    
    #check the guess and return correct letters
        #traverse the answer to find the guess
        #check it is also not in the already guessed
    def is_guess_correct(guess, answer):        
        return answer.find(guess) > -1

# game settings
    guessAllowed = 10
    guessPrompt = "Guess a letter: "
    greeting = "Can you save the hanging man?" 

### start game
    user = ""
    print greeting
    while user != "n" and user != 'N' and user != "no" and user != "No":
        answer = start_game()
        correctSoFar = []
        print answer
        for i in range(len(answer)):
            correctSoFar.append("_")
        guessRemain = guessAllowed;
        guessedLtrs = []

    # display the number of letters in the word
        update_display(guessedLtrs, correctSoFar, guessRemain)    

# insert loop here        
        while guessRemain > 0 and ''.join(correctSoFar) != answer:
            guess = str(raw_input(guessPrompt))     # prompt user for a guess
        
        # check guess
            # check if letter is good
                # if no --> check turns
            # check if word is complete
            if is_guess_correct(guess, answer):
                print guess + " is correct!"
                correctSoFar = update_correctSoFar(correctSoFar, guess, answer)
            else:
                print guess + " is incorrect."
                guessRemain -=1

            if guess not in guessedLtrs:
                guessedLtrs.append(guess)

            update_display(guessedLtrs, correctSoFar, guessRemain)

        if ''.join(correctSoFar) == answer:
            print "Congratulations, you guessed the word!"

        user = str(raw_input( "Try again? "))

    print "Thanks for playing!"

def draw_hangman(guessRemain):

    print "  _____"
    print " |/    |"
    if guessRemain > 6:
        print " |"        
    else:
        print " |    (_)"


    print " |    \|/ "
    print " |     | "
    print " |    / \ "
    print " |"
    print "_|____"
   

hangman()
