--Output: f(100,0,101) = 101

f :: (Int,Int,Int) -> Int
f (x,y,z) = if x <= y 
            then y 
            else f (f (x-1, y, z), f (y-1, z, x), f (z-1, x, y))

value = (100,0,101)

main = do
    putStrLn $ "f" ++ show value ++ " = " ++ show (f value)