from hashlib import md5

with open("passwordList.txt", "r") as passwords:
    with open("hashedPaswords.txt", "w") as hashes:
        for line in passwords.readlines():
            line = line.strip()
            hashes.write(md5(line.encode('utf-8')).hexdigest())
            hashes.write("\n")

