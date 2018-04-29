#include "trezor_crypto.h"

#define FROMHEX_MAXLEN 512

int from_hex(const char *str, uint8_t out[])
{
  size_t len = strlen(str) / 2;
  size_t i;
  if (len > FROMHEX_MAXLEN) len = FROMHEX_MAXLEN;
  for (i = 0; i < len; i++) {
    uint8_t c = 0;
    if (str[i * 2] >= '0' && str[i*2] <= '9') c += (str[i * 2] - '0') << 4;
    if ((str[i * 2] & ~0x20) >= 'A' && (str[i*2] & ~0x20) <= 'F') c += (10 + (str[i * 2] & ~0x20) - 'A') << 4;
    if (str[i * 2 + 1] >= '0' && str[i * 2 + 1] <= '9') c += (str[i * 2 + 1] - '0');
    if ((str[i * 2 + 1] & ~0x20) >= 'A' && (str[i * 2 + 1] & ~0x20) <= 'F') c += (10 + (str[i * 2 + 1] & ~0x20) - 'A');
    out[i] = c;
  }
  return i;
}

int luaopen_trezor_crypto(lua_State *L)
{
  luaL_newmetatable(L, "ec_key");
  lua_pushvalue(L, -1);
  lua_setfield(L, -2, "__index");

  setfuncs_compat(L, lua_trezor_crypto_methods, "ec_key");
  newlib_compat(L, lua_trezor_crypto_functions, "ec_key");

  return 1;
}

int lua_secret_to_public_key(lua_State *L) {
  uint8_t private_key[32];
  const char *secret = lua_tostring(L, 1);
  int len = strlen(secret);
  sha256_Raw((uint8_t *)secret, len, private_key);

  uint8_t public_key[33];
  ecdsa_get_public_key33(&secp256k1, private_key, public_key);
  lua_pushlstring(L, (char *)public_key, 33);
  return 1;
}

int lua_ecdsa_sign(lua_State *L) {
  uint8_t message[FROMHEX_MAXLEN];
  uint8_t sig[64];
  uint8_t der[72];

  uint8_t private_key[SHA256_DIGEST_LENGTH];
  const char *seed = lua_tostring(L, 1);
  int len = strlen(seed);
  sha256_Raw((uint8_t *)seed, len, private_key);

  const uint8_t *base64_message = (uint8_t *)lua_tostring(L, 2);

  int message_len = from_hex((char *)base64_message, message);

  ecdsa_sign(
    &secp256k1,
    HASHER_SHA2,
    private_key,
    message,
    message_len,
    sig,
    NULL,
    NULL
  );

  int der_len = ecdsa_sig_to_der(sig, der);

  lua_pushlstring(L, (char *)der, der_len);
  return 1;
}

int lua_sha256(lua_State *L) {
  uint8_t data[FROMHEX_MAXLEN];
  uint8_t ret_val[SHA256_DIGEST_LENGTH];

  const char *base64_data = lua_tostring(L, 1);
  int data_len = from_hex((char *) base64_data, data);

  int len = strlen((char *) data);
  sha256_Raw(data, data_len, ret_val);

  lua_pushlstring(L, (char *)ret_val, SHA256_DIGEST_LENGTH);
  return 1;
}

int lua_ripemd160(lua_State *L) {
  uint8_t message[FROMHEX_MAXLEN];
  uint8_t digest[RIPEMD160_DIGEST_LENGTH];

  const uint8_t *base64_message = (uint8_t *)lua_tostring(L, 1);
  int message_len = from_hex((char *) base64_message, message);

  ripemd160(message, message_len, digest);

  lua_pushlstring(L, (char *) digest, RIPEMD160_DIGEST_LENGTH);
  return 1;
}
