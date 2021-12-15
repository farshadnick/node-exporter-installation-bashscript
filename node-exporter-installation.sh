export RELEASE="1.3.1"
wget https://github.com/prometheus/node_exporter/releases/download/v$RELEASE/node_exporter-$RELEASE.linux-386.tar.gz
tar xzf node_exporter-$RELEASE.linux-386.tar.gz
cd node_exporter-$RELEASE.linux-386/
mv ./node_exporter /usr/local/bin/
useradd --no-create-home --shell /bin/false prometheus
 useradd --no-create-home --shell /bin/false node_exporter

echo  -n "
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/node_exporter.service

systemctl daemon-reload
systemctl enable node_exporter.service 
