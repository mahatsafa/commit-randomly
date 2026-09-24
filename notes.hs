-- haskell notes
greet :: String -> String
greet name = "hello " ++ name

main :: IO ()
main = do
    putStrLn (greet "practice")
    let nums = [1, 2, 3]
    print (map (*2) nums)

-- TODO: try monads next
