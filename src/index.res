type contractT
type providerT

type keyT
type argumentT<'a>

type keysT = {
  alice: keyT,
  bob: keyT,
  alicePk: keyT,
  bobPk: keyT,
}

@module external artifact: contractT = "./json/TimedTimeout.json"
@module external keys: keysT = "./keys"

@val external cashscript: 'a = "cashscript"

@new @module("cashscript")
external electrumNetworkProvider: string => providerT = "ElectrumNetworkProvider"
@new @module("cashscript")
external newContract: (contractT, Js.Array.t<'a>, providerT) => unit = "ElectrumNetworkProvider"

let run = () => {
  open Js.Array
  let provider = electrumNetworkProvider("mainnet")
  let constructorArgs = [keys.alicePk, keys.bobPk]
  let contract = newContract(artifact, constructorArgs, provider)
}
