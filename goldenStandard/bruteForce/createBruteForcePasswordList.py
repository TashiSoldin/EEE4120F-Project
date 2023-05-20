import itertools
import string    
import time 

# Define length of passwords to generate ande define text file name
start_range = 4
end_range = 5
file_name = "passwordList.txt"

# Define the characters to loop through
chars = string.ascii_lowercase + string.ascii_uppercase + string.digits
attempts = 0
f = open(file_name,'a')

# Begin timer
start_time = time.time()

# Iterate and generate passwords
for password_length in range(start_range, end_range):
    for guess in itertools.product(chars,repeat=password_length): 
        attempts += 1
        guess = ''.join(guess)
        f.write(guess)
        f.write("\n")
        #print(guess, attempts)
    print("Done with length ",password_length)
f.close()

# Stop timer
end_time = time.time()

print(end_time-start_time)
