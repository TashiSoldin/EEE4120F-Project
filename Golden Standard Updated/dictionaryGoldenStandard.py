from hashlib import md5

passwordToCrack = "Yoda"
hashedPasswordToCrack = md5(passwordToCrack.encode('utf-8')).hexdigest()

with open("dictionaryPasswordList.txt", "r", encoding='utf-8', errors='ignore') as passwords:
    lineNum = 1
    for line in passwords.readlines():
        line = line.strip()
        lineHashed = md5(line.encode('utf-8')).hexdigest()

        if lineHashed == hashedPasswordToCrack:
            # print("Found a match!\nLine Number: "+str(lineNum)+"\nHash: "+lineHashed+"\n"+"Plain text: "+line)
            print(lineHashed+" : "+line+"\nLine Number: "+str(lineNum))
        lineNum += 1