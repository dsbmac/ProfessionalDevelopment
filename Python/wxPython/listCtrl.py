#!/usr/bin/python

import wx
import sys

packages = [('jessica alba', 'pomona', '1981'), ('sigourney weaver', 'new york', '1949'),
    ('angelina jolie', 'los angeles', '1975'), ('natalie portman', 'jerusalem', '1981'),
    ('rachel weiss', 'london', '1971'), ('scarlett johansson', 'new york', '1984' )]

class Actresses(wx.Frame):
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
            

        hbox.Add(self.list, 1, wx.EXPAND)
        panel.SetSizer(hbox)

        self.Centre()
        self.Show(True)

app = wx.App()
Actresses(None, -1, 'actresses')
app.MainLoop()
