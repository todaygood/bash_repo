
ROOT=/var/ftp/pub/repos/mirror/

#nohup reposync -r elrepo -ndl  -p $ROOT/ >> /tmp/elrepo.log &
nohup reposync -r elrepo-kernel -ndl  -p $ROOT/ >> /tmp/elrepo-kernel.log &
