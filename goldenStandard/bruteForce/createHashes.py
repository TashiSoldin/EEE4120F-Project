from hashlib import md5

# Hash all the passwords from the brute force password list. This function is used for testing purposes only
with open("passwordList.txt", "r") as passwords:
    with open("hashedPaswords.txt", "w") as hashes:
        for line in passwords.readlines():
            line = line.strip()
            hashes.write(md5(line.encode('utf-8')).hexdigest())
            hashes.write("\n")

