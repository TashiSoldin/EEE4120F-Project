from hashlib import md5
import time

start = time.time()

passwordToCrack = "9999"
hashedPasswordToCrack = md5(passwordToCrack.encode('utf-8')).hexdigest()

with open("dictionaryPasswordList.txt", "r") as passwords:
    lineNum = 1
    for line in passwords.readlines():
        line = line.strip()
        lineHashed = md5(line.encode('utf-8')).hexdigest()

        if lineHashed == hashedPasswordToCrack:
            print("Found a match!\nLine Number: "+str(lineNum)+"\nHash: "+lineHashed+"\n"+"Plain text: "+line)
        lineNum += 1

end = time.time()
print("Time: "+str(end - start)+"s")