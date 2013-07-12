# 6.00x Problem Set 6
# RSS Feed Filter

import feedparser
import string
import time
from project_util import translate_html
from Tkinter import *
import re


#-----------------------------------------------------------------------
#
# Problem Set 6

#======================
# Code for retrieving and parsing RSS feeds
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

#======================
# Part 1
# Data structure design
#======================

# Problem 1
class NewsStory:
    def __init__(self, guid, title, subject, summary, link):
        self.guid = guid
        self.title = title
        self.subject = subject
        self.summary = summary
        self.link = link
    
    def getGuid(self):
        return self.guid
                
    def getTitle(self):
        return self.title
        
    def getSubject(self):
        return self.subject
        
    def getSummary(self):
        return self.summary
        
    def getLink(self):
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

class WordTrigger(Trigger):
    def __init__(self, word):
        self.word = word
        
    def isWordIn(self, text):
        pat = r"(^|[\s\W])" + re.escape(self.word) + r"($|[\s\W])"
        match = re.search(pat, text, re.IGNORECASE)
        return match != None

class TitleTrigger(WordTrigger):        
    def evaluate(self, story):
        s = story.getTitle()
        return self.isWordIn(s)  
    
class SubjectTrigger(WordTrigger):        
    def evaluate(self, story):
        s = story.getSubject()
        return self.isWordIn(s)

class SummaryTrigger(WordTrigger):        
    def evaluate(self, story):
        s = story.getSummary()
        return self.isWordIn(s)

# Composite Triggers
# Problems 6-8

class NotTrigger(Trigger):
    def __init__(self, T):
        self.T = T
    def evaluate(self, x):        
        return not self.T.evaluate(x)
    
class AndTrigger(Trigger):
    def __init__(self, T, T2):
        self.T = T
        self.T2 = T2
    def evaluate(self, x):
        return self.T.evaluate(x) and self.T2.evaluate(x) 
    
class OrTrigger(Trigger):
    def __init__(self, T, T2):
        self.T = T
        self.T2 = T2
    def evaluate(self, x):
        return self.T.evaluate(x) or self.T2.evaluate(x) 

# Phrase Trigger
# Question 9

class PhraseTrigger(Trigger):    
    def __init__(self, phrase):
        self.phrase = phrase
        
    def evaluate(self, story):
        subject = story.getSubject()
        title = story.getTitle()
        summary = story.getSummary()
        texts = [subject, title, summary]

        for text in texts:
            pat = r"(^|[\s\W\w+])" + re.escape(self.phrase) + r"($|[\s\W\w+])"
            match = re.search(pat, text)
            if match: return True
        return False
        

#======================
# Part 3
# Filtering
#======================

def filterStories(stories, triggerlist):
    """
    Takes in a list of NewsStory instances.

    Returns: a list of only the stories for which a trigger in triggerlist fires.
    """    
    result = []
    for trigger in triggerlist:
        for story in stories:
            if trigger.evaluate(story): result.append(story)        
    return result

#======================
# Part 4
# User-Specified Triggers
#======================



def makeTrigger(triggerMap, triggerType, params, name):
    """
    Takes in a map of names to trigger instance, the type of trigger to make,
    and the list of parameters to the constructor, and adds a new trigger
    to the trigger map dictionary.

    triggerMap: dictionary with names as keys (strings) and triggers as values
    triggerType: string indicating the type of trigger to make (ex: "TITLE")
    params: list of strings with the inputs to the trigger constructor (ex: ["world"])
    name: a string representing the name of the new trigger (ex: "t1")

    Modifies triggerMap, adding a new key-value pair for this trigger.

    Returns: None
    """
    triggerFns = {'TITLE':TitleTrigger, 'SUBJECT':SubjectTrigger,
              'SUMMARY':SummaryTrigger, 'NOT':NotTrigger,
              'AND':AndTrigger, 'OR':OrTrigger, 'PHRASE':PhraseTrigger}
    print triggerType
    if triggerType == 'PHRASE':
        params = [' '.join(params).strip()]
    if triggerType == 'NOT' or triggerType == 'AND' or triggerType == 'OR':
        temp = []
        for triggerName in params:
            temp.append(triggerMap[triggerName])
        params = temp
        
    trigger = triggerFns[triggerType](*params)
    triggerMap[name] = trigger   
        
    return trigger

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

    triggers = []
    triggerMap = {}

    # Be sure you understand this code - we've written it for you,
    # but it's code you should be able to write yourself
    for line in lines:

        linesplit = line.split(" ")

        # Making a new trigger
        if linesplit[0] != "ADD":
            trigger = makeTrigger(triggerMap, linesplit[1],
                                  linesplit[2:], linesplit[0])

        # Add the triggers to the list
        else:
            for name in linesplit[1:]:
                triggers.append(triggerMap[name])

    for key in iter(triggerMap):
        print key, triggerMap[key]
    
    return triggers
    
import thread

SLEEPTIME = 60 #seconds -- how often we poll


def main_thread(master):
    # A sample trigger list - you'll replace
    # this with something more configurable in Problem 11
    try:
        # These will probably generate a few hits...
        t1 = SummaryTrigger("Obama")
        t2 = SubjectTrigger("Romney")
        t3 = PhraseTrigger("Election")
        t4 = OrTrigger(t2, t3)
        triggerlist = [t1, t4]
        
        # After implementing makeTrigger, uncomment the line below:
        triggerlist = readTriggerConfig("triggers.txt")

        # from here is about drawing
        frame = Frame(master)
        frame.pack(side=BOTTOM)
        scrollbar = Scrollbar(master)
        scrollbar.pack(side=RIGHT,fill=Y)

        t = "Google & Yahoo Top News"
        title = StringVar()
        title.set(t)
        ttl = Label(master, textvariable=title, font=("Helvetica", 18))
        ttl.pack(side=TOP)
        cont = Text(master, font=("Helvetica",14), yscrollcommand=scrollbar.set)
        cont.pack(side=BOTTOM)
        cont.tag_config("title", justify='center')
        button = Button(frame, text="Exit", command=root.destroy)
        button.pack(side=BOTTOM)
        guidShown = []
        def get_cont(newstory):
            if newstory.get_guid() not in guidShown:
                cont.insert(END, newstory.get_title()+"\n", "title")
                cont.insert(END, "\n---------------------------------------------------------------\n", "title")
                cont.insert(END, newstory.get_summary())
                cont.insert(END, "\n*********************************************************************\n", "title")
                guidShown.append(newstory.get_guid())

        while True:

            print "Polling . . .",
            # Get stories from Google's Top Stories RSS news feed
            stories = process("http://news.google.com/?output=rss")

            # Get stories from Yahoo's Top Stories RSS news feed
            stories.extend(process("http://rss.news.yahoo.com/rss/topstories"))

            stories = filterStories(stories, triggerlist)

            map(get_cont, stories)
            scrollbar.config(command=cont.yview)


            print "Sleeping..."
            time.sleep(SLEEPTIME)

    except Exception as e:
        print e


if __name__ == '__main__':

    root = Tk()
    root.title("Some RSS parser")
    thread.start_new_thread(main_thread, (root,))
    root.mainloop()

