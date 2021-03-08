def hyphenate(a):
    vowel1 = "e"
    vowel2 = "a"
    vowel3 = "i"
    vowel4 = "I"
    vowel5 = "o"
    vowel6 = "O"
    vowel7 = "u"
    vowel8 = "U"
    pivot = 0
    L = []
    while vowel1 != a[pivot] and vowel2 != a[pivot] and vowel3 != a[pivot] and vowel4 != a[pivot] and vowel5 != a[pivot] and vowel6 != a[pivot] and vowel7 != a[pivot] and vowel8 != a[pivot] :
        if pivot < len(a)-1:
            pivot = pivot +1
        else :
            L.append(a[:pivot+1])
            return L
            break
    if vowel1 == a[pivot] or vowel2 == a[pivot] or vowel3 == a[pivot] or vowel4 == a[pivot] or vowel5 == a[pivot] or vowel6 == a[pivot] or vowel7 == a[pivot] or vowel8 == a[pivot] :
        if pivot < len(a)-1:
            pivot = pivot +1
        else :
            L.append(a[:pivot+1])
            return L
        if vowel1 == a[pivot] or vowel2 == a[pivot] or vowel3 == a[pivot] or vowel4 == a[pivot] or vowel5 == a[pivot] or vowel6 == a[pivot] or vowel7 == a[pivot] or vowel8 == a[pivot] :
            L.append(a[:pivot])
            return L + hyphenate(a[pivot:])
        while vowel1 != a[pivot] and vowel2 != a[pivot] and vowel3 != a[pivot] and vowel4 != a[pivot] and vowel5 != a[pivot] and vowel6 != a[pivot] and vowel7 != a[pivot] and vowel8 != a[pivot] :
            if pivot < len(a)-1:
                pivot = pivot +1
            else :
                L.append(a[:pivot+1])
                return L
                break
        if vowel1 == a[pivot] or vowel2 == a[pivot] or vowel3 == a[pivot] or vowel4 == a[pivot] or vowel5 == a[pivot] or vowel6 == a[pivot] or vowel7 == a[pivot] or vowel8 == a[pivot] :
            L.append(a[:pivot-1])
            return L + hyphenate(a[pivot-1:])
def execute():
    L = []
    while True:
        a = raw_input("")
        if a == "=":
            break
        c = hyphenate(a)
        L.append(c)
        print L


