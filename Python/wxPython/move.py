#!/usr/bin/python
# -*- coding: utf-8 -*-

import wx

class Example(wx.Frame):
    def __init__(self, parent, title):
        super(Example, self).__init__(parent, title=title,
                                      size= (300,200) ) #adjusts the size
        #self.Move( (800,200) )
        #self.Maximize() #maximizes window
        self.Centre()
        self.Show()

if __name__ == '__main__':
    app = wx.App()
    Example(None, title='Move')
    app.MainLoop()
