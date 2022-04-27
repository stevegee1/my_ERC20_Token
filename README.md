ERC20 Token Creation
These contract create a token according to erc20 standard using openzeppelin-erc20 documentation.


Prerequisites:
Please install or have installed the following:
1. nodejs and npm
2. python

Installation:
   Install Brownie framework if you haven't already. Here is a simple way to install brownie
        python -m  pip install --user  pipx
        python3 -m pip install --user pipx
        python3 -m pipx ensurepath
        # restart your terminal
        pipx install eth-brownie
        
        #Or if that doesn't work, use:
            pip install eth-brownie
    Install ganache-cli:
        npm install -g ganache-cli


TESTNET DEVELOPMENT:

If you want to be able to deploy to testnets, do the following.

With environment variables
Set your WEB3_INFURA_PROJECT_ID, and PRIVATE_KEY environment variables.

You can get a WEB3_INFURA_PROJECT_ID by getting a free trial of Infura. At the moment, it does need to be infura with brownie.  You can find your PRIVATE_KEY from your ethereum wallet like metamask.

You'll also need testnet rinkeby ETH and Kovan ETH in your wallet
You can add your environment variables to the .env file:

   export WEB3_INFURA_PROJECT_ID=<PROJECT_ID>
   
   export PRIVATE_KEY=<PRIVATE_KEY>


QUICKSTART:


   Clone this repo
   
   Run this script in your terminal:
   
       brownie run scripts/deploy.py (using this command, it deploys on the ganache-cli)
       
       
       brownie run scripts/deploy.py --network (kovan/rinkeby/mainnet-fork-dev)
