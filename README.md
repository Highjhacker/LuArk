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

>>> {"success":true,"accounts":[{"address":"AUDud8tvyVZa67p3QY7XPRUTjRGnWQQ9Xv","balance":"2125000000000000","publicKey":"021d03bace0687a1a5e797f884b13fb46f817ec32de1374a7f223f24404401d220"}]}

```

### Block

```lua
local Block = require('block')
local block = Block()
print(block:get_blocks({limit=2, orderBy="height"}))

>>> {"success":true,"blocks":[{"id":"4366553906931540162","version":0,"timestamp":0,"height":1,"previousBlock":null,"numberOfTransactions":1492,"totalAmount":12500000000000004,"totalFee":0,"reward":0,"payloadLength":313052,"payloadHash":"6e84d08bd299ed97c212c886c98a57e36545c8f5d645ca7eeae63a8bd62d8988","generatorPublicKey":"03a4d147a417376742f9ab78c7c3891574d19376aa62e7bbddceaf12e096e79fe0","generatorId":"AdLb2r8XEmhNqW3CXyNGEEVZxXAfvTqPWR","blockSignature":"3045022100c442ef265f2a7fa102d61e9a180e335fd17e8e3224307dadf8ac856e569c5c5102201a34cb1302cf4e0887b45784bfbdaf5cfbc44f6d6dad638d56bafa82ec96fd45","confirmations":2693946,"totalForged":"0"},{"id":"1957969527467779153","version":0,"timestamp":10536,"height":2,"previousBlock":"4366553906931540162","numberOfTransactions":0,"totalAmount":0,"totalFee":0,"reward":0,"payloadLength":0,"payloadHash":"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855","generatorPublicKey":"026f1910d432c8ca8f04248e74c4b565a236d9851caeed4422550c3803b313bf39","generatorId":"AYTEu82arYgRyvTgi7dbYwjodV7ignYucz","blockSignature":"30450221009178ce37d3be083f855c6b319b7c15e62df90fd7cf3b56237fb88719c023e74d022025dccdc952581f91110d32c019176901270c88fc9c660fb91a1020c50a6e7d98","confirmations":2693945,"totalForged":"0"}],"count":2693946}

```

### Delegate

```lua
local Delegate = require('delegate')
local delegate = Delegate()
print(delegate:search_delegates({q="dr"}, {limit=2}))

>>> {"success":true,"delegates":[{"username":"dr10","address":"ANwjGUcVbLXpqbBUWbjUBQWkr4MWVDuJu9","publicKey":"031641ff081b93279b669f7771b3fbe48ade13eadb6d5fd85bdd025655e349f008","vote":"152372095405469","producedblocks":33833,"missedblocks":207},{"username":"drusilla","address":"AGzLMjoUiLbccC4YpaDsMRwHaoUwCoorQG","publicKey":"038dfc041c7e609f254b2cf38de4b55e02dff9e743497f5cf6b67d49d8e44978ce","vote":"0","producedblocks":0,"missedblocks":0}]}

```

### Loader

```lua
local Loader = require('loader')
local loader = Loader()
print(loader:get_status())

>>> {"success":true,"loaded":false,"now":2626830,"blocksCount":0}

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
