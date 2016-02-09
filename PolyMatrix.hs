module Main where

import Data.Matrix hiding (transpose, reverse)
import Data.List
import Control.Exception
import System.Environment

k :: Int
k = 5

f :: [Int]
f = [0,1,4]

(|+|) = zipWith (\x y->(x+y) `mod` k)

infixl 6 |+|

(|*|) i = map (\x->x * i `mod` k)

infixl 7 |*|

rol :: [a] -> Int -> [a]
rol xs i = let (l,r) = splitAt i xs in r ++ l

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

coeffs xs = toLists $ modkM $ a * fromPeriod xs

polarCoeffs d xs = toLists $ modkM $ aPolar d * fromPeriod xs

allCoeffs xs = concatMap (\d->polarCoeffs d xs) [0..k-1]

--makeAllFamily :: [Int] -> Matrix Int
makeAllFamily ps = makeAllFamily' [normalize ps] $ sort $ nub $ map normalize $ allCoeffs ps where
    makeAllFamily' xss yss  | (sort xss) == yss = yss
                            | otherwise                = makeAllFamily' (zs:xss) zss where
                                zs  = normalize $ head $ yss \\ xss
                                zss = sort $ nub $ yss ++ (map normalize $ allCoeffs zs)

--makeFamily :: [Int] -> Matrix Int
makeFamily ps = makeFamily' [normalize ps] $ sort $ nub $ map normalize $ coeffs ps where
    makeFamily' xss yss | (sort xss) == yss = yss
                        | otherwise                = makeFamily' (zs:xss) zss where
                            zs  = normalize $ head $ yss \\ xss
                            zss = sort $ nub $ yss ++ (map normalize $ coeffs zs)

showTexCoeffs xs d = show d ++ showF xs ++" = "++(intercalate " + " summands) where
    summands = reverse $ zipWith varMul (map show [0..]) $ map showF $ polarCoeffs d xs
    varMul deg fun | deg == "0" = fun
                   | deg == "1" = varX d ++ fun
                   | otherwise  = varX d ++ "^{" ++ deg ++ "}" ++ fun
    varX d | d == 0    = "x"
           | otherwise = "(x+" ++ show d ++ ")"
    showF xs = let (l,r) = normalize1 xs in ";" ++ show l ++ ";" ++ show r

{-showTexCoeffs xs d = showF xs ++ " = "++(intercalate " + " summands) where
    summands = reverse $ zipWith varMul (map show [0..]) $ map showF $ polarCoeffs d xs
    varMul deg fun | deg == "0" = fun
                   | deg == "1" = varX d ++ fun
                   | otherwise  = varX d ++ "^{" ++ deg ++ "}" ++ fun
    varX d | d == 0    = "x"
           | otherwise = "(x+" ++ show d ++ ")"-}

singular [] = putStr ""
singular (x:xs) = do
    result <- try (evaluate (makeAllFamily x)) :: IO (Either SomeException [[Int]])
    case result of
        Left ex  -> putStrLn $  "Singular " ++ show x
        Right val -> putStrLn $ "Nonsingular " ++ show x -- ++ " " ++ (show $ length val)
    singular xs

main = do
  args <- getArgs
  let op = head args
  case op of
    "AllFamily"   -> mapM_ print $ makeAllFamily (read (args !! 1) :: [Int])
    "Polynomials" -> mapM_ putStrLn $ map (showTexCoeffs (read (args !! 1) :: [Int])) [0..k-1]
