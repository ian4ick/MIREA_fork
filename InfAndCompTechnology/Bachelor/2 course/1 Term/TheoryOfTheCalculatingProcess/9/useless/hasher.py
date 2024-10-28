import hashlib

def get_md5_of_string(input_string):
    return hashlib.md5(input_string.encode()).hexdigest()

file_path = r"/hashed_text_file.txt"
f = open(file_path, "r")
s = f.read()
f.close()
del f
s = get_md5_of_string(s)
print("from py: " + s)
f = open(file_path, "w")
f.write(s)
f.close()
del f
exit(0)