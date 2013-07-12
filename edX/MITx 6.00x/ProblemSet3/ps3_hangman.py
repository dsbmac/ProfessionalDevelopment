# 6.00 Problem Set 3
# 
# Hangman game
#

# -----------------------------------
# Helper code
# You don't need to understand this helper code,
# but you will have to know how to use the functions
# (so be sure to read the docstrings!)

import random
import string

WORDLIST_FILENAME = "words.txt"

def loadWords():
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

def chooseWord(wordlist):
    """
    wordlist (list): list of words (strings)

    Returns a word from wordlist at random
    """
    return random.choice(wordlist)

# end of helper code
# -----------------------------------

# Load the list of words into the variable wordlist
# so that it can be accessed from anywhere in the program
wordlist = loadWords()

def isWordGuessed(secretWord, lettersGuessed):
    '''
    secretWord: string, the word the user is guessing
    lettersGuessed: list, what letters have been guessed so far
    returns: boolean, True if all the letters of secretWord are in lettersGuessed;
      False otherwise
    '''
    # FILL IN YOUR CODE HERE...
    for char in secretWord:
        if char not in lettersGuessed:
            return False
    return True


def getGuessedWord(secretWord, lettersGuessed):
    '''
    secretWord: string, the word the user is guessing
    lettersGuessed: list, what letters have been guessed so far
    returns: string, comprised of letters and underscores that represents
      what letters in secretWord have been guessed so far.
    '''
    # FILL IN YOUR CODE HERE...
    result = ''
    for char in secretWord:
        if char in lettersGuessed:
            result += char
        else:
            result += '_'
        result += ' '
    return result

def getAvailableLetters(lettersGuessed):
    '''
    lettersGuessed: list, what letters have been guessed so far
    returns: string, comprised of letters that represents what letters have not
      yet been guessed.
    '''
    # FILL IN YOUR CODE HERE...
    result = ''
    for char in string.ascii_lowercase:
        if char not in lettersGuessed:
            result += char
    return result
        
    
mistakesMade = 0
def hangman(secretWord):
    '''
    secretWord: string, the secret word to guess.

    Starts up an interactive game of Hangman.

    * At the start of the game, let the user know how many 
      letters the secretWord contains.

    * Ask the user to supply one guess (i.e. letter) per round.

    * The user should receive feedback immediately after each guess 
      about whether their guess appears in the computer's word.

    * After each round, you should also display to the user the 
      partially guessed word so far, as well as letters that the 
      user has not yet guessed.

    Follows the other limitations detailed in the problem write-up.
    '''
    # FILL IN YOUR CODE HERE...
    global mistakesMade #counts errors
    guessesAllowed = 8
    lettersGuessed = [] #tracks guessed letters
    
    #begin game
    print "Welcome to the game, Hangman!"    
    print "I'm thinking of a word that is", len(secretWord), "letters long."
    
    play(secretWord, guessesAllowed, lettersGuessed) #play loop
    endGame(secretWord, lettersGuessed)
    
    
def endGame(secretWord, lettersGuessed):
    if isWordGuessed(secretWord, lettersGuessed):
        salutation = "Congratulations, you won!"
    else:
        salutation = "Sorry, you ran out of guesses. The word was " + secretWord + "."
    print "-----------"
    print salutation    

def play(secretWord, guessesAllowed, lettersGuessed):
     while mistakesMade < guessesAllowed and not isWordGuessed(secretWord, lettersGuessed):
        print "-----------"
        print "You have", guessesAllowed - mistakesMade, "guesses left"
        availableLetters = getAvailableLetters(lettersGuessed)
        print "Available letters:", availableLetters
        guessPrompt =  "Please guess a letter: "
        guess = raw_input(guessPrompt).lower()    # prompt user for a guess
        reply = checkGuess(secretWord, guess, lettersGuessed)
        print reply, ':', getGuessedWord(secretWord, lettersGuessed)
        
def checkGuess(secretWord, guess, lettersGuessed):
    global mistakesMade
    if guess in lettersGuessed:
        return "Oops! You've already guessed that letter:"
    elif guess in secretWord:
        reply = "Good guess"
    else:
        reply = "Oops! That letter is not in my word:"
        mistakesMade +=1
    lettersGuessed.append(guess)
    return reply


# When you've completed your hangman function, uncomment these two lines
# and run this file to test! (hint: you might want to pick your own
# secretWord while you're testing)
secretWord = chooseWord(wordlist).lower()
hangman(secretWord)
