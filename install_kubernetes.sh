
# install kubernetes clients
dnf install -y oracle-olcne-release-el8
dnf config-manager --enable ol8_olcne12
dnf install -y kubectl git


# install oracle cloud cli
dnf -y install oraclelinux-developer-release-el8
dnf install python36-oci-cli
bash -c "$(curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh)"


# config 
oci setup config
