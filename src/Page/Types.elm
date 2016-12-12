module Page.Types exposing (..)

type alias Page =
  { title       : String
  , body        : String
  , blocks      : [Block]
  , slug        : String
  , keywords    : String
  , description : String
  }

type alias Block =
  { title: String
  , body : String
  }
