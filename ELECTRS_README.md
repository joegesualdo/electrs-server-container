How to get it running:
- `nix-env -iA nixpkgs.electr`
- `electrs --conf ~/bitcoin/electrs/electrs_config.toml`, or point to where the config file is.

How to fetch:
> Must use netcat, curl doesn't work. This is because curl sends http headers (and method/host) but electrum only wants the body. I wasn't able to find a way to just send the body without any http info. To see this, start a netcat server ($ nc -l 10839) then send a request to that port ("127.0.0.1:10839") using both curl and netcat and see the difference in the request.

balance
```
$ echo '{"jsonrpc": "2.0", "method": "blockchain.scripthash.get_balance", "id": 0, "params": ["704a62fd3b6e8a7c19d9c0ac0f358c2a728d24ef716f01b6f86bf9efaa078aa0"]}' | nc 127.0.0.1 50001
```
balance
```
$ echo '{"jsonrpc": "2.0", "method": "blockchain.scripthash.get_balance", "id": 0, "params": ["704a62fd3b6e8a7c19d9c0ac0f358c2a728d24ef716f01b6f86bf9efaa078aa0"]}' | nc 127.0.0.1 50001
```

history
```
echo '{"jsonrpc": "2.0", "method": "blockchain.scripthash.get_history", "id": 0, "params": ["0e96c20579a73b026d1f876a2b35ed3ef396b73bf1ad5562679c1086a27847cf"]}' | nc 127.0.0.1 50001
```

list unspent
```
 echo '{"jsonrpc": "2.0", "method": "blockchain.scripthash.listunspent", "id": 0, "params": ["0e96c20579a73b026d1f876a2b35ed3ef396b73bf1ad5562679c1086a27847cf"]}' | nc 127.0.0.1 50001
```
