#!/usr/bin/python
# Copyright 2010 Google Inc.
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0

# Google's Python Class
# http://code.google.com/edu/languages/google-python-class/

import os
import re
import sys
import urllib

"""Logpuzzle exercise
Given an apache logfile, find the puzzle urls and download the images.

Here's what a puzzle url looks like:
10.254.254.28 - - [06/Aug/2007:00:13:48 -0700] "GET /~foo/puzzle-bar-aaab.jpg HTTP/1.0" 302 528 "-" "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6"
"""

def read_urls(filename):
  """Returns a list of the puzzle urls from the given log file,
  extracting the hostname from the filename itself.
  Screens out duplicate urls and returns the urls sorted into
  increasing order."""
  f = openFile(filename)
  if f:
    hostnames = extract_hostnames( f )
    return sorted(hostnames, key=getSecondWord)

def getSecondWord(gString):
  match = re.search(r'-(\w+).jpg', gString)
  if match:
    return match.group(1)

def openFile(filename):
  try:
    f = open(filename, 'rU')
    return f
  except IOError:
    print 'Could not open file.'

def extract_hostnames( f ):
  urlList = []
  lines = f.readlines()
  for line in lines:
    match = re.search(r'GET (\S+)', line )
    if match:
      gString = match.group(1)
    if 'puzzle' in gString:
      puzzleUrl = 'http://www.code.google.com'+gString
      if puzzleUrl not in urlList:
        urlList.append(puzzleUrl)
  return urlList
  
def download_images(img_urls, dest_dir):
  """Given the urls already in the correct order, downloads
  each image into the given directory.
  Gives the images local filenames img0, img1, and so on.
  Creates an index.html in the directory
  with an img tag to show each local image file.
  Creates the directory if necessary.
  """
  numberOfImages = len(img_urls)
  imgNames = create_img_names(numberOfImages)
  for i in xrange(numberOfImages):
    urllib.urlretrieve(img_urls[i], imgNames[i])
  create_index(imgNames)

def create_index(imgNames):
  html = create_html(imgNames)
  try:
    f = open('index.html', 'w')
    try:
      f.write(html)
    finally:
      f.close()
  except IOErrror:
    pass

def create_html(imgNames):
  result = '<html><body>\n'
  for name in imgNames:
    result += '<img src="'+ name[:-4] + '.jpg">'
  result += '\n</body></html>'
  return result

def create_img_names(numberOfImages):
  result = []
  for i in xrange(numberOfImages):
    result.append('img'+str(i)+'.jpg')
  return result

def main():
  args = sys.argv[1:]

  if not args:
    print 'usage: [--todir dir] logfile '
    sys.exit(1)

  todir = ''
  if args[0] == '--todir':
    todir = args[1]
    del args[0:2]

  img_urls = read_urls(args[0])

  if todir:
    download_images(img_urls, todir)
  else:
    print '\n'.join(img_urls)

##if __name__ == '__main__':
##  main()

urls = read_urls('place_code.google.com')
download_images(urls,'')
