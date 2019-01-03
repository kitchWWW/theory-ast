#script (python)
import clingo

model_num = -1

def output(solution):
	global model_num
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
	fd = open('out/out_'+str(model_num)+'.ly','w')
	totalString = ["<<"]
	for p in lilyStrings:
		totalString.append("\\new Staff \\absolute {")
		totalString.append(" ".join(p))
		totalString.append("}")
	totalString.append(">>")
	fd.write("\n".join(totalString))
	fd.truncate()
	fd.close()

def convertVoicesToLily(voices):
	ret = []
	for v in voices:
		lyString = []
		for p in v:
			lyString.append(lilyPitchFromString(p)+"2")
		ret.append(lyString)
	return ret

#end.