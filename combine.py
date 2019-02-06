import os


timeStamps = os.listdir("out")
timeStamps.remove(".DS_Store")
timeStamp = sorted(timeStamps)[len(timeStamps)-1]


allLines = []
for f in os.listdir('out/'+timeStamp):
	if not ".ly" in f:
		continue
	fd = open("out/"+timeStamp+'/'+f)
	isFirstLineInScore = True
	countSingle = 0
	for l in fd.readlines():
		if "<<" in l:
			l = ''
		if isFirstLineInScore and ("\\new Staff" in l):
			l = l+'\n<<{'
			isFirstLineInScore = False
		elif (not isFirstLineInScore) and ("\\new Staff" in l):
			l = "\\\\ {"
		elif (not isFirstLineInScore) and (">>" in l):
			l = ""
		elif l.strip() == "}":
			countSingle += 1
			if countSingle == 2:
				l = "}>>\n}"
		elif "midi" in l:
			l = ''
		print l
		allLines.append(l)

totalOut = open('out/'+timeStamp+'/combine.ly','w')
totalOut.write('\n'.join(allLines))
totalOut.close()