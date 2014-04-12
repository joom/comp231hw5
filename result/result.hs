f :: (Int,Int,Int) -> Int
f (x,y,z) = (if x <= y then y else f (f (x-1, y, z), f (y-1, z, x), f (z-1, x, y)))
    where a = putStrLn $ show (x,y,z)

poss = [(x,y,z) | x <- [0..3], y <- [0..3], z <- [0..3]]

printElements :: [(Int,Int,Int)] -> IO()
printElements []     = return ()
printElements (x:xs) = do 
    putStrLn $ "f " ++ (show x) ++ " -> " ++ (show (f x))
    printElements xs

goOn = do
    putStrLn "First input:" 
    inp1 <- getLine
    putStrLn "Second input:" 
    inp2 <- getLine
    putStrLn "Third input:" 
    inp3 <- getLine

    putStrLn "The result is:"
    putStrLn $ show (f ((read inp1 :: Int), (read inp2 :: Int), (read inp3 :: Int)))

    putStrLn " "
    goOn

main = do
    putStrLn "Example results:"
    printElements poss
    goOn