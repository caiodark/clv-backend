module Login.Types exposing (..)

type alias Model =
  { email: String
  , password: String
  , loggedIn: Bool
  }

type Msg
  = Login
  | SetEmail String
  | SetPassword String
  | Reset
