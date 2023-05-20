from hashlib import md5
import time

# Start the timer
start = time.time()

# Define the worst case scenario password to crack and hash it to get the target hash
passwordToCrack = "9999"
hashedPasswordToCrack = md5(passwordToCrack.encode('utf-8')).hexdigest()

# Open the previously generated brute force password list
with open("bruteForcePasswordList.txt", "r") as passwords:
    lineNum = 1
    # Read though the password list and hash passwords as code steps through
    for line in passwords.readlines():
        line = line.strip()
        lineHashed = md5(line.encode('utf-8')).hexdigest()

        # If the hash of the brute force password matches the target hash, print message and break
        if lineHashed == hashedPasswordToCrack:
            print("Found a match!\nLine Number: "+str(lineNum)+"\nHash: "+lineHashed+"\n"+"Plain text: "+line)
            break
        lineNum += 1

# Stop timer
end = time.time()
print("Time: "+str(end - start)+"s")
