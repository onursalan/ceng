module Hw1 where

type Mapping = [(String, String, String)]
data AST = EmptyAST | ASTNode String AST AST deriving (Show, Read)

writeExpression :: (AST, Mapping) -> String
evaluateAST :: (AST, Mapping) -> (AST, String)
-- DO NOT MODIFY OR DELETE THE LINES ABOVE -- 
-- IMPLEMENT writeExpression and evaluateAST FUNCTION ACCORDING TO GIVEN SIGNATURES -- 

first(a,_,_) = a
second(_,a,_) = a
third(_,_,a) = a


evaluateMapping :: Mapping -> String
evaluateMapping [] = ""
evaluateMapping (a:b) | second(a) == "num" = "let " ++ first(a) ++ "=" ++ third(a) ++ evaluateMap1(b)| second(a) == "str" = "let " ++  first(a) ++ "=" ++ "\"" ++ third(a) ++ "\"" ++ evaluateMap1(b)
evaluateMap1 :: Mapping -> String
evaluateMap1 [] = " in "
evaluateMap1 (a:b) | second(a) == "num" = ";" ++ first(a) ++ "=" ++ third(a) ++ evaluateMap1(b)| second(a) == "str" = ";" ++ first(a) ++ "=" ++ "\"" ++ third(a) ++ "\"" ++ evaluateMap1(b)
writeExpressionL :: (AST) -> String
writeExpressionL (ASTNode a EmptyAST EmptyAST ) = a
writeExpressionL (ASTNode b l EmptyAST ) | b == "num" = writeExpressionL(l) 
                                            | b == "negate" = "(" ++ "-" ++ writeExpressionL(l) ++ ")"
                                            | b == "len" = "(" ++ "length " ++ writeExpressionL(l) ++ ")"
                                            | b == "str" = "\"" ++ writeExpressionL(l) ++ "\""
writeExpressionL (ASTNode b EmptyAST r ) | b == "num" = writeExpressionR(r) 
                                            | b == "negate" = "(" ++ "-" ++ writeExpressionR(r) ++ ")"
                                            | b == "len" = "(" ++ "length " ++ writeExpressionR(r) ++ ")"
                                            | b == "str" = "\"" ++ writeExpressionR(r) ++ "\""
writeExpressionL (ASTNode b l r ) | b == "plus" = "(" ++ writeExpressionL(l) ++ "+" ++ writeExpressionR(r) ++ ")"
                                    | b == "times" = "(" ++ writeExpressionL(l) ++ "*" ++ writeExpressionR(r) ++ ")"
                                    | b == "cat" = "(" ++ writeExpressionL(l) ++ "++" ++ writeExpressionR(r) ++ ")"
                                    | b == "len" = "(" ++ "length " ++ writeExpressionL(l) ++ writeExpressionR(r) ++ ")"

writeExpressionR :: (AST) -> String
writeExpressionR (ASTNode a EmptyAST EmptyAST ) = a
writeExpressionR (ASTNode b l EmptyAST ) | b == "num" = writeExpressionL(l) 
                                            | b == "negate" = "(" ++ "-" ++ writeExpressionL(l) ++ ")"
                                            | b == "len" = "(" ++ "length " ++ writeExpressionL(l) ++ ")"
                                            | b == "str" = "\"" ++ writeExpressionL(l) ++ "\""
writeExpressionR (ASTNode b EmptyAST r ) | b == "num" = writeExpressionR(r) 
                                            | b == "negate" = "(" ++ "-" ++ writeExpressionR(r) ++ ")"
                                            | b == "len" = "(" ++ "length " ++ writeExpressionR(r) ++ ")"
                                            | b == "str" = "\"" ++ writeExpressionR(r) ++ "\""
writeExpressionR (ASTNode b l r ) | b == "plus" = "(" ++ writeExpressionL(l) ++ "+" ++ writeExpressionR(r) ++ ")"
                                    | b == "times" = "(" ++ writeExpressionL(l) ++ "*" ++ writeExpressionR(r) ++ ")"
                                    | b == "cat" = "(" ++ writeExpressionL(l) ++ "++" ++ writeExpressionR(r) ++ ")"
                                    | b == "len" = "(" ++ "length " ++ writeExpressionL(l) ++ writeExpressionR(r) ++ ")"
                                    


writeExpression (ASTNode a EmptyAST EmptyAST , map) = evaluateMapping(map) ++ a
writeExpression (ASTNode b l EmptyAST , map) | b == "num" = evaluateMapping(map) ++ writeExpressionL(l) 
                                            | b == "negate" = evaluateMapping(map) ++ "(" ++ "-" ++ writeExpressionL(l) ++ ")"
                                            | b == "len" = evaluateMapping(map) ++ "(" ++ "length " ++ writeExpressionL(l) ++ ")"
                                            | b == "str" = evaluateMapping(map) ++ "\"" ++ writeExpressionL(l) ++ "\""
writeExpression (ASTNode b EmptyAST r ,map) | b == "num" = evaluateMapping(map) ++ writeExpressionR(r) 
                                            | b == "negate" = evaluateMapping(map) ++ "(" ++ "-" ++ writeExpressionR(r) ++ ")"
                                            | b == "len" = evaluateMapping(map) ++ "(" ++ "length " ++ writeExpressionR(r) ++ ")"
                                            | b == "str" = evaluateMapping(map) ++ "\"" ++ writeExpressionR(r) ++ "\""
writeExpression (ASTNode b l r , map) | b == "plus" = evaluateMapping(map) ++ "(" ++ writeExpressionL(l) ++ "+" ++ writeExpressionR(r) ++ ")"
                                        | b == "times" = evaluateMapping(map) ++ "(" ++ writeExpressionL(l) ++ "*" ++ writeExpressionR(r) ++ ")"
                                        | b == "cat" = evaluateMapping(map) ++ "(" ++ writeExpressionL(l) ++ "++" ++ writeExpressionR(r) ++ ")"
                                        | b == "len" = evaluateMapping(map) ++ "(" ++ "length " ++ writeExpressionL(l) ++ writeExpressionR(r) ++ ")"




--evaluateAST (ASTNode b EmptyAST EmptyAST , a) = (ASTNode b EmptyAST EmptyAST , writeExpression(ASTNode b EmptyAST EmptyAST ,[])) 
--evaluateAST (ASTNode b l EmptyAST , a) = (ASTNode b l EmptyAST , writeExpression(ASTNode b l EmptyAST,[]))
--evaluateAST (ASTNode b EmptyAST r , a) = (ASTNode b EmptyAST r , writeExpression(ASTNode b EmptyAST r,[])) 
evaluateAST (ASTNode b l r , a) = (ASTNode b l r , writeExpression1(ASTNode b l r,a))

writeExpressionL1 :: (AST) -> String
writeExpressionL1 (ASTNode a EmptyAST EmptyAST ) = a
writeExpressionL1 (ASTNode b l EmptyAST ) | b == "num" = show(read (writeExpressionL1(l)) :: Int) 
                                            | b == "negate" = show (0 - read (writeExpressionL1(l)) :: Int) 
                                            | b == "len" = show(length(writeExpressionL1(l))) 
                                            | b == "str" = writeExpressionL1(l)
writeExpressionL1 (ASTNode b EmptyAST r ) | b == "num" = show(read (writeExpressionR1(r)) :: Int) 
                                            | b == "negate" = show (0 - read (writeExpressionR1(r)) :: Int) 
                                            | b == "len" = show(length(writeExpressionR1(r))) 
                                            | b == "str" = writeExpressionR1(r)
writeExpressionL1 (ASTNode b l r ) | b == "plus" =  show (read (writeExpressionL1(l)) + read (writeExpressionR1(r)))
                                    | b == "times" =  show (read (writeExpressionL1(l)) * read (writeExpressionR1(r)))
                                    | b == "cat" = writeExpressionL1(l) ++ writeExpressionR1(r) 
                                    | b == "len" = show(length(writeExpressionL1(l) ++ writeExpressionR1(r))) 

writeExpressionR1 :: (AST) -> String
writeExpressionR1 (ASTNode a EmptyAST EmptyAST ) = a
writeExpressionR1 (ASTNode b l EmptyAST ) | b == "num" = show(read (writeExpressionL1(l)) :: Int) 
                                            | b == "negate" = show (0 - read (writeExpressionL1(l)) :: Int) 
                                            | b == "len" = show(length(writeExpressionL1(l))) 
                                            | b == "str" = writeExpressionL1(l)
writeExpressionR1 (ASTNode b EmptyAST r ) | b == "num" = show(read (writeExpressionR1(r)) :: Int) 
                                            | b == "negate" = show (0 - read (writeExpressionR1(r)) :: Int) 
                                            | b == "len" = show(length(writeExpressionR1(r))) 
                                            | b == "str" = writeExpressionR1(r) 
writeExpressionR1 (ASTNode b l r ) | b == "plus" =  show (read (writeExpressionL1(l)) + read (writeExpressionR1(r)))
                                    | b == "times" = show (read (writeExpressionL1(l)) * read (writeExpressionR1(r)))
                                    | b == "cat" = writeExpressionL1(l) ++writeExpressionR1(r)
                                    | b == "len" = show(length(writeExpressionL1(l) ++ writeExpressionR1(r))) 
                                    


writeExpression1 (ASTNode a EmptyAST EmptyAST , map) = a
writeExpression1 (ASTNode b l EmptyAST , map) | b == "num" = show(read (writeExpressionL1(l)) :: Int) 
                                            | b == "negate" = show (0 - read (writeExpressionL1(l)) :: Int) 
                                            | b == "len" = show(length(writeExpressionL1(l))) 
                                            | b == "str" = writeExpressionL1(l) 
writeExpression1 (ASTNode b EmptyAST r ,map) | b == "num" = show(read (writeExpressionR1(r)) :: Int) 
                                            | b == "negate" = show (0 - read (writeExpressionR1(r)) :: Int) 
                                            | b == "len" = show(length(writeExpressionR1(r))) 
                                            | b == "str" = writeExpressionR1(r) 
writeExpression1 (ASTNode b l r , map) | b == "plus" =  show (read (writeExpressionL1(l)) + read (writeExpressionR1(r)))
                                        | b == "times" = show (read (writeExpressionL1(l)) * read (writeExpressionR1(r)))
                                        | b == "cat" = writeExpressionL1(l) ++writeExpressionR1(r) 
                                        | b == "len" = show(length(writeExpressionL1(l) ++ writeExpressionR1(r))) 


 