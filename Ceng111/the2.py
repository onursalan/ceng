while "true" :
    
    x = raw_input("Please enter an id: ")
    if x[7] == "?":
        if len(str(2*int(x[1]))) > 1:
            a = 2*int(x[1])%10+1
        else :
            a = 2*int(x[1])
        if len(str(2*int(x[3]))) > 1:
            b = 2*int(x[3])%10+1
        else :
            b = 2*int(x[3])
        if len(str(2*int(x[5]))) > 1:
            c = 2*int(x[5])%10+1
        else :
            c = 2*int(x[5])
        t = int(x[0])+a+int(x[2])+b+int(x[4])+c
        if t%10 == 0:
            l = t
            l = 0
            print x[0]+x[1]+x[2]+x[3]+x[4]+x[5]+x[6]+ str(l)
        else:
            l = 10 - t%10
            print x[0]+x[1]+x[2]+x[3]+x[4]+x[5]+x[6]+ str(l)
    elif x[0] == "?":
        if len(str(2*int(x[1]))) > 1:
            a = 2*int(x[1])%10+1
        else :
            a = 2*int(x[1])
        if len(str(2*int(x[3]))) > 1:
            b = 2*int(x[3])%10+1
        else :
            b = 2*int(x[3])
        if len(str(2*int(x[5]))) > 1:
            c = 2*int(x[5])%10+1
        else :
            c = 2*int(x[5])
        t = int(x[7])+a+int(x[2])+b+int(x[4])+c
        if t%10 == 0:
            m = t
            m = 0
            print str(m)+x[1]+x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
        else:
            m = 10 - t%10
            print str(m)+x[1]+x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
    elif x[2] == "?":
        if len(str(2*int(x[1]))) > 1:
            a = 2*int(x[1])%10+1
        else :
            a = 2*int(x[1])
        if len(str(2*int(x[3]))) > 1:
            b = 2*int(x[3])%10+1
        else :
            b = 2*int(x[3])
        if len(str(2*int(x[5]))) > 1:
            c = 2*int(x[5])%10+1
        else :
            c = 2*int(x[5])
        t = int(x[7])+a+int(x[0])+b+int(x[4])+c
        if t%10 == 0:
            r = t
            r = 0
            print x[0]+x[1]+str(r)+x[3]+x[4]+x[5]+x[6]+x[7]
        else:
            r = 10 - t%10
            print x[0]+x[1]+str(r)+x[3]+x[4]+x[5]+x[6]+x[7]
    elif x[4] == "?":
        if len(str(2*int(x[1]))) > 1:
            a = 2*int(x[1])%10+1
        else :
            a = 2*int(x[1])
        if len(str(2*int(x[3]))) > 1:
            b = 2*int(x[3])%10+1
        else :
            b = 2*int(x[3])
        if len(str(2*int(x[5]))) > 1:
            c = 2*int(x[5])%10+1
        else :
            c = 2*int(x[5])
        t = int(x[7])+a+int(x[0])+b+int(x[2])+c
        if t%10 == 0:
            e = t
            e = 0
            print x[0]+x[1]+x[2]+x[3]+str(e)+x[5]+x[6]+x[7]
        else:
            e = 10 - t%10
            print x[0]+x[1]+x[2]+x[3]+str(e)+x[5]+x[6]+x[7]

    elif x[1] == "?":
        if len(str(2*int(x[3]))) > 1:
            b = 2*int(x[3])%10+1
        else :
            b = 2*int(x[3])
        if len(str(2*int(x[5]))) > 1:
            c = 2*int(x[5])%10+1
        else :
            c = 2*int(x[5])
        t = int(x[7])+int(x[4])+int(x[0])+b+int(x[2])+c
        if t%10 == 0:
            n = t
            n = 0
            if n == 0 or n == 2 or n == 4 or n == 6 or n == 8:
                print x[0]+str(n/2)+x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
            elif n == 1:
                print x[0]+ "5" +x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
            elif n == 3: 
                print x[0]+ "6" +x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
            elif n == 5: 
                print x[0]+ "7" +x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
            elif n == 7: 
                print x[0]+ "8" +x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
            elif n == 9: 
                print x[0]+ "9" +x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
        
        else:
            n = 10 - t%10
            if n == 0 or n == 2 or n == 4 or n == 6 or n == 8:
                print x[0]+str(n/2)+x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
            elif n == 1:
                print x[0]+ "5" +x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
            elif n == 3: 
                print x[0]+ "6" +x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
            elif n == 5: 
                print x[0]+ "7" +x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
            elif n == 7: 
                print x[0]+ "8" +x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
            elif n == 9: 
                print x[0]+ "9" +x[2]+x[3]+x[4]+x[5]+x[6]+x[7]

    elif x[3] == "?":
        if len(str(2*int(x[1]))) > 1:
            b = 2*int(x[1])%10+1
        else :
            b = 2*int(x[1])
        if len(str(2*int(x[5]))) > 1:
            c = 2*int(x[5])%10+1
        else :
            c = 2*int(x[5])
        t = int(x[7])+int(x[4])+int(x[0])+b+int(x[2])+c
        if t%10 == 0:
            n = t
            n = 0
            if n == 0 or n == 2 or n == 4 or n == 6 or n == 8:
                print x[0]+x[1]+x[2]+str(n/2)+x[4]+x[5]+x[6]+x[7]
            elif n == 1:
                print x[0]+x[1]+x[2]+ "5" +x[4]+x[5]+x[6]+x[7]
            elif n == 3: 
                print x[0]+x[1]+x[2]+ "6" +x[4]+x[5]+x[6]+x[7]
            elif n == 5: 
                print x[0]+x[1]+x[2]+ "7" +x[4]+x[5]+x[6]+x[7]
            elif n == 7: 
                print x[0]+x[1]+x[2]+ "8" +x[4]+x[5]+x[6]+x[7]
            elif n == 9: 
                print x[0]+x[1]+x[2]+ "9" +x[4]+x[5]+x[6]+x[7]
        
        else:
            n = 10 - t%10
            if n == 0 or n == 2 or n == 4 or n == 6 or n == 8:
                print x[0]+x[1]+x[2]+str(n/2)+x[4]+x[5]+x[6]+x[7]
            elif n == 1:
                print x[0]+x[1]+x[2]+ "5" +x[4]+x[5]+x[6]+x[7]
            elif n == 3: 
                print x[0]+x[1]+x[2]+ "6" +x[4]+x[5]+x[6]+x[7]
            elif n == 5: 
                print x[0]+x[1]+x[2]+ "7" +x[4]+x[5]+x[6]+x[7]
            elif n == 7: 
                print x[0]+x[1]+x[2]+ "8" +x[4]+x[5]+x[6]+x[7]
            elif n == 9: 
                print x[0]+x[1]+x[2]+ "9" +x[4]+x[5]+x[6]+x[7]

    elif x[5] == "?":
        if len(str(2*int(x[1]))) > 1:
            b = 2*int(x[1])%10+1
        else :
            b = 2*int(x[1])
        if len(str(2*int(x[3]))) > 1:
            c = 2*int(x[3])%10+1
        else :
            c = 2*int(x[3])
        t = int(x[7])+int(x[4])+int(x[0])+b+int(x[2])+c
        if t%10 == 0:
            n = t
            n = 0
            if n == 0 or n == 2 or n == 4 or n == 6 or n == 8:
                print x[0]+x[1]+x[2]+x[3]+x[4]+str(n/2)+x[6]+x[7]
            elif n == 1:
                print x[0]+x[1]+x[2]+x[3]+x[4]+ "5" +x[6]+x[7]
            elif n == 3: 
                print x[0]+x[1]+x[2]+x[3]+x[4]+ "6" +x[6]+x[7]
            elif n == 5: 
                print x[0]+x[1]+x[2]+x[3]+x[4]+ "7" +x[6]+x[7]
            elif n == 7: 
                print x[0]+x[1]+x[2]+x[3]+x[4]+ "8" +x[6]+x[7]
            elif n == 9: 
                print x[0]+x[1]+x[2]+x[3]+x[4]+ "9" +x[6]+x[7]
        
        else:
            n = 10 - t%10
            if n == 0 or n == 2 or n == 4 or n == 6 or n == 8:
                print x[0]+x[1]+x[2]+x[3]+x[4]+str(n/2)+x[6]+x[7]
            elif n == 1:
                print x[0]+x[1]+x[2]+x[3]+x[4]+ "5" +x[6]+x[7]
            elif n == 3: 
                print x[0]+x[1]+x[2]+x[3]+x[4]+ "6" +x[6]+x[7]
            elif n == 5: 
                print x[0]+x[1]+x[2]+x[3]+x[4]+ "7" +x[6]+x[7]
            elif n == 7: 
                print x[0]+x[1]+x[2]+x[3]+x[4]+ "8" +x[6]+x[7]
            elif n == 9: 
                print x[0]+x[1]+x[2]+x[3]+x[4]+ "9" +x[6]+x[7]
    else:
        if len(str(2*int(x[1]))) > 1:
            a = 2*int(x[1])%10+1
        else :
            a = 2*int(x[1])
        if len(str(2*int(x[3]))) > 1:
            b = 2*int(x[3])%10+1
        else :
            b = 2*int(x[3])
        if len(str(2*int(x[5]))) > 1:
            c = 2*int(x[5])%10+1
        else :
            c = 2*int(x[5])
        t = int(x[0])+a+int(x[2])+b+int(x[4])+c
        if t%10 == 0:
            v = t
            v = 0
        else:
            v = 10 - t%10
        if int(x[7]) == v:
            print "VALID"
        else:
            print "INVALID"

