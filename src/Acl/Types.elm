module Acl.Types exposing (..)

type Global
  = Logon
  | Home

type Model
  = User
  | Unauthorised
  | Processing

type alias Msg
  = Global
