import Reflex.Polymer


main = do
  -- putStrLn "Hello There"
  mainWidget app

app= do
  elAttr "paper-button" ("raised" =: "") (text "hi there")
  return ()
