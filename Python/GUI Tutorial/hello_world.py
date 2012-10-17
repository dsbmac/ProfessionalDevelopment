#!/usr/bin/env python
import wx

class MyFrame(wx.Frame):
    def __init__(self, parent, title):
        wx.Frame.__init__(self, parent, title=title, size=(600,400))
        self.control = wx.TextCtrl(self, style=wx.TE_MULTILINE)
        self.CreateStatusBar()
        filemenu = wx.Menu()
        filemenu.Append(wx.ID_EXIT, "E&xit", " Terminate the program")
        #help menu
        helpmenu = wx.Menu()
        helpmenu.Append(wx.ID_ABOUT, "&About", " Information about this program")
        #filemenu.AppendSeparator()
        
        menuBar = wx.MenuBar()
        menuBar.Append(filemenu, "&File")
        menuBar.Append(helpmenu, "&Help")
        self.SetMenuBar(menuBar)

        self.Show(True)
        
app = wx.App(False)
frame = MyFrame(None, "My First Editor")
app.MainLoop()
