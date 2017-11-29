![Imgur](https://i.imgur.com/18s3E1o.png)

[![HitCount](http://hits.dwyl.io/Highjhacker/luark.svg)](http://hits.dwyl.io/Highjhacker/luark)[![Build Status](https://travis-ci.org/Highjhacker/LuArk.svg?branch=master)](https://travis-ci.org/Highjhacker/LuArk)[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

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
local MultiSignature = require('multisignature')
local multisig = MultiSignature()
print(multisig:get_pending("02c7455bebeadde04728441e0f57f82f972155c088252bf7c1365eb0dc84fbf5de"))

>>> {"success":true,"transactions":[]}

```

### Peer

```lua
local Peer = require('peer')
local peer = Peer()
print(peer:get_peer("46.231.204.123", "4001"))

>>> {"success":true,"peer":{"ip":"46.231.204.123","port":4001,"version":"1.0.2","errors":0,"os":"linux4.4.0-101-generic","height":2699651,"status":"OK","delay":207}}

```

### Signature

```lua
local Signature = require('signature')
local signature = Signature()
print(signature.get_signature_fee())

>>> {"success":true,"fee":500000000}

```

### Transaction

```lua
local Transaction = require('transaction')
local transaction = Transaction()
print(transaction:get_transactions({limit=5, orderBy="timestamp"}))

>>> {"success":true,"transactions":[{"id":"b2ef0adc90e3cf4af5d221350d79c2f2712378e0ef5a71244eecaca4afdc7140","blockid":"4195226696324437309","type":0,"timestamp":-1980252,"amount":7350732799999,"fee":10000000,"vendorField":"Ark","senderId":"AQKk9BwUZjM5fsjYCpreZJ4Ltatrt6ZJBE","recipientId":"AXGVkwNJ3p5ruPJrEGEcwcaSz3THw69Eni","senderPublicKey":"0367b6eeef79462803cecff4692f06df379803d055941fb1f0c976097fa054aa03","signature":"3044022023eb7496803968e2f0e63d9eb7b0885adc3138ad7582e91ab83eae6a0d0afbcf02207f9d0f3a83179c408b819791dc007e3d5e3f266da81ba57aece6524586be3172","asset":{},"confirmations":2698113},{"id":"44d9d0a3093232b9368a24af90577741df8340b93732db23b90d44f6590d3e42","blockid":"4366553906931540162","type":0,"timestamp":0,"amount":0,"fee":0,"senderId":"AewxfHQobSc49a4radHp74JZCGP8LRe4xA","recipientId":"AU9BgcsCBDCkzPyY9EZXqiwukYq4Kor4oX","senderPublicKey":"0235d486fea0193cbe77e955ab175b8f6eb9eaf784de689beffbd649989f5d6be3","signature":"3045022100ed57f27cabdb01f5398b30e63e3372735ee428e17e95de675c37586b6d1a5c12022062a0040ed189a4adac6c3d105e05180f7c74e8c68ca9912b3c60286c2226f3fa","asset":{},"confirmations":2699811},{"id":"512f1aa00538b24a3ba55d65519d34cea83d753f5b2cebfd7004d5c0eaa7177a","blockid":"4366553906931540162","type":0,"timestamp":0,"amount":0,"fee":0,"senderId":"AewxfHQobSc49a4radHp74JZCGP8LRe4xA","recipientId":"AeLpRK8rFVtBeyBVqBtdQpWDfLzaiNujKr","senderPublicKey":"0235d486fea0193cbe77e955ab175b8f6eb9eaf784de689beffbd649989f5d6be3","signature":"3044022018618cfd5dd1024c0dd7677fdbddcaa6977b57f832eca130583d36480dfa452302202c067556fd93899fb0d18ea28e6f0276a778099cdde3d97d3bb8733dff965a59","asset":{},"confirmations":2699811},{"id":"8bb3997878a6a359f1418cf25f31c84f660e5e6897ebd6d07549ff6a4374a44d","blockid":"4366553906931540162","type":0,"timestamp":0,"amount":0,"fee":0,"senderId":"AewxfHQobSc49a4radHp74JZCGP8LRe4xA","recipientId":"ARagsXvdeTHYghaQgJkwbdSkPLZ73qdMkR","senderPublicKey":"0235d486fea0193cbe77e955ab175b8f6eb9eaf784de689beffbd649989f5d6be3","signature":"3044022021e056a123b4a6c30e3f30dd68ff56f4cc1a994222cf27ff5b48434947e45f300220424cbc671a54a019cc655d02b2313a324702908a4a05c86bac4ac83029bb01ef","asset":{},"confirmations":2699811},{"id":"30cb724924823c689058c25243d1c213b9cdb8c157eff26ee9c89fc1e705fedd","blockid":"4366553906931540162","type":0,"timestamp":0,"amount":0,"fee":0,"senderId":"AewxfHQobSc49a4radHp74JZCGP8LRe4xA","recipientId":"AT9xWcPQ8hGYuXZ8aWE57VJFohyX1TTLkH","senderPublicKey":"0235d486fea0193cbe77e955ab175b8f6eb9eaf784de689beffbd649989f5d6be3","signature":"3045022100fd0ab0bee79152978d8d5835e2d244fa159e4957f48d602c65e35e2383c0d14a022036380dac439784075befef7f7b14734f9ed782e4be5ac7f2f4c49985b08fdce9","asset":{},"confirmations":2699811}],"count":"383192"}

```

### Transport

```lua
local Transport = require('transport')
local transport = Transport()
print(transport:get_height())

>>> {"success":true,"height":2699908,"header":{"id":"3142613563561995471","height":2699908,"version":0,"totalAmount":0,"totalFee":0,"reward":200000000,"payloadHash":"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855","payloadLength":0,"timestamp":21853480,"numberOfTransactions":0,"previousBlock":"14077643656259347353","generatorPublicKey":"027a9b5dc98c75902f871e889fb3076dd27b11e158a49e3915e0307ecd9781f51e","blockSignature":"30440220222953e49143a64798e926a46637f5c7ee1a33c942ebb73e885c4a9a1fbd21ff022070e4308af4efe82beb93aa27e65217d1111e9e35f7b6ccef9fe44db73ba33c74"}}

```


## TODOS

- [x] Core code.
- [x] Write documentation.
    - [ ] Polish the documentation, maybe check for a LuaDoc or something.
- [x] Unit testing.
    - [ ] Check if it can be better.
    - [ ] Transport - get_block doesn't work (see the comment)
    - [ ] MultiSignature - get accounts doesn't work (see the comment)
- [x] Travis.
    - [x] LuaJit
    - [x] Lua 5.1
    - [x] Lua 5.2
    - [x] Lua 5.3
    - [ ] OSX Support ?
    - [ ] Windows support ?
- [ ] Better errors handling for the models methods.
- [ ] Sample CLI app.
- [ ] Allow to post a new transaction.
- [ ] Make it a LuaRocks package.
- [x] Handle optionnal parameters.

## Authors

- Jolan Beer - Highjhacker

## License

Luark is under MIT license. See the [LICENSE file](https://github.com/Highjhacker/luark/blob/master/LICENSE) for more informations.
