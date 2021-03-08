module Hw2 where

data ASTResult = ASTError String | ASTJust (String, String, Int) deriving (Show, Read)
data ASTDatum = ASTSimpleDatum String | ASTLetDatum String deriving (Show, Read)
data AST = EmptyAST | ASTNode ASTDatum AST AST deriving (Show, Read)

isNumber :: String -> Bool
eagerEvaluation :: AST -> ASTResult
normalEvaluation :: AST -> ASTResult
-- DO NOT MODIFY OR DELETE THE LINES ABOVE -- 
-- IMPLEMENT isNumber, eagerEvaluation and normalEvaluation FUNCTIONS ACCORDING TO GIVEN SIGNATURES -- 



isNumber (a:b) = checkfirst(a:b) && (if b /= [] then checkother(b) else True)
isNumber "" = False



checkfirst :: String -> Bool
checkfirst (a:b) = if a == '0' || a == '1' || a == '2' || a == '3' || a == '4' || a == '5' || a == '6' || a == '7' || a == '8' || a == '9' then True else ( if  a == '-'  then (if b /= [] then True else False) else False )

checkother :: String -> Bool
checkother (a:b) =  if a == '0' || a == '1' || a == '2' || a == '3' || a == '4' || a == '5' || a == '6' || a == '7' || a == '8' || a == '9' then (True && (if b /= [] then checkother(b) else True)) else (False && (if b /= [] then checkother(b) else True))

test :: AST -> Bool

test(ASTNode (ASTSimpleDatum a) _ _) = False
test(ASTNode (ASTLetDatum a) _ _) =True


second(ASTNode (ASTSimpleDatum a) _ _) = a
second(ASTNode (ASTLetDatum a) _ _) = a
third(ASTNode _ l _) = l
fourth(ASTNode _ _ r) = r


normalEvaluation (ASTNode (ASTSimpleDatum x) EmptyAST EmptyAST) = ASTError x
normalEvaluation (ASTNode (ASTSimpleDatum x) EmptyAST r) | x == "num" = if isNumber(second(r)) then ASTError x else ASTError("the value " ++ "'"  ++ second(r) ++ "'" ++ " is not a number!")
                                                            | x == "negate" = if isNumber1(r) then (if isNumber(second(third(r))) then ASTError x else ASTError ("the value " ++ "'" ++ second(third(r)) ++ "'" ++ " is not a number!")) else ASTError("negate operation is not defined on str!")
                                                         | x == "len" = if isNumber1(r) then (if isNumber(second(third(r))) then ASTError("len operation is not defined on num!") else ASTError("the value " ++ "'" ++ second(third(r)) ++ "'" ++ " is not a number!")) else ASTError x
                                                            | x == "str" = if isNumber1(r) then ASTError("the value " ++ "'" ++ second(r) ++ "'" ++ " is not a string!") else ASTError x
normalEvaluation (ASTNode (ASTSimpleDatum x) l r) | x == "plus" = if isstr(l) && isstr (r) then ASTError ("plus operation is not defined between str and str!") else (if isstr(l) then ASTError ("plus operation is not defined between str and num!") else (if isstr(r) then ASTError("plus operation is not defined between num and str!") else (if not(isNumber(second(third(l))))&&not(isNumber(second(third(r)))) then ASTError ("the values " ++ "'" ++ second(third(l)) ++ "'"++ " and " ++ "'" ++ second(third(r)) ++ "'" ++ " are not numbers!")      else (if not(isNumber(second(third(l)))) then ASTError("the value " ++ "'" ++ second(third(l)) ++ "'" ++ " is not a number!") else (if not(isNumber(second(third(r)))) then ASTError("the value " ++ "'" ++ second(third(r)) ++ "'" ++ " is not a number!") else ASTError "oldu")))))
                                                   | x == "cat" =   if isNumber1(l) && isNumber1 (r) then ASTError("cat operation is not defined between num and num!") else (if isNumber1(l) then ASTError("cat operation is not defined between num and str!") else (if isNumber1(r) then ASTError("cat operation is not defined between str and num!") else ASTError("oldu")))
                                                   | x == "times" =  if isstr(l) && isstr (r) then ASTError("times operation is not defined between str and str!") else (if isstr(l) then ASTError("times operation is not defined between str and num!") else (if isstr(r) then ASTError("times operation is not defined between num and str!") else (if isNumber(second(third(r)))&&isNumber(second(third(r))) then ASTError("the values " ++ "'" ++ second(third(l)) ++ "'"++ " and " ++ "'" ++ second(third(r)) ++ "'" ++ " are not numbers!")  else (if not(isNumber(second(third(l)))) then ASTError("the value " ++ "'" ++ second(third(l)) ++ "'" ++ " is not a number!") else (if not(isNumber(second(third(r)))) then ASTError("the value " ++ "'" ++ second(third(r)) ++ "'" ++ " is not a number!") else ASTError "oldu")))))
normalEvaluation (ASTNode (ASTSimpleDatum x) l EmptyAST) | x == "num" =if isNumber(second(l)) then ASTError x else ASTError("the value " ++ "'" ++ second(l) ++ "'" ++ " is not a number!")
                                                           | x == "negate" = if isNumber1(l) then (if isNumber(second(third(l))) then ASTError x else ASTError ("the value " ++ "'" ++ second(third(l)) ++ "'" ++ " is not a number!")) else ASTError("negate operation is not defined on str!")
                                                           | x == "len" = if isNumber1(l) then (if isNumber(second(third(l))) then ASTError("len operation is not defined on num!") else ASTError("the value " ++ "'" ++ second(third(l)) ++ "'" ++ " is not a number!")) else ASTError x
                                                           | x == "str" = if isNumber1(l) then ASTError ("the value " ++ "'" ++ second(l) ++ "'" ++ " is not a string!") else ASTError x
normalEvaluation (ASTNode (ASTLetDatum x) l r) = if test(r) then if isNumber(evaluateAST(exchangewith(fourth(r),second(r),evaluateAST(third(r))))) then ASTJust(evaluateAST(exchangewith(fourth(r),second(r),evaluateAST(third(r)))),"num",islemsayisi(fourth(r),(lazycal(fourth(r),second(r),islemsayisi(third(r),0),0)))) else ASTJust(evaluateAST(exchangewith(fourth(r),second(r),evaluateAST(third(r)))),"str",islemsayisi(fourth(r),(lazycal(fourth(r),second(r),islemsayisi(third(r),0),0))))  else ( if isNumber(evaluateAST(exchangewith(r ,x,evaluateAST(l)))) then  ASTJust(evaluateAST(exchangewith(r ,x,evaluateAST(l))),"num",islemsayisi(r,(lazycal(r,x,islemsayisi(l,0),0)))) else ASTJust(evaluateAST(exchangewith(r ,x,evaluateAST(l))),"str",islemsayisi(r,(lazycal(r,x,islemsayisi(l,0),0)))))



eagerEvaluation (ASTNode (ASTSimpleDatum x) EmptyAST EmptyAST) = ASTError x
eagerEvaluation (ASTNode (ASTSimpleDatum x) EmptyAST r) | x == "num" = if isNumber(second(r)) then ASTError x else ASTError("the value " ++ "'" ++ second(r) ++ "'" ++ " is not a number!")
                                                            | x == "negate" = if isNumber1(r) then (if isNumber(second(third(r))) then ASTError x else ASTError ("the value " ++ "'" ++ second(third(r)) ++ "'" ++ " is not a number!")) else ASTError("negate operation is not defined on str!")
                                                            | x == "len" = if isNumber1(r) then (if isNumber(second(third(r))) then ASTError("len operation is not defined on num!") else ASTError("the value " ++ "'" ++ second(third(r)) ++ "'" ++ " is not a number!")) else ASTError x
                                                            | x == "str" = if isNumber1(r) then ASTError("the value " ++ "'" ++ second(r) ++ "'" ++ " is not a string!") else ASTError x
eagerEvaluation (ASTNode (ASTSimpleDatum x) l r) | x == "plus" = if isstr(l) && isstr (r) then ASTError ("plus operation is not defined between str and str!") else (if isstr(l) then ASTError ("plus operation is not defined between str and num!") else (if isstr(r) then ASTError("plus operation is not defined between num and str!") else (if not(isNumber(second(third(l))))&&not(isNumber(second(third(r)))) then ASTError ("the values " ++ "'" ++ second(third(l)) ++ "'"++ " and " ++ "'" ++ second(third(r)) ++ "'" ++ " are not numbers!")      else (if not(isNumber(second(third(l)))) then ASTError("the value " ++ "'" ++ second(third(l)) ++ "'" ++ " is not a number!") else (if not(isNumber(second(third(r)))) then ASTError("the value " ++ "'" ++ second(third(r)) ++ "'" ++ " is not a number!") else ASTError "oldu")))))
                                                  | x == "cat" =  if isNumber1(l) && isNumber1 (r) then ASTError("cat operation is not defined between num and num!") else (if isNumber1(l) then ASTError("cat operation is not defined between num and str!") else (if isNumber1(r) then ASTError("cat operation is not defined between str and num!") else ASTError("oldu")))
                                                  | x == "times" =  if isstr(l) && isstr (r) then ASTError("times operation is not defined between str and str!") else (if isstr(l) then ASTError("times operation is not defined between str and num!") else (if isstr(r) then ASTError("times operation is not defined between num and str!") else (if isNumber(second(third(r)))&&isNumber(second(third(r))) then ASTError("the values " ++ "'" ++ second(third(l)) ++ "'"++ " and " ++ "'" ++ second(third(r)) ++ "'" ++ " are not numbers!")  else (if not(isNumber(second(third(l)))) then ASTError("the value " ++ "'" ++ second(third(l)) ++ "'" ++ " is not a number!") else (if not(isNumber(second(third(r)))) then ASTError("the value " ++ "'" ++ second(third(r)) ++ "'" ++ " is not a number!") else ASTError "oldu")))))


eagerEvaluation (ASTNode (ASTSimpleDatum x) l EmptyAST) | x == "num" = if isNumber(second(l)) then ASTError x else ASTError("the value " ++ "'" ++ second(l) ++ "'" ++ " is not a number!")
                                                           | x == "negate" = if isNumber1(l) then (if isNumber(second(third(l))) then ASTError x else ASTError ("the value " ++ "'" ++ second(third(l)) ++ "'" ++ " is not a number!")) else ASTError("negate operation is not defined on str!")
                                                          | x == "len" = if isNumber1(l) then (if isNumber(second(third(l))) then ASTError("len operation is not defined on num!") else ASTError("the value " ++ "'" ++ second(third(l)) ++ "'" ++ " is not a number!")) else ASTError x
                                                        | x == "str" = if isNumber1(l) then ASTError ("the value " ++ "'" ++ second(l) ++ "'" ++ " is not a string!") else ASTError x
eagerEvaluation (ASTNode (ASTLetDatum x) l r) = if test(r) then if isNumber(evaluateAST(exchangewith(fourth(r),second(r),evaluateAST(third(r))))) then ASTJust(evaluateAST(exchangewith(fourth(r),second(r),evaluateAST(third(r)))),"num",(islemsayisi(third(r),0)+islemsayisi(fourth(r),0)+islemsayisi(l,0))) else ASTJust(evaluateAST(exchangewith(fourth(r),second(r),evaluateAST(third(r)))),"str",(islemsayisi(third(r),0)+islemsayisi(fourth(r),0)+islemsayisi(l,0)))  else ( if isNumber(evaluateAST(exchangewith(r ,x,evaluateAST(l)))) then  ASTJust(evaluateAST(exchangewith(r ,x,evaluateAST(l))),"num",islemsayisi(r,0)+islemsayisi(l,0)) else ASTJust(evaluateAST(exchangewith(r ,x,evaluateAST(l))),"str",islemsayisi(r,0)+islemsayisi(l,0)))


isstr :: AST -> Bool

isstr (ASTNode (ASTSimpleDatum x) l EmptyAST) = if x == "str" then (if isNumber(second(l)) then True else False ) else False
isstr (ASTNode (ASTSimpleDatum x) EmptyAST r) = if x == "str" then (if isNumber(second(r)) then True else False ) else False
isstr (ASTNode (ASTSimpleDatum x) l r) = isstr(l) && isstr(r)

isNumber1 :: AST-> Bool

isNumber1 (ASTNode (ASTSimpleDatum x) l EmptyAST) = if x == "num" then True else False
isNumber1 (ASTNode (ASTSimpleDatum x) EmptyAST r) = if x == "num" then True else False
isNumber1 (ASTNode (ASTSimpleDatum x) l r) = isNumber1(l) && isNumber1(r)

evaluateAST :: (AST) -> String
evaluateAST (ASTNode (ASTSimpleDatum b) l r ) = (writeExpression1(ASTNode (ASTSimpleDatum b) l r))

writeExpressionL1 :: (AST) -> String
writeExpressionL1 (ASTNode (ASTSimpleDatum a) EmptyAST EmptyAST ) = a
writeExpressionL1 (ASTNode (ASTSimpleDatum b) l EmptyAST ) | b == "num" = show(read (writeExpressionL1(l)) :: Int) 
                                            | b == "negate" = show (0 - read (writeExpressionL1(l)) :: Int) 
                                            | b == "len" = show(length(writeExpressionL1(l))) 
                                            | b == "str" = writeExpressionL1(l)
writeExpressionL1 (ASTNode (ASTSimpleDatum b) EmptyAST r ) | b == "num" = show(read (writeExpressionR1(r)) :: Int) 
                                            | b == "negate" = show (0 - read (writeExpressionR1(r)) :: Int) 
                                            | b == "len" = show(length(writeExpressionR1(r))) 
                                            | b == "str" = writeExpressionR1(r)
writeExpressionL1 (ASTNode (ASTSimpleDatum b) l r ) | b == "plus" =  show (read (writeExpressionL1(l)) + read (writeExpressionR1(r)))
                                    | b == "times" =  show (read (writeExpressionL1(l)) * read (writeExpressionR1(r)))
                                    | b == "cat" = writeExpressionL1(l) ++ writeExpressionR1(r) 
                                    | b == "len" = show(length(writeExpressionL1(l) ++ writeExpressionR1(r))) 

writeExpressionR1 :: (AST) -> String
writeExpressionR1 (ASTNode (ASTSimpleDatum a) EmptyAST EmptyAST ) = a
writeExpressionR1 (ASTNode (ASTSimpleDatum b) l EmptyAST ) | b == "num" = show(read (writeExpressionL1(l)) :: Int) 
                                            | b == "negate" = show (0 - read (writeExpressionL1(l)) :: Int) 
                                            | b == "len" = show(length(writeExpressionL1(l))) 
                                            | b == "str" = writeExpressionL1(l)
writeExpressionR1 (ASTNode (ASTSimpleDatum b) EmptyAST r ) | b == "num" = show(read (writeExpressionR1(r)) :: Int) 
                                            | b == "negate" = show (0 - read (writeExpressionR1(r)) :: Int) 
                                            | b == "len" = show(length(writeExpressionR1(r))) 
                                            | b == "str" = writeExpressionR1(r) 
writeExpressionR1 (ASTNode (ASTSimpleDatum b) l r ) | b == "plus" =  show (read (writeExpressionL1(l)) + read (writeExpressionR1(r)))
                                    | b == "times" = show (read (writeExpressionL1(l)) * read (writeExpressionR1(r)))
                                    | b == "cat" = writeExpressionL1(l) ++writeExpressionR1(r)
                                    | b == "len" = show(length(writeExpressionL1(l) ++ writeExpressionR1(r))) 
                                    
                                    
writeExpression1 (ASTNode (ASTSimpleDatum a) EmptyAST EmptyAST ) = a
writeExpression1 (ASTNode (ASTSimpleDatum b) l EmptyAST ) | b == "num" = show(read (writeExpressionL1(l)) :: Int) 
                                            | b == "negate" = show (0 - read (writeExpressionL1(l)) :: Int) 
                                            | b == "len" = show(length(writeExpressionL1(l))) 
                                            | b == "str" = writeExpressionL1(l) 
writeExpression1 (ASTNode (ASTSimpleDatum b) EmptyAST r ) | b == "num" = show(read (writeExpressionR1(r)) :: Int) 
                                            | b == "negate" = show (0 - read (writeExpressionR1(r)) :: Int) 
                                            | b == "len" = show(length(writeExpressionR1(r))) 
                                            | b == "str" = writeExpressionR1(r) 
writeExpression1 (ASTNode (ASTSimpleDatum b) l r ) | b == "plus" =  show (read (writeExpressionL1(l)) + read (writeExpressionR1(r)))
                                        | b == "times" = show (read (writeExpressionL1(l)) * read (writeExpressionR1(r)))
                                        | b == "cat" = writeExpressionL1(l) ++writeExpressionR1(r) 
                                        | b == "len" = show(length(writeExpressionL1(l) ++ writeExpressionR1(r))) 
                                        
                                        
                                        
                                        
exchangewith :: (AST,String,String) -> AST
exchangewith (EmptyAST,b,a)=EmptyAST

exchangewith ((ASTNode (ASTSimpleDatum x) EmptyAST  EmptyAST ),b,a) = if x == b then (if isNumber(a) then ((ASTNode (ASTSimpleDatum "num")  (ASTNode (ASTSimpleDatum a) EmptyAST EmptyAST) EmptyAST) ) else ((ASTNode (ASTSimpleDatum "str") (ASTNode (ASTSimpleDatum a) EmptyAST EmptyAST) EmptyAST))) else (ASTNode (ASTSimpleDatum x) EmptyAST  EmptyAST )
exchangewith ((ASTNode (ASTSimpleDatum x) l  EmptyAST ),b,a) = if b == x then (if isNumber(a) then (ASTNode (ASTSimpleDatum x) (exchangewith(l,b,a)) EmptyAST ) else (ASTNode (ASTSimpleDatum x) (exchangewith(l,b,a)) EmptyAST)) else (ASTNode (ASTSimpleDatum x) (exchangewith(l,b,a))  EmptyAST ) 
exchangewith ((ASTNode (ASTSimpleDatum x) EmptyAST r),b,a) = if b == second(third(r)) then (if isNumber(a) then (ASTNode (ASTSimpleDatum x) EmptyAST (exchangewith(r,b,a))  ) else (ASTNode (ASTSimpleDatum x) EmptyAST (exchangewith(r,b,a)))) else (ASTNode (ASTSimpleDatum x) EmptyAST r)

exchangewith ((ASTNode (ASTSimpleDatum x) l r),b,a) = if b == x then (if isNumber(a) then (ASTNode (ASTSimpleDatum x) EmptyAST (exchangewith(r,b,a))  ) else (ASTNode (ASTSimpleDatum x) EmptyAST (exchangewith(r,b,a)))) else (ASTNode (ASTSimpleDatum x) (exchangewith(l,b,a)) (exchangewith(r,b,a))) 


islemsayisi :: (AST,Int) -> Int

islemsayisi ((ASTNode (ASTSimpleDatum x) EmptyAST EmptyAST), a) = if x == "plus" || x == "times" || x== "negate" || x== "cat" || x=="len"  then a+1 else a
islemsayisi ((ASTNode (ASTSimpleDatum x) l EmptyAST), a) = if x == "plus" || x == "times" || x== "negate" || x== "cat" || x=="len"  then increment(increment(a,1),islemsayisi(l,0)) else increment(a,islemsayisi(l,0))
islemsayisi ((ASTNode (ASTSimpleDatum x) EmptyAST r), a) = if x == "plus" || x == "times" || x== "negate" || x== "cat" || x=="len"  then increment(increment(a,1),islemsayisi(r,0)) else increment(a,islemsayisi(r,0))
islemsayisi ((ASTNode (ASTSimpleDatum x) l r), a) = if x == "plus" || x == "times" || x== "negate" || x== "cat" || x=="len"  then increment(increment(increment(a,1),islemsayisi(l,0)),islemsayisi(r,0)) else increment(increment(a,islemsayisi(r,0)),islemsayisi(l,0))


increment :: (Int,Int) -> Int
increment (a,b) = a+b

lazycal :: (AST,String,Int,Int) -> Int


lazycal ((ASTNode (ASTSimpleDatum x) EmptyAST  EmptyAST ),b,a,c) = if x == b then increment(c,a) else c
lazycal ((ASTNode (ASTSimpleDatum x) l  EmptyAST ),b,a,c) = if b == x then  increment(c,a) else (c+lazycal(l,b,a,c))
lazycal ((ASTNode (ASTSimpleDatum x) EmptyAST r),b,a,c) = if b == x then  increment(c,a) else (c+lazycal(r,b,a,c))
lazycal ((ASTNode (ASTSimpleDatum x) l r),b,a,c) = if b == x then  increment(c,a) else (c+lazycal(l,b,a,c)+lazycal(r,b,a,c))



