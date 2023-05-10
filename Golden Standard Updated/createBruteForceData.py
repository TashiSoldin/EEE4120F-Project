
import itertools
import string    
import time 

start_range = 4
end_range = 5
file_name = "passwordList.txt"

chars = string.ascii_lowercase + string.ascii_uppercase + string.digits
attempts = 0

try:

    f = open(file_name,'a')

except FileNotFoundError:
    print(f"File '{file_name}' not found!")

else:
    print("Found File")
    start_time = time.time()

    for password_length in range(start_range, end_range):
        for guess in itertools.product(chars,repeat=password_length): 
            attempts += 1
            guess = ''.join(guess)
            f.write(guess)
            f.write("\n")
            # print(guess, attempts)
        print("Done with length ",password_length)
    f.close()

    end_time = time.time()

print(end_time-start_time)