module State exposing (..)

import Debug exposing (log)

import Types exposing (..)
import Login.Types as LT
import Login.State as LS
import Acl.Types as AT
import Acl.State as AS
import Material exposing (model)

init: (Model, Cmd msg)
init =
  ({ count = 0
   , login = LS.init
   , global = AT.Logon
   , acl = AT.Unauthorised
   -- Boilerplate: initial MDL state
   , mdl = Material.model
   , tabIndex = 0
   }, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    None ->
      (model, Cmd.none)
    Increase ->
      ( { model | count = model.count + 1 }
      , Cmd.none
      )
    Reset ->
      ( {model | count = 0}
      , Cmd.none
      )
    Acl global ->
      let
        (updModel, updCmd) =
          AS.update global model
      in
        ({model|acl = updModel, global = global}, Cmd.map Acl updCmd)
    Login loginAction ->
      let
        route = AT.Home
        (updModel, updCmd) =
          LS.update loginAction model.login
        (aclModel, aclCmd) =
          AS.update route model
      in
        ({model|login = updModel, acl = aclModel, global = route}, Cmd.batch [Cmd.map Login updCmd, Cmd.map Acl aclCmd])
    Route global ->
      (model, Cmd.none)
      {--
      let
        (updModel, updCmd) =
          AS.update AT.Check global model
      in
        ({ model|acl = updModel.acl, global = global }, Cmd.map Route updCmd)
      --}
    SelectTab tabIndex ->
      ({model|tabIndex = tabIndex}, Cmd.none)
    -- Boilerplate: Handler for Material Design Light
    Mdl msg_ ->
      Material.update msg_ model
