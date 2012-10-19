#!/usr/bin/python
# -*- coding: utf-8 -*-


import wx


class Example(wx.Frame):
    def __init__(self, *args, **kwargs):
        super(Example, self).__init__(*args, **kwargs)
        
        self.InitUI()

    def InitUI(self):
        menubar = wx.MenuBar()
        
        fileMenu = wx.Menu()
        fileMenu.Append(wx.ID_NEW, '&New')
        fileMenu.Append(wx.ID_OPEN, '&Open')
        fileMenu.Append(wx.ID_SAVE, '&Save')
        fileMenu.AppendSeparator()

        imp = wx.Menu()
        imp.Append(wx.ID_ANY, 'Import newsfeed list...')
        imp.Append(wx.ID_ANY, 'Import bookmarks...')
        imp.Append(wx.ID_ANY, 'Import mail...')

        fileMenu.AppendMenu(wx.ID_ANY, 'I&mport', imp)

        qmi = wx.MenuItem(fileMenu, wx.ID_EXIT, 'Quit\tCtrl+W' )
        fileMenu.AppendItem(qmi)
                        
        self.Bind(wx.EVT_MENU, self.OnQuit, qmi)

      #  self.Bind(wx.EVT_MENU,self.OnQuit, id=APP_EXIT)

        menubar.Append(fileMenu, '&File')
        self.SetMenuBar(menubar)
        
        self.SetSize((300,200))
        self.SetTitle('Icons and shortcuts')
        self.Centre()
        self.Show(True)

    def OnQuit(self, e):
        self.Close()

def main():
    ex = wx.App()
    Example(None)
    ex.MainLoop()
    
if __name__ == '__main__':
    main()
