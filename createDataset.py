
with open("rockyou.txt", "r", encoding='utf-8', errors='ignore') as rockYouPasswords:
    with open("dictionaryPasswordList.txt","w", encoding='utf-8', errors='ignore') as passwords:
        
        for line in rockYouPasswords.readlines():
            line = line.strip()

            if len(line) == 4:
                passwords.write(line)
                passwords.write("\n")





