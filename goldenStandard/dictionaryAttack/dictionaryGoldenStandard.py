from hashlib import md5
import time

# Start timer
start = time.time()

# Define worst case scenario password to crack and hash it to get the target hash
passwordToCrack = "9999"
hashedPasswordToCrack = md5(passwordToCrack.encode('utf-8')).hexdigest()

# Iterate through the dictionary list and check to see if hashed version of dictionary password matches the target hash
with open("dictionaryPasswordList.txt", "r") as passwords:
    lineNum = 1
    for line in passwords.readlines():
        line = line.strip()
        lineHashed = md5(line.encode('utf-8')).hexdigest()
        
        # If match found, break
        if lineHashed == hashedPasswordToCrack:
            print("Found a match!\nLine Number: "+str(lineNum)+"\nHash: "+lineHashed+"\n"+"Plain text: "+line)
            break
        lineNum += 1

# Stop timer
end = time.time()
print("Time: "+str(end - start)+"s")
