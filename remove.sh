echo "# Removing"

if [[ $(id -u) -ne 0 ]];
        then echo "Please re-run this script as root";
        exit 1;
fi

wg-quick down wg0
systemctl stop wg-quick@wg0
systemctl disable wg-quick@wg0

yes | yum remove wireguard wireguard-dkms wireguard-tools
yes | yum -y update

rm -rf /etc/wireguard

echo "# Removed"
