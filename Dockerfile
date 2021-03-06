FROM centos:centos7
RUN set -ex \
    && yum update -y \
    && yum install -y unbound \
    && yum install -y epel-release \
    && yum install -y openvpn iptables openssl wget ca-certificates curl tar 'policycoreutils-python*'
WORKDIR /etc/openvpn/client
ENTRYPOINT ["sh","-c","/usr/sbin/openvpn --suppress-timestamps --nobind --config client.conf"]