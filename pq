#!/usr/bin/python
import time

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

words = quiz.keys()
for w in words:
	print w + '?'
	start = time.time()
	s = raw_input('')
	elapsed = (time.time() - start)
	if s == quiz[w]:
		#print 'Right answer in '+str(round(elapsed,2))+' seconds \n'
		print 'Right!'
	else:
		#print 'given answer was ' + s + ' correct answer is ' + quiz[w]
		print 'What?\n'

