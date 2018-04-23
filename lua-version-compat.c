#include "lua-version-compat.h"

/**
 * lua versions <= 5.2 do not have integers (a subtype of number)
 * if supported, push the integer onto the stack
 * if not, push it as a number
 */
void
lua_pushinteger_compat(lua_State *L,
                       int value)
{
#if LUA_VERSION_NUM >= 503
    lua_pushinteger(L, value);
#else
    lua_pushnumber(L, value);
#endif
}

bool
lua_isinteger_compat(lua_State *L,
                     int index)
{
#if LUA_VERSION_NUM >= 503
    return lua_isinteger(L, index);
#else
    return lua_isnumber(L, index);
#endif
}

int
lua_tointeger_compat(lua_State *L,
                     int index)
{
#if LUA_VERSION_NUM >= 503
    return lua_tointeger(L, index);
#else
    return lua_tonumber(L, index);
#endif
}

void
setfuncs_compat(lua_State *L,
                const struct luaL_Reg *R,
                char *name_for_lua51)
{

#if LUA_VERSION_NUM >= 502
    luaL_setfuncs(L, R, 0);
#else
    lua_setglobal(L, name_for_lua51);
    luaL_register(L, name_for_lua51, R);
#endif
}

void
newlib_compat(lua_State *L,
              const struct luaL_Reg *R,
              char *name_for_lua51)
{

#if LUA_VERSION_NUM >= 502
    luaL_newlib(L, R);
#else
    luaopen_base(L);
    luaL_register(L, name_for_lua51, R);
#endif
}

