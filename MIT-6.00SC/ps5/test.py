class Trigger(object):        
    
    def evaluate(self, story):
        """
        Returns True if an alert should be generated
        for the given news item, or False otherwise.
        """
        raise NotImplementedError
    

def NotTrigger(Trigger):
    def __init__(self, T, x):
        self.T = T
        self.x = x

    def __str__(self):
        print self.t

    def evaluate(self, x):
        return not self.t.evaluate(x)

s = NotTrigger("you")
print s
