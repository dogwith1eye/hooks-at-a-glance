let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.5-20191215/packages.dhall sha256:fdc5d54cd54213000100fbc13c90dce01668a73fe528d8662430558df3411bee

let overrides = {=}

let additions =
  { dom-simple =
      { dependencies =
          [ "arrays"
          , "console"
          , "effect"
          , "ffi-simple"
          , "functions"
          , "nullable"
          , "prelude"
          , "unsafe-coerce"
          ]
        , repo =
            "https://github.com/irresponsible/purescript-dom-simple"
        , version =
          "v0.2.4"
      }
    , ffi-simple =
      { dependencies =
          [ "prelude"
          , "effect"
          , "maybe"
          , "functions"
          , "nullable"
          , "unsafe-coerce"
          ]
        , repo =
          "https://github.com/irresponsible/purescript-ffi-simple"
        , version = "v0.2.4"
      }
    , reactix =
      { dependencies =
          [ "aff"
          , "dom-simple"
          , "effect"
          , "ffi-simple"
          , "functions"
          , "newtype"
          , "nullable"
          , "prelude"
          , "psci-support"
          , "refs"
          , "spec"
          , "spec-mocha"
          , "unsafe-coerce"
          ]
      , repo =
          "https://github.com/poorscript/purescript-reactix.git"
      , version =
          "v0.4.2"
      }
    , spec-mocha =
      { dependencies =
          [ "console"
          , "foldable-traversable"
          , "exceptions"
          , "spec"
          ]
      , repo =
          "https://github.com/purescript-spec/purescript-spec-mocha"
      , version =
          "v4.0.0"
      }
  }

in  upstream // overrides // additions
