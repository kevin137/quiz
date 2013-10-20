#!/usr/bin/python

print "Python Quiz System\n"

quiz = {}

f = file('test.txt', 'r')
for line in f:
	#print '### line --->' + line + '<---'
	clean = line.rstrip()
	#print '### clean --->' + clean + '<---'
	filt = clean.replace('\\','')
	#print '### filt --->' + filt + '<---'
	q,a = filt.split(":")
	#print 'question is ' + q + '  answer is ' + a
	quiz[q] = a;
	#print ' '

f.close()
print ' '

#words = ['cat', 'window', 'defenestrate']
words = quiz.keys()
for w in words:
	#print w, len(w)
	print w
	s = raw_input('')
	if s == quiz[w]:
		print 'Right\n'
	else:
		print 'given answer was ' + s + ' correct answer is ' + quiz[w]

