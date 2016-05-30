module Handler.Home where

import Import
import Text.Julius (RawJS (..))

getAddR :: Int -> Int -> Handler Html
getAddR a b = do
    let x = a+b
    defaultLayout $ do
        [whamlet|
            <p> The Addition of #{a} and #{b} is #{x} </p>
        |]

getSubR :: Int -> Int -> Handler Html
getSubR a b = do
    let x = a-b
    defaultLayout $ do
        [whamlet|
            <p> The Subtraction of #{a} and #{b} is #{x} </p>
        |]

getMultR :: Int -> Int -> Handler Html
getMultR a b = do
    let x = a*b
    defaultLayout $ do
        [whamlet|
            <p> The Multiplication of #{a} and #{b} is #{x} </p>
        |]

getDivR :: Int -> Int -> Handler Html
getDivR a b = do
    let x = div a b
    let y = rem a b
    defaultLayout $ do
        [whamlet|
            <p> The Division of #{a} and #{b} is #{x} </p>
            <p> The Remainder of #{a} and #{b} is #{y} </p>
        |]

getHomeR :: Handler Html
getHomeR = do
    defaultLayout $ do
        let (commentFormId, commentTextareaId, commentListId) = commentIds
        aDomId <- newIdent
        setTitle "Calculator"
        $(widgetFile "homepage")

postHomeR :: Handler Html
postHomeR = do
    defaultLayout $ do
        let (commentFormId, commentTextareaId, commentListId) = commentIds
        aDomId <- newIdent
        setTitle "Calculator"
        $(widgetFile "homepage")

commentIds :: (Text, Text, Text)
commentIds = ("js-commentForm", "js-createCommentTextarea", "js-commentList")

