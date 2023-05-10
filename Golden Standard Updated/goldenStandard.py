from hashlib import md5
import time
import csv


def bruteForce(hashedWord):

    with open("passwordList.txt", "r") as passwords:
        lineNum = 1
        found = False
        for line in passwords.readlines():
            line = line.strip()
            lineHashed = md5(line.encode('utf-8')).hexdigest()

            if lineHashed == hashedWord:
                # print("Found a match!\nLine Number: "+str(lineNum)+"\nHash: "+lineHashed+"\n"+"Plain text: "+line)
                print(lineHashed+" : "+line+"\t\tIterations: "+str(lineNum+18283))
                found = True
                break
            lineNum += 1

        return found


def dictionaryAttack(hashedWord):

    with open("dictionaryPasswordList.txt", "r", encoding='utf-8', errors='ignore') as passwords:
        lineNum = 1
        found = False
        for line in passwords.readlines():
            line = line.strip()
            lineHashed = md5(line.encode('utf-8')).hexdigest()

            if lineHashed == hashedWord:
                # print("Found a match!\nLine Number: "+str(lineNum)+"\nHash: "+lineHashed+"\n"+"Plain text: "+line)
                print(lineHashed+" : "+line+"\t\tIterations: "+str(lineNum))
                found = True
                break
            
            lineNum += 1

        return found
    
def csvWrite(dictTimes, bruteTimes):
    # Open the Dictionary CSV file in write mode
    with open('Dictionary_Times.csv', 'w',encoding='utf-8', errors='ignore', newline='') as dict:

        for word1 in dictTimes:
            word1 = word1+','
            dict.write(word1)
            dict.write("\n")

        # Open the Brute Force CSV file in write mode
    with open('BruteForce_Times.csv', 'w',encoding='utf-8', errors='ignore', newline='') as brute:
        for word in bruteTimes:
            word = word+','
            brute.write(word)
            brute.write("\n")



def main():

    dictTimes = []
    bruteTimes = []

    with open("hashList.txt", 'r', encoding='utf-8', errors='ignore') as hashes:

        limit = 10
        num = 0

        # Test Case Dictionary: added Yoda at line 5 of Hashes
        #                                     line 14 000 of the Dictionary
        # Test Case Brute Force: added CP30 to the hashList at line 14 of the Hashes
        #                                          takes 537779 iterations in the BruteForceText



        for hash in hashes.readlines():

            start_brute_timer = 0
            end_brute_timer = 0

            hash = hash.strip()
            
            if num >= limit:
                break

            start_dictionary_timer = time.time()
            
            hack = dictionaryAttack(hash)

            end_dictionary_timer = time.time()

            if hack == False:

                start_brute_timer = time.time()

                hack = bruteForce(hash)

                end_brute_timer = time.time()

            num+=1

            dict_time = end_dictionary_timer - start_dictionary_timer
            brute_time = end_brute_timer - start_brute_timer

            dictTimes.append(str(dict_time))
            bruteTimes.append(str(brute_time))

    csvWrite(dictTimes, bruteTimes)
            

        
if __name__ == '__main__':
    main()
