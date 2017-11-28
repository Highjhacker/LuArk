![Imgur](https://i.imgur.com/18s3E1o.png)

# LuArk

Ark API Wrapper in Lua.

## Built with
- [Lua](https://www.lua.org/)
- [Lua-Requests](https://github.com/JakobGreen/lua-requests)
- [MiddleClass](https://github.com/kikito/middleclass)

## Installation


## Application Example


## Usage

### Account

```lua
local Account = require('account')
local acc = Account()
print(acc:get_top_accounts({limit=1}))

>>>{"success":true,"accounts":[{"address":"AUDud8tvyVZa67p3QY7XPRUTjRGnWQQ9Xv","balance":"2125000000000000","publicKey":"021d03bace0687a1a5e797f884b13fb46f817ec32de1374a7f223f24404401d220"}]}

```

### Block

```lua

```

### Delegate

```lua

```

### Loader

```lua
```

### MultiSignature

```lua
```

### Peer

```lua
```

### Signature

```lua
```

### Transaction

```lua
```

### Transport

```lua
```


## TODOS

- [ ] Core code.
- [ ] Write documentation.
    - [ ] Basic docs written, need to polish.
- [ ] Unit testing.
    - [ ] Check if it can be better.
- [ ] Travis.
    - [ ] Missing support for python 3.2.
    - [ ] OSX Support ?
    - [ ] Windows support ?
- [ ] Better errors handling for the models methods.
- [ ] Sample CLI app.
- [ ] Allow to post a new transaction.

## Authors

- Jolan Beer - Highjhacker

## License

Luark is under MIT license. See the [LICENSE file](https://github.com/Highjhacker/luark/blob/master/LICENSE) for more informations.
