module Acl.State exposing (..)

import Types as Types exposing (..)
import Acl.Types as AT

init: AT.Model
init =
  AT.Unauthorised

update : AT.Msg -> Types.Model -> (AT.Model, Cmd AT.Msg)
update msg model = (AT.User, Cmd.none)
