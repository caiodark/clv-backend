module Types exposing (..)

import Material
import Login.Types as LT
import Acl.Types as AT

type alias Model =
  { count: Int
  , login: LT.Model
  , acl: AT.Model
  , global: AT.Global
  -- Boilerplate: model store for all MDL components
  , mdl: Material.Model
  , tabIndex: TabIndex
  }

type alias TabIndex = Int

type Msg
  = None
  | Increase
  | Reset
  | Acl AT.Msg
  | Login LT.Msg
  | Route AT.Global
  | Mdl (Material.Msg Msg)
  | SelectTab Int
  -- Boilerplate: Msg for internal Mdl messages
