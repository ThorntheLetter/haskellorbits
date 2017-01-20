import Data.List.Split
import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Cairo
import System.Environment

-- addOrbit :: (Num a, Num b) => (Double -> (Double, Double)) -> a -> b -> (Double -> (Double, Double))
addOrbit :: (Double -> (Double, Double)) -> Double -> Double -> (Double -> (Double, Double))
addOrbit f a b = (\t -> (x t, y t))
  where
    x t = (fst (f t)) + a * cos (b * t)
    y t = (snd (f t)) + a * sin (b * t)

listToOrbits :: (Double -> (Double, Double)) -> [String] -> (Double -> (Double, Double))
listToOrbits f [] = f
listToOrbits f (_:[]) = f
listToOrbits f (a:b:xs) = listToOrbits (addOrbit f (read a) (read b)) xs

main = do
    [arg] <- getArgs
    infileText <- readFile arg
    let fname:_ = splitOn "." arg 
    let options:fwords = map words (lines infileText) -- list of lists of words, with each list being a line
    let orbits = map (listToOrbits (\_ -> (0,0))) (filter (/= []) fwords)
    toFile (FileOptions (read (options !! 1), read (options !! 1)) PNG) (fname ++ ".png") $
        plot (line "" (map (\f -> map f [0,pi/1000..pi*2*read (options !! 0)]) orbits))