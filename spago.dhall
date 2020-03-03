{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "hooks-at-a-glance"
, dependencies = [ "console", "effect", "ffi-simple", "js-timers", "psci-support", "reactix" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
