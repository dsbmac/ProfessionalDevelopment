#!/usr/bin/python
# Copyright 2010 Google Inc.
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0

# Google's Python Class
# http://code.google.com/edu/languages/google-python-class/

import sys
import re
import glob

"""Baby Names exercise

Define the extract_names() function below and change main()
to call it.

For writing regex, it's nice to include a copy of the target
text for inspiration.

Here's what the html looks like in the baby.html files:
...
<h3 align="center">Popularity in 1990</h3>
....
<tr align="right"><td>1</td><td>Michael</td><td>Jessica</td>
<tr align="right"><td>2</td><td>Christopher</td><td>Ashley</td>
<tr align="right"><td>3</td><td>Matthew</td><td>Brittany</td>
...

Suggested milestones for incremental development:
 -Extract the year and print it
 -Extract the names and rank numbers and just print them
 -Get the names data into a dict and print it
 -Build the [year, 'name rank', ... ] list and print it
 -Fix main() to use the extract_names list
"""

def extract_names(filename):
  """
  Given a file name for baby.html, returns a list starting with the year string
  followed by the name-rank strings in alphabetical order.
  ['2006', 'Aaliyah 91', Aaron 57', 'Abagail 895', ' ...]
  """
  result = ''
  nameDict = create_names_dict(filename)
  if nameDict:
    result += nameDict["Year"] + '\n' 
    for entry in sorted( iter(nameDict) ):
      result += entry + ' ' + nameDict[entry]+'\n'
  return result

##def create_names_dict2(filename):
##  fileBabyNames = open(filename, 'rU',0)
##  nameDict = {}
##  line = fileBabyNames.readline()
##  while (line):
##    print line
##    if 'Year' in nameDict:
##      names = findNames(line)
##      if names:
##        enterNames(names, nameDict)
##    else:
##      year = re.search(r'<h3 align="\w+">Popularity in\s(\d\d\d\d)</h3>', line)
##      if year:
##        nameDict['Year'] = year.group(1)
##    line = fileBabyNames.readline()
##  fileBabyNames.close()
##  return nameDict

def create_names_dict(filename):
  nameDict = {}
  try:
    namesFile = open(filename, 'rU')
    namesText = namesFile.read()
    enterYear(namesText, nameDict)
    enterAllNames(namesText, nameDict)
    namesFile.close()
  except IOError:
    print 'Cannot open file.'
  return nameDict

def enterYear(namesText, nameDict):
  year = re.search(r'<input type="text" name="year" id="yob" size="4" value="(\d\d\d\d)">', namesText)
  if year:
    nameDict['Year'] = year.group(1)
  
def enterAllNames(namesText, nameDict):
  entries = re.findall( r'<tr align="\w+"><td>(\d+)</td><td>(\w+)+</td><td>(\w+)+</td>', namesText)
  if entries:
    for entry in entries:
      for i in xrange(1, len(entry)):
        if ( entry[i] in nameDict and entry[0] < nameDict[entry[i]] ) or ( entry[i] not in nameDict ):
          nameDict[entry[i]] = entry[0]
          
def enterNames(names, nameDict):
  (rank, name1, name2) = names
  if (name1 not in nameDict) or (name1 in nameDict and rank < nameDict[name1] ):
    nameDict[name1] = rank
  elif (name1 not in nameDict) or ( name2 in nameDict and rank < nameDict[name2] ):
    nameDict[name2] = rank
                  
def findNames(line):
  data = re.search(r'<tr align="\w+"><td>(\d+)</td><td>(\w+)</td><td>(\w+)</td>', line)
  if data:
    return data.group(1), data.group(2), data.group(3)

def writeSummaryFile(filename, extractedNames):
  try:
    f = open(filename+'.summary', 'w')
    try:
      f.write(extractedNames)
    finally:
      f.close()
  except IOError:
    pass

def main():
  # This command-line parsing code is provided.
  # Make a list of command line arguments, omitting the [0] element
  # which is the script itself.
  args = sys.argv[1:]

  if not args:
    print 'usage: [--summaryfile] file [file ...]'
    sys.exit(1)

  # Notice the summary flag and remove it from args if it is present.
  summary = False
  if args[0] == '--summaryfile':
    summary = True
    del args[0]

  # For each filename, get the names, then either print the text output
  # or write it to a summary file
  for arg in args:
    filenames = glob.glob(arg)
  for filename in filenames:
    extractedNames = extract_names(filename)
    if summary:
      writeSummaryFile(filename, extractedNames)
    else:
      print extractedNames

  
if __name__ == '__main__':
  main()


##print extract_names('baby2008.html')
##create_names_dict('baby2008.html')
