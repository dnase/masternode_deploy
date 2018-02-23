apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get install nano htop git python-virtualenv -y
apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils software-properties-common libgmp3-dev  -y
apt-get install libboost-all-dev -y
add-apt-repository ppa:bitcoin/bitcoin -y
apt-get update -y
apt-get install libdb4.8-dev libdb4.8++-dev -y
apt-get install libminiupnpc-dev -y
export EXIP=`wget -qO- eth0.me`
apt-get install -y pwgen
export RPC_PASSWORD=`pwgen -1 20 -n`
printf "rpcuser=user\nrpcpassword=$RPC_PASSWORD\nrpcport=18889\ndaemon=1\nlisten=1\nserver=1\nmaxconnections=256\nrpcallowip=127.0.0.1\nexternalip=$EXIP:18888\n" > /$HOME/coind.conf
