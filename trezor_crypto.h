#ifndef LUARK_TREZOR_CRYPTO_H
#define LUARK_TREZOR_CRYPTO_H

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <string.h>
#include "lua-version-compat.h"

#include "trezor-crypto/ecdsa.h"
#include "trezor-crypto/hasher.h"
#include "trezor-crypto/ripemd160.h"
#include "trezor-crypto/secp256k1.h"


int lua_secret_to_public_key(lua_State *L);
int lua_ecdsa_sign(lua_State *L);
int lua_sha256(lua_State *L);
int lua_ripemd160(lua_State *L);

static const struct luaL_Reg lua_trezor_crypto_methods[] = {
  { NULL, NULL },
};

static const struct luaL_Reg lua_trezor_crypto_functions[] = {
  { "sha256", lua_sha256 },
  { "ecdsa_sign", lua_ecdsa_sign },
  { "secret_to_public_key", lua_secret_to_public_key },
  { "ripemd160", lua_ripemd160 },
  { NULL, NULL }
};

#endif //LUARK_TREZOR_CRYPTO_H
