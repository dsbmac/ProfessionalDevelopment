
def test():
    GrapesOfWrath = {"author": "Steinbeck", "title": "The Grapes of Wrath" }
    EastOfEden = {"author": "Steinbeck", "title": "East of Eden" }
    AuthorBooks =  {"The Grapes of Wrath": GrapesOfWrath, "East of Eden": EastOfEden }
    byAuthor = {"Steinbeck": AuthorBooks}
    byTitle = {"The Grapes of Wrath": GrapesOfWrath, "East of Eden": EastOfEden}
    
    print byAuthor["Steinbeck"]["East of Eden"]["author"]
    print byTitle["East of Eden"]["author"]

    EastOfEden["author"] = "Hemingway"
    print byAuthor["Steinbeck"]["East of Eden"]["author"]
    print byTitle["East of Eden"]["author"]
    
test()
