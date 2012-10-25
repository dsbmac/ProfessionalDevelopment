#!/usr/bin/python

import wx
import sys

packages = [('jessica alba', 'pomona', '1981'), ('sigourney weaver', 'new york', '1949'),
    ('angelina jolie', 'los angeles', '1975'), ('natalie portman', 'jerusalem', '1981'),
    ('rachel weiss', 'london', '1971'), ('scarlett johansson', 'new york', '1984' )]

class Items(wx.Frame):
    def __init__(self, parent, id, title):
        wx.Frame.__init__(self, parent,id,title, size=(380,230))
        hbox = wx.BoxSizer(wx.HORIZONTAL)
        panel = wx.Panel(self, -1)

        self.list = wx.ListCtrl(panel, -1, style=wx.LC_REPORT)
        self.list.InsertColumn(0, 'Name', width=140)
        self.list.InsertColumn(1, 'Place', width=130)
        self.list.InsertColumn(2, 'Year', wx.LIST_FORMAT_RIGHT, 90)

        for i in packages:
            index = self.list.InsertStringItem(sys.maxint, i[2])
            self.list.SetStringItem(index, 1, i[1])
            self.list.SetStringItem(index, 2, i[0])

            #color alternating rows
            if (index % 2) == 0:
                self.list.SetItemBackgroundColour(index, '#e6f1f5')

        filemenu= wx.Menu()
        filemenu.Append(wx.ID_EXIT,"E&xit"," Terminate the program")
        editmenu = wx.Menu()
        netmenu = wx.Menu()
        showmenu = wx.Menu()
        configmenu = wx.Menu()
        helpmenu = wx.Menu()

        menuBar = wx.MenuBar()
        menuBar.Append(filemenu,"&File")
        menuBar.Append(editmenu, "&Edit")
        menuBar.Append(netmenu, "&Net")
        menuBar.Append(showmenu, "&Show")
        menuBar.Append(configmenu, "&Config")
        menuBar.Append(helpmenu, "&Help")
        self.SetMenuBar(menuBar)

        hbox.Add(self.list, 1, wx.EXPAND)
        panel.SetSizer(hbox)

        self.Centre()
        self.Show(True)

app = wx.App()
Items(None, -1, 'Items')
app.MainLoop()



##        tb = self.CreateToolBar( wx.TB_HORIZONTAL | wx.NO_BORDER | 
##		wx.TB_FLAT | wx.TB_TEXT)
##        tb.AddSimpleTool(10, wx.Bitmap('images/previous.png'), 'Previous')
##        tb.AddSimpleTool(20, wx.Bitmap('images/up.png'), 'Up one directory')
##        tb.AddSimpleTool(30, wx.Bitmap('images/blank.png'), 'Home')
##        tb.AddSimpleTool(40, wx.Bitmap('images/Button Reload-01.png'), 'Refresh')
##        tb.AddSeparator()
##        tb.AddSimpleTool(50, wx.Bitmap('images/Button New-01.png'), 'Editor')
##        tb.AddSimpleTool(60, wx.Bitmap('images/Network Connection-01.png'), 'Terminal')
##        tb.AddSeparator()
##        tb.AddSimpleTool(70, wx.Bitmap('images/Help-01.png'), 'Help')
##        tb.Realize()

##        self.sizer2 = wx.BoxSizer(wx.HORIZONTAL)
##
##        button1 = wx.Button(self, ID_BUTTON + 1, "F3 View")
##        button2 = wx.Button(self, ID_BUTTON + 2, "F4 Edit")
##        button3 = wx.Button(self, ID_BUTTON + 3, "F5 Copy")
##        button4 = wx.Button(self, ID_BUTTON + 4, "F6 Move")
##        button5 = wx.Button(self, ID_BUTTON + 5, "F7 Mkdir")
##        button6 = wx.Button(self, ID_BUTTON + 6, "F8 Delete")
##        button7 = wx.Button(self, ID_BUTTON + 7, "F9 Rename")
##        button8 = wx.Button(self, ID_EXIT, "F10 Quit")
##
##        self.sizer2.Add(button1, 1, wx.EXPAND)
##        self.sizer2.Add(button2, 1, wx.EXPAND)
##        self.sizer2.Add(button3, 1, wx.EXPAND)
##        self.sizer2.Add(button4, 1, wx.EXPAND)
##        self.sizer2.Add(button5, 1, wx.EXPAND)
##        self.sizer2.Add(button6, 1, wx.EXPAND)
##        self.sizer2.Add(button7, 1, wx.EXPAND)
##        self.sizer2.Add(button8, 1, wx.EXPAND)
##
##        self.Bind(wx.EVT_BUTTON, self.OnExit, id=ID_EXIT)
##
##        self.sizer = wx.BoxSizer(wx.VERTICAL)
##        self.sizer.Add(self.splitter,1,wx.EXPAND)
##        #self.sizer.Add(self.sizer2,0,wx.EXPAND)
##        self.SetSizer(self.sizer)
##
##        size = wx.DisplaySize()
##        self.SetSize(size)
##
##        self.sb = self.CreateStatusBar()
##        self.sb.SetStatusText(os.getcwd())
##        self.Center()
##        self.Show(True)
##
##
##    def OnExit(self,e):
##        self.Close(True)
##
##    def OnSize(self, event):
##        size = self.GetSize()
##        self.splitter.SetSashPosition(size.x / 2)
##        #self.sb.SetStatusText(os.getcwd())
##        event.Skip()
##
##
##    def OnDoubleClick(self, event):
##        size =  self.GetSize()
##        #self.splitter.SetSashPosition(size.x / 2)
##
##app = wx.App(0)
##FileHunter(None, -1, 'File Hunter')
##app.MainLoop()
