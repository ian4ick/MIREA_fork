import pandas as pd

incr = pd.read_csv("wns.csv")["Incr (ns)"]
incr = incr.fillna(0)
ans = 0
for inc in incr:
    inc = str(inc)
    if inc.find("(") == 0:
        ans += float(inc[inc.find(" ")+1:])
    else:
        ans += float(inc)

print(ans)