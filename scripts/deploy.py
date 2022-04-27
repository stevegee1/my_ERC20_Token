from brownie import myToken, accounts, config, network
from web3 import Web3
from scripts.helpful_scripts import get_account

# This contract is tested on:
# Rinkeby, Kovan, mainnet-fork, Local ganache


def deploy_token():
    account = get_account()
    my_Token = myToken.deploy(
        {"from": account},
        # publish_source=config["networks"][network.show_active()]["verify"],
    )


def main():
    deploy_token()
