class Kangaroo(object):
    def __init__(self, contents=[]):
        self.pouch_contents = contents

    def __str__(self):
        return str(self.pouch_contents)
    
    def put_in_pouch(self, obj):
        self.pouch_contents.append(obj)
        
kanga = Kangaroo()
roo = Kangaroo()
kanga.put_in_pouch(roo)
print kanga

    
    
