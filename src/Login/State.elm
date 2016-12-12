module Login.State exposing (..)

import Types as Types
import Login.Types as T

init: T.Model
init =
  { email = ""
  , password = ""
  , loggedIn = False
  }

update : T.Msg -> T.Model -> (T.Model, Cmd T.Msg)
update msg model =
  case msg of
    T.Login ->
      ({ model|loggedIn = True }, Cmd.none)
    T.SetEmail email ->
      ({ model|email = email }, Cmd.none)
    T.SetPassword password ->
      ({ model|password =  password }, Cmd.none)
    T.Reset ->
      (init , Cmd.none)
