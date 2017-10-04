module Current.View exposing (..)

import Current.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Loader.View exposing (loader)
import Messages exposing (..)
import Models exposing (..)
import RemoteData exposing (..)


view : Model -> Html Msg
view model =
    div
        [ id "page-current"
        , class "page"
        ]
        [ page model.current
        ]


page : WebData CurrentWeather -> Html Msg
page current =
    case current of
        NotAsked ->
            div [ class "flex items-center hc100" ] [ loader ]

        Loading ->
            div [ class "flex items-center hc100" ] [ loader ]

        Failure error ->
            div [ class "flex items-center hc100" ] [ text (toString error) ]

        Success current ->
            currentView current


currentView : CurrentWeather -> Html Msg
currentView current =
    div
        [ class "flex flex-wrap p1 mt0 mb0 items-center hc100" ]
        [ text current.summary ]
