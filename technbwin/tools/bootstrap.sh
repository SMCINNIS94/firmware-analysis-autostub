#!/bin/sh -e

ENTRY_FILE=/system/qt/app/Home

if [ -f $ENTRY_FILE ]; then
    mv $ENTRY_FILE $ENTRY_FILE.backup
fi

touch $ENTRY_FILE
chmod +x $ENTRY_FILE

cat > $ENTRY_FILE << "EOF"
#!/bin/sh
export TECHNBWIN_DIR=/system/qt/technbwin
$TECHNBWIN_DIR/bin/launcher.sh
EOF
