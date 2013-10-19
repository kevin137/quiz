#!/usr/bin/python

print "Python Quiz System\n"

f = file('test.txt', 'r')

for line in f:
	print line
	q,a = line.strip().split(":")
	print 'question is ' + q + 'answer is ' + a
f.close()

words = ['cat', 'window', 'defenestrate']
for w in words:
	print w, len(w)
	s = raw_input('--> ')
	print 'answer was ' + s

