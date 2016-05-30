{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
import Yesod
import Prelude (IO)
import GHC.Generics
import ClassyPrelude
import Control.Applicative

data App = App

mkYesod "App" [parseRoutes|
/add/#Int/#Int AddR GET POST
/subtract/#Int/#Int SubR GET POST
/multiply/#Int/#Int MultR GET POST
/divide/#Int/#Int DivR GET POST
/test testR GET POST
|]

instance Yesod App

instance RenderMessage App FormMessage where
    renderMessage _ _ = defaultFormMessage

instance YesodJquery App

main :: IO ()
main = warp 3000 App
