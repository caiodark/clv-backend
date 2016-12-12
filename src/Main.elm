module Main exposing(main)

import Html  exposing (..)
import Types exposing (..)
import Views as Views exposing (..)
import State as State exposing (..)

import Material
import Material.Menu as Menu exposing (..)

main: Program Never Types.Model Types.Msg
main =
  program
  { init = State.init
  , view = Views.view
  , subscriptions = Material.subscriptions Types.Mdl
  , update = State.update
  }
