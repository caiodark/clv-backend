module Views exposing (view)

import Html exposing (..)
import Html.Attributes exposing (href, class, style)
import Html.Events exposing (on)
import Types exposing (..)

import Dashboard.Views as DV exposing (..)

import Debug exposing (log)
import Login.Types as LT
import Login.Views as LV
import Acl.Types as AT
import Json.Decode exposing (succeed)

import Material
import Material.Scheme as Scheme
import Material.Button as Button
import Material.Options as Options
import Material.Icon as Icon
import Material.Color as Color
import Material.Layout as Layout
import Material.Grid as Grid
import Material.Typography as Typo
import Material.Menu as Menu
import Material.Tabs as Tabs

view: Model -> Html Msg
view model =
  Layout.render Mdl model.mdl
  [ Layout.fixedHeader,
    Layout.selectedTab model.tabIndex,
    Layout.onSelectTab Types.SelectTab
  ]
  { header = [ header model ]
  , drawer = []
  , tabs = (tabs model, [Color.background (Color.color Color.Teal Color.S400)])
  , main = [
    Options.div
      []
      [
      case (log "Model.login.loggedIn --> " model.login.loggedIn) of
        True ->
          case (log "Model.acl --> " model.acl) of
              AT.User ->
                let
                  mainBody model_ =
                    case model_.global of
                      AT.Logon -> LV.bodyLogin model_
                      AT.Home -> DV.view model_
                in
                  mainBody (log "Model -> " model)
              _ ->
                div [on "click" (succeed (Acl AT.Home))][text "Loading..."]
        False ->
          LV.bodyLogin model
      ]
  ]
  } |> Scheme.topWithScheme Color.Teal Color.Pink

tabs: Types.Model -> List (Html Msg)
tabs model =
  case model.login.loggedIn of
    True ->
      [ text "Dashboard"
      , text "Categories"
      , text "Pages"
      , text "Acl"
      , text "Users"
      ]
    False ->
      []

header: Types.Model -> Html Msg
header model =
  Layout.row [] <|
    [ Layout.title []
      [ text "CloverLab CMS" ]
    , Layout.spacer
    ] ++ if (model.login.loggedIn == True) then
      [ Button.render Types.Mdl [0] model.mdl
          [ Button.onClick (Types.Login LT.Reset)
          , Options.css "color" "#ffffff"
          ]
          [ Icon.i "account_circle"]
      ]
      else
        []
