class Time(object):

    def print_time(time):        
        print '%.2d:%.2d:%2d' % (time.hour, time.minute, time.second)

    def is_after(t1, t2):
        return t1.hour > t2.hour


time = Time()
time.hour = 11
time.minute = 59
time.second = 30

time.print_time()
