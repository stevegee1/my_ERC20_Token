from brownie import network, accounts, config

Forked_Local_Environment = ["mainnet-fork-dev"]
Testnets = ["rinkeby", "kovan"]


def get_account():
    if network.show_active() in Forked_Local_Environment or Testnets:
        return accounts.add(config["wallets"]["from_key"])
    else:
        return accounts[0]
