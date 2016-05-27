type Number = Double
type Vector = [Number]
type Row    = [Number]
type Matrix = [Row]
   
mapMatrix :: Matrix -> Vector -> Vector
mapMatrix rows v = [sum (zipWith (*) row v) | row <- rows]
   
gauss :: Matrix -> Vector -> Vector
gauss a b = x
    where
    b' = map (\y -> [y]) b
    a' = zipWith (++) a b'    -- combine with right-hand side

    x  = resubstitute $ triangular a'
   
triangular :: Matrix -> Matrix
triangular [] = []
triangular m  = row:(triangular rows')
    where
    (row:rows) = rotatePivot m    -- see discussion below
    rows' = map f rows
    f bs
        | (head bs) == 0 = drop 1 bs
        | otherwise      = drop 1 $ zipWith (-) (map (*c) bs) row
        where 
        c = (head row)/(head bs)    -- suitable multiple    

rotatePivot :: Matrix -> Matrix
rotatePivot (row:rows)
    | (head row) /= 0 = (row:rows)
    | otherwise       = rotatePivot (rows ++ [row])

resubstitute :: Matrix -> Vector
resubstitute = reverse . resubstitute' . reverse . map reverse   

resubstitute' :: Matrix -> Vector
resubstitute' [] = []
resubstitute' (row:rows) = x:(resubstitute' rows')
    where
    x     = (head row)/(last row)
    rows' = map substituteUnknown rows
    substituteUnknown (a1:(a2:as')) = ((a1-x*a2):as')
