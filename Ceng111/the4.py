def query(x,y):
    if len(x[0]) == 1:
        return x[0:]
    else:
        if x[0][0] == "in":
            a = x[0][1]
            for i in range(0,len(y)) :
                if y[i][0] == a:
                    b = y[i][1]
                    if b in x[0][2]:
                        return query(x[1],y)
                    else :
                        return query(x[2],y) 
        elif x[0][0] == "==":
            if type(x[0][2]) == int or type(x[0][2]) == float:
                a = x[0][1]
                for i in range(0,len(y)) :
                    if y[i][0] == a:
                        b = y[i][1]
                        if b == x[0][2]:
                            return query(x[1],y)
                        else :
                            return query(x[2],y)
            elif type(x[0][1]) == int or type(x[0][1]) == float:
                a = x[0][2]
                for i in range(0,len(y)) :
                    if y[i][0] == a:
                        b = y[i][1]
                        if x[0][1] == b:
                            return query(x[1],y)
                        else :
                            return query(x[2],y)
        elif x[0][0] == "!=":
            if type(x[0][2]) == int or type(x[0][2]) == float:
                a = x[0][1]
                for i in range(0,len(y)) :
                    if y[i][0] == a:
                        b = y[i][1]
                        if b != x[0][2]:
                            return query(x[1],y)
                        else :
                            return query(x[2],y)
            elif type(x[0][1]) == int or type(x[0][1]) == float:
                a = x[0][2]
                for i in range(0,len(y)) :
                    if y[i][0] == a:
                        b = y[i][1]
                        if x[0][1] != b:
                            return query(x[1],y)
                        else :
                            return query(x[2],y)
        elif x[0][0] == "<":
            if type(x[0][2]) == int or type(x[0][2]) == float:
                a = x[0][1]
                for i in range(0,len(y)) :
                    if y[i][0] == a:
                        b = y[i][1]
                        if b < x[0][2]:
                            return query(x[1],y)
                        else :
                            return query(x[2],y)
            elif type(x[0][1]) == int or type(x[0][1]) == float:
                a = x[0][2]
                for i in range(0,len(y)) :
                    if y[i][0] == a:
                        b = y[i][1]
                        if x[0][1] < b:
                            return query(x[1],y)
                        else :
                            return query(x[2],y)
        elif x[0][0] == ">":
            if type(x[0][2]) == int or type(x[0][2]) == float:
                a = x[0][1]
                for i in range(0,len(y)) :
                    if y[i][0] == a:
                        b = y[i][1]
                        if b > x[0][2]:
                            return query(x[1],y)
                        else :
                            return query(x[2],y)
            elif type(x[0][1]) == int or type(x[0][1]) == float:
                a = x[0][2]
                for i in range(0,len(y)) :
                    if y[i][0] == a:
                        b = y[i][1]
                        if x[0][1] > b:
                            return query(x[1],y)
                        else :
                            return query(x[2],y)
        elif x[0][0] == "not":
            if x[0][1][0] == "!=":
                a = x[0][1][1]
                for i in range(0,len(y)) :
                    if y[i][0] == a:
                        b = y[i][1]
                        if b != x[0][1][2]:
                            return query(x[2],y)
                        else :
                            return query(x[1],y)
            elif x[0][1][0] == "==":
                a = x[0][1][1]
                for i in range(0,len(y)) :
                    if y[i][0] == a:
                        b = y[i][1]
                        if b == x[0][1][2]:
                            return query(x[2],y)
                        else :
                            return query(x[1],y)
            elif x[0][1][0] == "<":
                a = x[0][1][1]
                for i in range(0,len(y)) :
                    if y[i][0] == a:
                        b = y[i][1]
                        if b < x[0][1][2]:
                            return query(x[2],y)
                        else:
                            return query(x[1],y)
            elif x[0][1][0] == ">":
                a = x[0][1][1]
                for i in range(0,len(y)) :
                    if y[i][0] == a:
                        b = y[i][1]
                        if b > x[0][1][2]:
                            return query(x[2],y)
                        else:
                            return query(x[1],y)
            elif x[0][1][0] == "in":
                a = x[0][1][1]
                for i in range(0,len(y)) :
                    if y[i][0] == a:
                        b = y[i][1]
                        if b in x[0][1][2]:
                            return query(x[2],y)
                        else :
                            return query(x[1],y)
        elif x[0][0] == "and":
            L = []
            for k in range(1,len(x[0])):
                if x[0][k][0] == ">":
                    a = x[0][k][1]
                    for i in range(0,len(y)):
                        if y[i][0] == a:
                            b = y[i][1]
                            if b > x[0][k][2]:
                                L.append("true")
                            else:
                                L.append("false")
                elif x[0][k][0] == "<":
                    a = x[0][k][1]
                    for i in range(0,len(y)) :
                        if y[i][0] == a:
                            b = y[i][1]
                            if b < x[0][k][2]:
                                L.append("true")
                            else:
                                L.append("false")
                elif x[0][k][0] == "!=":
                    a = x[0][k][1]
                    for i in range(0,len(y)) :
                        if y[i][0] == a:
                            b = y[i][1]
                            if b != x[0][k][2]:
                                L.append("true")
                            else :
                                L.append("false")
                elif x[0][k][0] == "==":
                    a = x[0][k][1]
                    for i in range(0,len(y)) :
                        if y[i][0] == a:
                            b = y[i][1]
                            if b == x[0][k][2]:
                                L.append("true")
                            else :
                                L.append("false")
                elif x[0][k][0] == "not":
                    if x[0][k][1][0] == "!=":
                        a = x[0][k][1][1]
                        for i in range(0,len(y)) :
                            if y[i][0] == a:
                                b = y[i][1]
                                if b != x[0][k][1][2]:
                                    L.append("false")
                                else :
                                    L.append("true")
                    elif x[0][k][1][0] == "==":
                        a = x[0][k][1][1]
                        for i in range(0,len(y)) :
                            if y[i][0] == a:
                                b = y[i][1]
                                if b == x[0][k][1][2]:
                                    L.append("false")
                                else :
                                    L.append("true")
                    elif x[0][k][1][0] == "<":
                        a = x[0][k][1][1]
                        for i in range(0,len(y)) :
                            if y[i][0] == a:
                                b = y[i][1]
                                if b < x[0][k][1][2]:
                                    L.append("false")
                                else:
                                    L.append("true")
                    elif x[0][k][1][0] == ">":
                        a = x[0][k][1][1]
                        for i in range(0,len(y)) :
                            if y[i][0] == a:
                                b = y[i][1]
                                if b > x[0][k][1][2]:
                                    L.append("false")
                                else:
                                    L.append("true")
            if L.count("true") == len(L):
                return query(x[1],y)
            else :
                return query(x[2],y)
        
        elif x[0][0] == "or":
            T = []
            for k in range(1,len(x[0])):
                if x[0][k][0] == ">":
                    a = x[0][k][1]
                    for i in range(0,len(y)):
                        if y[i][0] == a:
                            b = y[i][1]
                            if b > x[0][k][2]:
                                T.append("true")
                            else:
                                T.append("false")
                elif x[0][k][0] == "<":
                    a = x[0][k][1]
                    for i in range(0,len(y)) :
                        if y[i][0] == a:
                            b = y[i][1]
                            if b < x[0][k][2]:
                                T.append("true")
                            else:
                                T.append("false")
                elif x[0][k][0] == "!=":
                    a = x[0][k][1]
                    for i in range(0,len(y)) :
                        if y[i][0] == a:
                            b = y[i][1]
                            if b != x[0][k][2]:
                                T.append("true")
                            else :
                                T.append("false")
                elif x[0][k][0] == "==":
                    a = x[0][k][1]
                    for i in range(0,len(y)) :
                        if y[i][0] == a:
                            b = y[i][1]
                            if b == x[0][k][2]:
                                T.append("true")
                            else :
                                T.append("false")
                elif x[0][k][0] == "not":
                    if x[0][k][1][0] == "!=":
                        a = x[0][k][1][1]
                        for i in range(0,len(y)) :
                            if y[i][0] == a:
                                b = y[i][1]
                                if b != x[0][k][1][2]:
                                    T.append("false")
                                else :
                                    T.append("true")
                    elif x[0][k][1][0] == "==":
                        a = x[0][k][1][1]
                        for i in range(0,len(y)) :
                            if y[i][0] == a:
                                b = y[i][1]
                                if b == x[0][k][1][2]:
                                    T.append("false")
                                else :
                                    T.append("true")
                    elif x[0][k][1][0] == "<":
                        a = x[0][k][1][1]
                        for i in range(0,len(y)) :
                            if y[i][0] == a:
                                b = y[i][1]
                                if b < x[0][k][1][2]:
                                    T.append("false")
                                else:
                                    T.append("true")
                    elif x[0][k][1][0] == ">":
                        a = x[0][k][1][1]
                        for i in range(0,len(y)) :
                            if y[i][0] == a:
                                b = y[i][1]
                                if b > x[0][k][1][2]:
                                    T.append("false")
                                else:
                                    T.append("true")
            if T.count("false") == len(T):
                    return query(x[2],y)
            else :
                    return query(x[1],y)
        

        
            
    
            
        
        
