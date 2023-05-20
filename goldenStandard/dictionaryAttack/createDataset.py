
with open("rockyou.txt", "r") as rockYouPasswords:
    with open("dictionaryPasswordList.txt","w") as passwords:
        for line in rockYouPasswords.readlines():
            line = line.strip()

            if len(line) == 4:
                passwords.write(line)
                passwords.write("\n")


