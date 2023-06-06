#!/bin/bash
apt-get update
git clone http://github.com/richifor/ventabus.git
chown -R vagrant:vagrant ventabus/
echo "APROVISIONAMIENTO EJECUTADO"
