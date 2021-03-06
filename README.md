# Flexinodes Coin Masternode Setup
This Flexinodes Coin Masternode (MN) script will automatically install almost all of the MN for you. You just need to have your masternode genkey ready. This code comes from Zoldurs many many forks for MN scripts, visit his page here. https://github.com/zoldur<br /><br />
Please note to run this script you MUST:
1) Be root - better to login as root then use the sudo command
2) Ubuntu 16.04 - I only tested this on that version but I'm sure others may work.
3) A VPS server - You can use my referal link here --> https://www.vultr.com/?ref=7415368
4) Digital Ocean is another provider you can use instead of Vultr. There are many more but these are very common to use. You can use any size due to the swap file that will be created if your server is below 2GB of memory.
5) Optional - There may be other types of servers you can use but not listed here.

Do note that this script does enable the MN to restart if it is somehow closed. It will only make it difficult to remove the MN if you decide to sell your MN. Best way is to delete all the MN files and to restart the MN. (for more information, please vist the coin's discord)

## Setup Wallet on Local Computer

Download the newest wallet for your computer here: https://github.com/zero24x/flexinodes/releases

Once downloaded run the wallet and allow it to fully sync (nodes are hardcoded in the wallet)
Once fully synced, Encrypt you wallet. You can do this by selecting Settings --> Encrypt Wallet. Follow the prompts, also keeping your passphrase safe! This will allow you to send coins and make changes. Do NOT loose this passphrase. Once the wallet closes, give it a few minutes to finish encrypting (nothing will show) and restart the wallet.

Now that your wallet is encrypted, and synced, it's time to send your coins to your wallet. Send your coins to your wallet as you would with any other QT wallet. I personally create a generic address then create my MN address later.

Once the coins have arrived in your wallet, create a new MN address by going to Receive. Type in a label, MN1, then press Request payment. You will now have your new address for your MN.

Next go to Settings --> Options --> Wallet tab --> check Enable Coin Control features. This will allow you to easily send coins to your MN and choose ones incase you have other coins staking. Once done, restart the wallet.

Now create your MN private key. This is very important! NEVER, NEVER, did I say NEVER? show this to anyone. Never. Period. Go to Tools --> Debug console --> console tab, and type in
> masternode genkey<br />

This is your MN private key. Keep this safe but close by as you will need it for the MN setup.

Now it's time to transfer your coins to your MN1 address. Go to Send. Then go to Inputs and select the coins you wish the wallet to choose from to send to your MN1 address. After you chose those coins, press ok. Go to Receive tab and double click on the MN1 below on that screen. Your address should appear. Copy this address and paste it on the Send screen and if done correctly the name of your MN should appear in the label box.

Next type in the amount of coins you wish to send to your MN. If you wish to use them all, copy the After Fee to the Amount box. For example, my after fee looks like this ~203.99992516 FLX and I want to send this to create a MN (NOTE: I know it takes more coins then this but this is an example). So I would copy 203.99992516 and paste in the Amount box. Once done, click Send

Once sent, please allow the transaction to FULLY confirm. You can see this by looking at the Transactions tab. Once your coins fully confirm you need to go back to the console (Tools --> Debug console --> console tab) and type in:

> masternode outputs<br />

This will output your output of the transaction. If you do not see anything, then your coins have not fully confirmed yet or you did not send a correct amount of coins to use.

You need to copy the long hash and also the 1 or 0 at the end. Place these in the same file as your private key to find easily later. Now that is all done, we need to add the masternode to the masternode.conf file.

Next, go to Tools --> Open Masternode Configuration File. This will now open a .txt file where you need to enter your masternode information. Following the example already on that file, enter your information EXACTLY in the same format EXCEPT remove the # in front of your new line. The # is to comment a line. Your IP will be the IP of your VPS Server where you will setup your MN and the port should be the same. The MN1 is the name you gave to the address of where you sent your coins to for the MN so change accordingly. When you are done, go to File --> Save. Then close out of the txt file and restart the wallet.

Now your wallet is open again, go to the Masternodes tab, and ensure your MN appears, click Refresh if it does not appear. Now cointinue to the next section of this guide.

## To Install the Flexinodes Coin Masternode on VPS Server

Go through setting up the wallet and MN infomration on your computer. Then once that is ready to go, continue on to this guide. 

Please copy and paste the following commands into you connection with your server. Most common would be to use Putty.
NOTE: Don't click on the links as that will only show you code. There is no need to do so.

> wget https://raw.githubusercontent.com/nashsclay/Flexinodes/master/flexinodes_mn_setup.sh<br />
> chmod +x flexinodes_mn_setup.sh<br />
> ./flexinodes_mn_setup.sh<br />

You will need to copy and paste your masternode private key into putty when it asks. Then press Enter, when this is done, go back to your wallet, unlock your wallet in Settings. Once unlocked, start your masternode. Go to the Masternode tab, and try to start it, if it fails, try the command below in the NOTE. Once started go back to your VPS. type in
> flexinodes-cli masternode status<br />

If it says, Masternode Successfully Started then congrats you are done!

NOTE: If you have troublestarting your masternode in the wallet itself (not on the VPS) run this command in the debug console.
> masternode start-missing (passphrase)


### Other Commands and Informaiton
This information will be very useful once your MN is setup and ready.

Displays currention information about the masternode
> flexinodes-cli getinfo<br />


You want to see status: "Masternode successfully started" and that will show your Masternode is ready to go.
> flexinodes masternode status<br />


Will stop your masternode and wil automatically restart
> flexinodes-cli stop<br />


This will allow you to edit your masternode's wallet (not your computer's wallet). You can also you this command after the setup to fix if you input the incorrect MN key. Once open and done making changes, press Ctrl + o then Enter to save changes, then Ctrl + x to exit. Then run the legiond stop to restart the MN.

> nano ~/.flexinodes/flexinodes.conf<br />


This is where your flexinodesd file is saved to
> cd /usr/local/bin<br />


Return to root home folder
> cd ~<br />


This will give you access to the folder of Flexinodes files. Notice the period infront of the folder. If your are in the home folder and do **ls** command, it will not show the folder. Period means hidden. Correct command to display this folder in the home folder is **ls -al**
> cd ~/.flexinodes<br />

## Flexinodes Masternode Update

Base script is forked from @CryptoNeverSleeps for IPSUM coin.

THIS UPDATE SCRIPT IS ONLY FOR ROOT USERS
Flexinodes 1.0.0.8 Update Script -   This script will work if your files are in /root/ directory
Do not use the update script if your files are not in the /root/ directory.
Example:
/root/
.flexinodes (Folder)(edited)
flexinodesd
flexinodes-cli
flexinodes-qt

Flexinodes - Update Script

If you used the setup script for you MN from nashsclay, this should work for you.

THIS UPDATE Script assumes the flexinodes files(flexinodesd, flexinodes-cli, flexinodes-tx) and folder .flexinodes are located in /root/

DO NOT CONTINUE IF THESE FILE ARE NOT LOCATED IN /root/

> wget https://raw.githubusercontent.com/nashsclay/Flexinodes/master/update_flexinodes_mn_1.0.0.8.sh<br />
> chmod +x update_flexinodes_mn_1.0.0.8.sh<br />
> ./update_flexinodes_mn_1.0.0.8.sh<br />

### After Update

Make sure your masternode is started

flexinodes-cli masternode status

If you get "Masternode successfully started" -  You are finished

You can alway DM me on discord at nashsclay#6809
