
function get_dist_name()
{
    echo "关闭防火墙"
    if grep -Eqi "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
        DISTRO='CentOS'
        sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
        systemctl stop firewalld
        systemctl disable firewalld
        setenforce 0
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        DISTRO='Ubuntu'
        sudo -i
        ufw disable
    fi
}

get_dist_name
read -r -p "请输入端口号: " port
echo "export nat_port=${port}">>/etc/profile
echo "export ytfs_path=/home/ytfs">>/etc/profile

echo "创建 /home/ytfs目录"
mkdir -p /home/ytfs

cd /home/ytfs
echo "开始下载 ytfs-node | ytfs-signer"
wget https://github.com/JIJUNLON/source/raw/master/ytfs-node
wget https://github.com/JIJUNLON/source/raw/master/ytfs-signer
#scp -P  39205 root@223.85.204.184:/home/ytfs/ytfs-node .
#scp -P  39205 root@223.85.204.184:/home/ytfs/ytfs-signer .
echo "请输入:source /etc/profile"


