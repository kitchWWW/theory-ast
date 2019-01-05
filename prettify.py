#script (python)
import clingo
import time as ts
import os


model_num = -1
timestamp = -1

def output(solution):
	global timestamp
	global model_num
	if timestamp == -1:
		timestamp = str(ts.time())
		os.mkdir('out/'+timestamp)
		os.chdir('out/'+timestamp)
	model_num += 1
	print("hi")
	totalTime = 0;
	totalVoices = 0;
	atoms = solution.symbols(atoms=True)
	for a in atoms:
		if a.name == 'note':
			if a.arguments[1].number > totalVoices:
				totalVoices = a.arguments[1].number
			if a.arguments[2].number+1 > totalTime:
				totalTime = a.arguments[2].number+1
	res = [0]*totalVoices
	for i in range(totalVoices):
		res[i] = [0]*totalTime
	for a in atoms:
		if a.name == 'note':
			pitch = int(a.arguments[0].number)
			voice = a.arguments[1].number -1
			time = a.arguments[2].number
			res[voice][time] = pitch
	print res
	lilyStrings = convertVoicesToLily(res)
	outputLilyStrings(lilyStrings,model_num)
	print("bye")
 
def main(prg):
    prg.ground([("base", [])])
    prg.solve()
    solution = prg.solve(on_model=output)



#lilypond helper functions
def lilyPitchFromString(noteNumber):
	lilyNoteNames = ['c','cis','d','ees','e','f','fis','g','gis','a','bes','b']
	pitchClass = noteNumber%12
	numberOfTicks = int((noteNumber)/12) - 5
	if numberOfTicks > 0:
		return lilyNoteNames[pitchClass] + "'"*numberOfTicks
	else:
		return lilyNoteNames[pitchClass] + ","*(-numberOfTicks)

def outputLilyStrings(lilyStrings,model_num):
	fd = open('out_'+str(model_num)+'.ly','w')
	totalString = ["\\score { \n <<"]
	for p in lilyStrings[::-1]:
		totalString.append("\\new Staff \\absolute {")
		totalString.append(" ".join(p))
		totalString.append("}")
	totalString.append(">>\n \\midi{{}}\n\\layout{{}}\n}")
	fd.write("\n".join(totalString))
	fd.truncate()
	fd.close()
	os.system("lilypond out_"+str(model_num)+" > /dev/null 2>&1  & ")


def convertVoicesToLily(voices):
	ret = []
	for v in voices:
		lyString = []
		for p in v:
			lyString.append(lilyPitchFromString(p)+"2")
		ret.append(lyString)
	return ret

#end.