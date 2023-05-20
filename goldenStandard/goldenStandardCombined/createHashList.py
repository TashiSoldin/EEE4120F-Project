from hashlib import md5
import csv

with open("hashList.txt","w", encoding='utf-8', errors='ignore') as wipe_hash:
    wipe_hash.write('')
with open("wordList.txt","w", encoding='utf-8', errors='ignore') as wipe_words:
    wipe_words.write('')
with open('example.csv', 'w', encoding='utf-8', errors='ignore') as csv:
    csv.write('')


with open("hak5.txt", "r", encoding='utf-8', errors='ignore') as hak5:

    for line in hak5.readlines():
        line = line.strip()

        if len(line) == 4:
     
            with open("hashList.txt","a", encoding='utf-8', errors='ignore') as hashes:
                hash = md5(line.encode('utf-8')).hexdigest()
                hashes.write(hash)
                hashes.write("\n")

            with open("wordList.txt","a", encoding='utf-8', errors='ignore') as words:
                words.write(line)
                words.write("\n")