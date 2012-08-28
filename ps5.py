# 6.00 Problem Set 5
# RSS Feed Filter
import unittest
import feedparser
import string
import time
import copy
from project_util import translate_html
from news_gui import Popup

#-----------------------------------------------------------------------
#
# Problem Set 5

#======================
# Code for retrieving and parsing
# Google and Yahoo News feeds
# Do not change this code
#======================

def process(url):
    """
    Fetches news items from the rss url and parses them.
    Returns a list of NewsStory-s.
    """
    feed = feedparser.parse(url)
    entries = feed.entries
    ret = []
    for entry in entries:
        print entry
        guid = entry.guid
        title = translate_html(entry.title)
        link = entry.link
        summary = translate_html(entry.summary)
        try:
            subject = translate_html(entry.tags[0]['term'])
        except AttributeError:
            subject = ""
        newsStory = NewsStory(guid, title, subject, summary, link)
        ret.append(newsStory)
    return ret

#======================
# Part 1
# Data structure design
#======================

# Problem 1

# TODO: NewsStory
class NewsStory:
    def __init__(self, guid, title, subject, summary, link) :
                 self.guid = guid
                 self.title = title
                 self.subject = subject
                 self.summary = summary
                 self.link = link
                 
    def __str__(self):
        return '(' + str(self.guid) + ', ' + str(self.title) + ', ' + str(self.subject) + ', ' + str(self.summary) + ', ' + str(self.link) + ')'

    def get_guid(self):
        return self.guid
    def get_title(self):
        return self.title    
    def get_subject(self):
        return self.subject
    def get_summary(self):
        return self.summary
    def get_link(self):
        return self.link

                 
#======================
# Part 2
# Triggers
#======================

class Trigger(object):        
    
    def evaluate(self, story):
        """
        Returns True if an alert should be generated
        for the given news item, or False otherwise.
        """
        raise NotImplementedError
    

# Whole Word Triggers
# Problems 2-5

# TODO: WordTrigger

class WordTrigger(Trigger):
    
    def __init__(self,word):
        self.word = word

    def is_word_in(self, text):
        str = ""
        for i, char in enumerate(text):
            if char in string.punctuation:
                str += " "
            else:
                str += char.lower()
        words = str.split()
        if self.word.lower() in words:
            return True
        else:
            return False

# TODO: TitleTrigger
class TitleTrigger(WordTrigger):

        def __str__(self):
            return self.word

        def evaluate(self, newsStory):
            return self.is_word_in(newsStory.title)
        
# TODO: SubjectTrigger
class SubjectTrigger(WordTrigger):

        def __str__(self):
            return self.word

        def evaluate(self, newsStory):
            return self.is_word_in(newsStory.subject)

# TODO: SummaryTrigger
class SummaryTrigger(WordTrigger):

        def __str__(self):
            return self.word

        def evaluate(self, newsStory):
            return self.is_word_in(newsStory.summary)

# Composite Triggers
# Problems 6-8

# TODO: NotTrigger
class NotTrigger(Trigger):
    def __init__(self, T):
        self.T = T

    def __str__(self):
        return self.t

    def evaluate(self, x):
        return not self.T.evaluate(x)            
    
# TODO: AndTrigger
class AndTrigger(Trigger):
    """
    This trigger should take any number of triggers as arguments to its constructor,
    and should fire on a news story only if all appear.
    """
##    def __init__(self, T1, T2):
##        self.T1 = T1
##        self.T2 = T2
##
##    def __str__(self):
##        return 'T1:', self.T1, 'T2:', self.T2
##
##    def evaluate(self, x):
##        return self.T1.evaluate(x) and self.T2.evaluate(x) 

    def __init__(self, *args):
        self.values = [x for x in args]

    def __str__(self):
        return str(self.values).strip('[]')

    def evaluate(self, x):
        for trig in self.values:
            if trig.evaluate(x) == False:
                return False
        return True
    
# TODO: OrTrigger
class OrTrigger(Trigger):
    def __init__(self, T1, T2):
        self.T1 = T1
        self.T2 = T2

    def __str__(self):
        return 'T1:', self.T1, 'T2:', self.T2

    def evaluate(self, x):
        return self.T1.evaluate(x) or self.T2.evaluate(x) 

# Phrase Trigger
# Question 9

# TODO: PhraseTrigger
class PhraseTrigger(Trigger):
    def __init__(self, phrase):
        self.phrase = phrase

    def __str__(self):
        return self.phrase
        
    def is_word_in(self, text):
        return str(self.phrase) in ''.join(str(text))
    
    def evaluate(self, x):
        return self.is_word_in(x)


#======================
# Part 3
# Filtering
#======================

def filter_stories(stories, triggerlist):
    """
    Takes in a list of NewsStory-s.
    Returns only those stories for whom
    a trigger in triggerlist fires.
    """
    # TODO: Problem 10
    filteredStories = []
##    print 'stories:', stories
##    print 'triggerlist:', triggerlist
    
    for story in stories:
        for trig in triggerlist:
            if trig.evaluate(story):
                filteredStories.append(story)
                break #added without testing not sure if works but should optimize
    return filteredStories

#======================
# Part 4
# User-Specified Triggers
#======================
TriggerDict = {'TITLE': TitleTrigger, 'SUBJECT' : SubjectTrigger, 'SUMMARY': SummaryTrigger, 'NOT' : NotTrigger, 'AND' : AndTrigger, 'OR' : OrTrigger, 'PHRASE' : PhraseTrigger}

##def ADDTrigger(trigDict, *args):
##    result = []
##    for arg in args:
##        result.append(trigDict[arg])
##    return result
##
##def createTrigger(TrigLine, dictionary):
##    tls = TrigLine.split()
##    if tls[0] != 'ADD':
##        return TriggerDict[tls[1]](tls[2])
##    else:
##        terms = tls[1:]
##        return TriggerDict['ADD'](terms)

def createTrigDict(lines):
    """
    creates a dictionary with search term names: corresponding trigger object
    this will compile multiple ADD terms into one big list and insert that list into the dict under 'ADD'
    """    
    result = {}
    addList = []
    for line in lines:
        ls = line.split()
        
        if ls[0] == 'ADD':
            #collects ADD terms into a list adds it into the dict after the for loop
            triggers = ls[1:]   
            for trig in triggers:
                addList.append(result[trig])
            
        elif ls[1] == 'AND':
            terms = ls[2:]
            result[ls[0]] = TriggerDict['AND'](terms)
            
        else:
            result[ls[0]] = TriggerDict[ls[1]](ls[2]) #lookup the second term in the trigger dictionary and supply the parameters tls[2]      

        result['ADD'] = addList       #tacks on the final 'ADD' dict value pair     

    return result

def readTriggerConfig(filename):
    """
    Returns a list of trigger objects
    that correspond to the rules set
    in the file filename
    """
    # Here's some code that we give you
    # to read in the file and eliminate
    # blank lines and comments
    triggerfile = open(filename, "r")
    all = [ line.rstrip() for line in triggerfile.readlines() ]
    lines = []
    for line in all:
        if len(line) == 0 or line[0] == '#':
            continue
        lines.append(line)

    # TODO: Problem 11
    # 'lines' has a list of lines you need to parse
    # Build a set of triggers from it and
    # return the appropriate ones

    #create a trigger dict excluding the ADD triggers
    triggerListDict = createTrigDict(lines)

    result = triggerListDict['ADD']
    return result      

##term1 = 'soft'
##term2 = 'cuddly'
##term3 = 'koala'
##trig1 = TitleTrigger(term1)
##trig2 = TitleTrigger(term2)
##trig3 = SubjectTrigger(term3)
##aT = AndTrigger(trig1, trig2, trig3)
##koala = NewsStory('', 'Koala bears are soft and cuddly', 'bird', '', '')
##
##print aT.evaluate(koala)
    
import thread

def main_thread(p):
##    # A sample trigger list - you'll replace
##    # this with something more configurable in Problem 11
##    t1 = TitleTrigger("Romney")
##    t2 = SummaryTrigger("MIT")
##    t3 = PhraseTrigger("Supreme Court")
##    t4 = OrTrigger(t2, t3)
##    triggerlist = [t1, t4]

    ##    # A sample trigger list - you'll replace
    # this with something more configurable in Problem 11
    t1 = SummaryTrigger("Used")
    triggerlist = [t1]
    
    # TODO: Problem 11
    # After implementing readTriggerConfig, uncomment this line 
#    triggerlist = readTriggerConfig("triggers.txt")

    guidShown = []
    
    while True:
        print "Polling..."

##        # Get stories from Google's Top Stories RSS news feed
##        stories = process("http://news.google.com/?output=rss")
##        # Get stories from Yahoo's Top Stories RSS news feed
##        stories.extend(process("http://rss.news.yahoo.com/rss/topstories"))
        #Get posts from Hammock Forums
        stories = process("http://www.hammockforums.net/forum/external.php?type=RSS2")

        # Only select stories we're interested in
        stories = filter_stories(stories, triggerlist)
    
        # Don't print a story if we have already printed it before
        newstories = []
        for story in stories:
            if story.get_guid() not in guidShown:
                newstories.append(story)
        
        for story in newstories:
            guidShown.append(story.get_guid())
            p.newWindow(story)

        print "Sleeping..."
        time.sleep(SLEEPTIME)

SLEEPTIME = 60 #seconds -- how often we poll
if __name__ == '__main__':
    p = Popup()
    thread.start_new_thread(main_thread, (p,))
    p.start()
