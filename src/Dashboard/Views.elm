module Dashboard.Views exposing (..)

import Types exposing (..)
import Login.Types as LT exposing (..)
import Acl.Types as AT exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, class, style)
import Html.Events exposing (on)

import Material
import Material.Scheme as Scheme
import Material.Button as Button
import Material.Options as Options
import Material.Icon as Icon
import Material.Color as Color
import Material.Layout as Layout
import Material.Grid as Grid
import Material.Typography as Typo

view: Types.Model -> Html Types.Msg
view model =
  Grid.grid []
  [ Grid.cell [Grid.offset Grid.All 4, Grid.size Grid.All 4]
    [ Options.styled h1 [Typo.title]
      [ text ("Welcome")]
    ]
  , Grid.cell [Grid.offset Grid.All 4, Grid.size Grid.All 4]
    [ Button.render Types.Mdl [3] model.mdl
        [ Button.raised
        , Button.colored
        , Button.ripple
        , Button.onClick (Types.Login LT.Reset)
        ]
        [ text "Logout"]
    ]
  ]
