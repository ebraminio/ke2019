main :: IO ()
main = do
  print $ applyResult

some2 = Just 2
some3 = Just 3

fmapResult = fmap' f some2

applyResult = apply' fmapResult some3

f :: Int -> Int -> Int
f x y = x + y

class Applicative' f where
  apply' :: f (a -> b) -> f a -> f b

instance Applicative' Maybe where
  apply' _ Nothing = Nothing
  apply' Nothing _ = Nothing
  apply' (Just g) (Just a) = Just (g a)

class Functor' f where
  fmap' :: (a -> b) -> f a -> f b

instance Functor' Maybe where
  fmap' _ Nothing = Nothing
  fmap' f (Just a) = Just (f a)
