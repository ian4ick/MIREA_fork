def main(string):
    strings = string.split(";")[:-1]
    ans = []
    for line in strings:
        func_name = line[line.find("#") + 1: line.find("==")].strip()
        func_res = line[
            line.find('@"') + 2: line.find('"', line.find('@"') + 2)
        ].strip()
        ans.append((func_res, int(func_name)))
    return ans
