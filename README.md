# Electrs Server Container
> Quickly and easily run an electrs server

---

**⚠️ This is experimental. Please use at your own risk.⚠️**

---

*Currently, this is only configured for testnet. Other networks coming soon...*

## Run
> Run the Electrs server and make RPC port accessible 
```
BITCOIN_DATA_DIR=~/code/bitcoin-core-node/btcdata docker compose up
```

## Usage:
### Requesting blockchain information
> Use netcat on your local machine to request information from the server running in the docker container
```
// get balance
$ echo '{"jsonrpc": "2.0", "method": "blockchain.scripthash.get_balance", "id": 0, "params": ["704a62fd3b6e8a7c19d9c0ac0f358c2a728d24ef716f01b6f86bf9efaa078aa0"]}' | nc 127.0.0.1 50001

// get history
echo '{"jsonrpc": "2.0", "method": "blockchain.scripthash.get_history", "id": 0, "params": ["0e96c20579a73b026d1f876a2b35ed3ef396b73bf1ad5562679c1086a27847cf"]}' | nc 127.0.0.1 50001

// list unspent
 echo '{"jsonrpc": "2.0", "method": "blockchain.scripthash.listunspent", "id": 0, "params": ["0e96c20579a73b026d1f876a2b35ed3ef396b73bf1ad5562679c1086a27847cf"]}' | nc 127.0.0.1 50001
```

#### Can I use curl instead of netcat? 
No. This is because curl sends http headers (and method/host) but electrum only wants the body. I wasn't able to find a way to just send the body without any http info. To see this, start a netcat server ($ nc -l 10839) then send a request to that port ("127.0.0.1:10839") using both curl and netcat and see the difference in the request.


### SSH into the container
```
docker exec -it electrs-testnet /bin/bash
```

## Requirements 
- [Docker](https://docs.docker.com/get-docker/)
- Bitcoin Node

# Notes
For some reason, when I change the dockerfile, changes are not reflected when I run docker compose. So to reflect them, I do the following:
```
docker stop $(docker ps -qa) && docker system prune -af --volumes
docker-compose down
docker-compose up --force-recreate
```
## License
MIT © [Joe Gesualdo]()
 
