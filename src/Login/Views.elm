module Login.Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (attribute)

import Login.Types as LT
import Types as Types
import Regex exposing (contains, regex)

import Material
import Material.Layout as Layout
import Material.Grid as Grid
import Material.Button as Button
import Material.Options as Options
import Material.Typography as Typo
import Material.Textfield as Text
import Material.Color as Color
import Material.Card as Card
import Material.Elevation as Elevation

white: Options.Property c m
white =
  Color.text Color.black


bodyLogin: Types.Model -> Html Types.Msg
bodyLogin model =
  Grid.grid []
    [ Grid.cell [Grid.offset Grid.Desktop 4, Grid.offset Grid.Tablet 2, Grid.size Grid.All 4]
      [ Card.view
          [ Options.css "min-height" "200px"
          , Elevation.e2
          , Color.background (Color.color Color.Grey Color.S300)
          ]
          [ Card.title [ Card.border, white] [Card.head [ white ] [ text "Login"] ]
          , Card.text [white]
            [ Text.render Types.Mdl [0] model.mdl
                [ Text.label "User name"
                , Text.floatingLabel
                , Text.text_
                , Text.value model.login.email
                , Text.onInput (\edit -> Types.Login (LT.SetEmail edit ))
                ]
            , Text.render Types.Mdl [1] model.mdl
                [ Text.label "Password"
                , Text.floatingLabel
                , Options.inner [
                  Options.attribute <| attribute "autocomplete" "new-password"
                ]
                , Text.password
                , Text.value model.login.password
                , Text.onInput (\edit -> Types.Login (LT.SetPassword edit ))
                ]
            ]
          , Card.actions [ Card.border, white]
              [ Button.render Types.Mdl [2] model.mdl
                  [ Button.raised
                  , Button.colored
                  , Button.ripple
                  , Button.onClick (Types.Login LT.Login)
                  , Options.css "margin-right" "24px"
                  , if contains (regex ".+") model.login.password && contains (regex ".+") model.login.email then
                      Options.nop
                    else
                      Button.disabled

                  ]
                  [ text "Login"]
              , Button.render Types.Mdl [3] model.mdl
                  [ Button.raised
                  , Button.ripple
                  , Button.onClick (Types.Login LT.Reset)
                  ]
                  [ text "Reset"]
              ]
          ]
      ]
    ]
