module Main where

import Data.Matrix hiding (transpose, reverse)
import Data.List
import Control.Exception
import System.Environment

k :: Int
k = 3

(|+|) = zipWith (\x y->(x+y) `mod` k)

infixl 6 |+|

(|*|) i = map (\x->x * i `mod` k)

infixl 7 |*|

rol :: [a] -> Int -> [a]
rol xs i = let (l,r) = splitAt i xs in r ++ l

ror :: [a] -> Int -> [a]
ror xs i = let (l,r) = splitAt (length xs - i) xs in r ++ l

invert' k 1 = 1
invert' k p = (n * k + 1) `div` p
    where n = p - invert' p (k `mod` p)

invert = invert' k

allVectors n = sequence $ take (fromIntegral n) $ repeat [0..k-1]

allNormalVectors n = map (1:) $ allVectors (n-1)

normalize :: [Int] -> [Int]
normalize [] = error "Empty list"
normalize xs = normalize' xs xs where
    normalize' [] ys     = error "Zero list"
    normalize' (x:xs) ys | x == 0    = normalize' xs ys
                         | otherwise = map (\n -> n * invert x `mod` k) ys

normalize1 :: [Int] -> (Int, [Int])
normalize1 [] = error "Empty list"
normalize1 xs = normalize' xs xs where
    normalize' [] ys     = error "Zero list"
    normalize' (x:xs) ys | x == 0    = normalize' xs ys
                         | otherwise = (x, map (\n -> n * invert x `mod` k) ys)

reverseMatrix = fromLists . reverse . toLists

modkM = fmap (`mod` k)

a_ij = uncurry a_ij' where
    a_ij' :: Int -> Int -> Int
    a_ij' i j | i == 1 && j == 1 = 1
              | i == k         = (-1) `mod` k
              | i == 1 || j == 1 = 0
              | otherwise        = (-(j-1)^((k-1-(i-1)) `mod` k)) `mod` k

a = matrix k k a_ij

aPolar d = fromLists $ Data.List.transpose $ rol (Data.List.transpose $ toLists a) d

--fromPeriod :: [Int] -> [[Int]]
fromPeriod xs = fromLists $ map (rol xs) [0..k-1]

coeffs xs = reverse $ toLists $ modkM $ a * fromPeriod xs

polarCoeffs d xs = reverse $ toLists $ modkM $ aPolar d * fromPeriod xs

allCoeffs xs = concatMap (\d->polarCoeffs d xs) [0..k-1]

setSort :: Ord a => [a] -> [a]
setSort = compress . sort where
    compress []     = []
    compress (x:xs) = x : (compress $ dropWhile (== x) xs)

--makeAllFamily :: [Int] -> Matrix Int
makeAllFamily ps = makeAllFamily' [normalize ps] $ setSort $ map normalize $ allCoeffs ps where
    makeAllFamily' xss yss  | xss == yss = yss    --xss уже просмотренные, yss все потомки 
                            | otherwise                = makeAllFamily' (insert zs xss) zss where
                                zs  = normalize $ firstNotIn yss xss
                                zss = setSort $ yss ++ (map normalize $ allCoeffs zs)
    firstNotIn' ys xs = head $ ys \\ xs                                
    firstNotIn (y:ys) (x:xs) | y < x  = y
                             | y > x  = firstNotIn (y:ys) xs
                             | y == x = firstNotIn ys xs
    firstNotIn (y:ys) [] = y

--makeFamily :: [Int] -> Matrix Int
makeFamily ps = makeFamily' [normalize ps] $ sort $ nub $ map normalize $ coeffs ps where
    makeFamily' xss yss | (sort xss) == yss = yss
                        | otherwise                = makeFamily' (zs:xss) zss where
                            zs  = normalize $ head $ yss \\ xss
                            zss = sort $ nub $ yss ++ (map normalize $ coeffs zs)

varX d | d == 0    = "x"
       | otherwise = "(x+" ++ show d ++ ")"

varMul d deg fun | deg == "0" = fun
                 | deg == "1" = varX d ++ fun
                 | otherwise  = varX d ++ "^" ++ deg ++ "" ++ fun

showTexCoeffs xs d = show d ++ showF xs ++" = "++(intercalate " + " summands) where
    summands = reverse $ zipWith (varMul d) (map show [0..]) $ map showF $ reverse $ polarCoeffs d xs
    showF xs = let (l,r) = normalize1 xs in ";" ++ show l ++ ";" ++ show r

singular [] = putStr ""
singular (x:xs) = do
    result <- try (evaluate (makeAllFamily x)) :: IO (Either SomeException [[Int]])
    case result of
        Left ex  -> putStrLn $  "Singular " ++ show x
        Right val -> putStrLn $ "Nonsingular " ++ show x ++ " " ++ (show $ length val)
    singular xs

nonSingular :: Integral a => [[Int]] -> IO [[Int]]
nonSingular [] = return []
nonSingular (x:xs) = do
    result <- try (evaluate (makeAllFamily x)) :: IO (Either SomeException [[Int]])
    rest   <- nonSingular xs
    case result of
        Left ex   -> return rest
        Right val -> return $ x : rest
    
lenF = length . filter (/=0)
poly1 xs d = toList $ modkM $ aPolar d * (fromLists $ transpose [take k $ cycle xs])
len xs d = lenF $ toList $ modkM $ aPolar d * (fromLists $ transpose [take k $ cycle xs])

f1 d cs = \x -> flip mod k $ sum $ zipWith (\a b -> a*(x+d)^b) (poly1 cs d) [0..]

showPoly1 xs d = showPoly1' (poly1 xs d) d

showPoly1' (x:xs) d = let vx = if x == 0 then "" else show x in 
                      intercalate " + " $ vx : filter (/="") (zipWith f xs vars) where
  n = length xs + 1
  vars = map ((\a -> varMul d a "") . show) [1..n-1]
  f 0 b = ""
  f 1 b = b
  f a b = show a ++ "*" ++ b

printPoly1 xs = mapM_ (putStrLn . showPoly1 xs) [0..k-1]

main = do
  args <- getArgs
  let op = head args
  case op of
    "AllFamily"   -> mapM_ print $ makeAllFamily (read (args !! 1) :: [Int])
    "Polynomials" -> mapM_ (putStrLn . showTexCoeffs (read (args !! 1) :: [Int])) [0..k-1]
    "Length"      -> mapM_ (\xs->print $ map (len xs) [0..k-1]) $ makeAllFamily (read (args !! 1) :: [Int])
