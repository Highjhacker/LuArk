package = "Luark"
version = "1.0devel-2"
source = {
  url = "git+https://github.com/Highjhacker/LuArk.git"
}
description = {
  summary = "Ark API Wrapper in Lua",
  detailed = "API Wrapper written for the Ark Ecosystem.",
  homepage = "https://github.com/Highjhacker/LuArk",
  license = "MIT"
}
dependencies = {
  "lua >= 5.1, < 5.3",
  "busted >= 2.0.rc12-1",
  "lua-requests >= 1.1-1",
  "middleclass >= 4.1-0"
}
build = {
  type = "builtin",
  modules = {
    account = "account.lua",
    api = "api.lua",
    block = "block.lua",
    delegate = "delegate.lua",
    json = "json.lua",
    loader = "loader.lua",
    multisignature = "multisignature.lua",
    peer = "peer.lua",
    signature = "signature.lua",
    ["spec.account_spec"] = "spec/account_spec.lua",
    ["spec.block_spec"] = "spec/block_spec.lua",
    ["spec.delegate_spec"] = "spec/delegate_spec.lua",
    ["spec.loader_spec"] = "spec/loader_spec.lua",
    ["spec.multisignature_spec"] = "spec/multisignature_spec.lua",
    ["spec.peer_spec"] = "spec/peer_spec.lua",
    ["spec.signature_spec"] = "spec/signature_spec.lua",
    ["spec.transaction_spec"] = "spec/transaction_spec.lua",
    ["spec.transport_spec"] = "spec/transport_spec.lua",
    transaction = "transaction.lua",
    transport = "transport.lua",
    utils = "utils.lua",
    ["trezor_crypto"] = {
      sources = {
        "trezor-crypto/memzero.c",
        "trezor-crypto/bignum.c",
        "trezor-crypto/ecdsa.c",
        "trezor-crypto/curves.c",
        "trezor-crypto/secp256k1.c",
        "trezor-crypto/nist256p1.c",
        "trezor-crypto/rand.c",
        "trezor-crypto/hmac.c",
        "trezor-crypto/bip32.c",
        "trezor-crypto/bip39.c",
        "trezor-crypto/pbkdf2.c",
        "trezor-crypto/base58.c",
        "trezor-crypto/base32.c",
        "trezor-crypto/address.c",
        "trezor-crypto/script.c",
        "trezor-crypto/ripemd160.c",
        "trezor-crypto/sha2.c",
        "trezor-crypto/sha3.c",
        "trezor-crypto/hasher.c",
        "trezor-crypto/aes/aescrypt.c",
        "trezor-crypto/aes/aeskey.c",
        "trezor-crypto/aes/aestab.c",
        "trezor-crypto/aes/aes_modes.c",
        "trezor-crypto/ed25519-donna/curve25519-donna-32bit.c",
        "trezor-crypto/ed25519-donna/curve25519-donna-helpers.c",
        "trezor-crypto/ed25519-donna/modm-donna-32bit.c",
        "trezor-crypto/ed25519-donna/ed25519-donna-basepoint-table.c",
        "trezor-crypto/ed25519-donna/ed25519-donna-32bit-tables.c",
        "trezor-crypto/ed25519-donna/ed25519-donna-impl-base.c",
        "trezor-crypto/ed25519-donna/ed25519.c",
        "trezor-crypto/ed25519-donna/curve25519-donna-scalarmult-base.c",
        "trezor-crypto/ed25519-donna/ed25519-sha3.c",
        "trezor-crypto/ed25519-donna/ed25519-keccak.c",
        "trezor-crypto/blake256.c",
        "trezor-crypto/blake2b.c",
        "trezor-crypto/blake2s.c",
        "trezor-crypto/chacha20poly1305/chacha20poly1305.c",
        "trezor-crypto/chacha20poly1305/chacha_merged.c",
        "trezor-crypto/chacha20poly1305/poly1305-donna.c",
        "trezor-crypto/chacha20poly1305/rfc7539.c",
        "trezor-crypto/rc4.c",
        "trezor-crypto/nem.c",
        "lua-version-compat.c",
        "trezor_crypto.c"
      },
      incdirs = {
          "trezor-crypto/"
      },
      defines = {
          "USE_RFC6979=1"
      }
    }
  }
}

