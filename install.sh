#!/bin/bash
NAME="$(basename $PWD)"
TDIR="$HOME/.config/yazi/plugins/$NAME"
SFIL="main.lua"
BFIL="$TDIR/save-$SFIL"
TFIL="$TDIR/$SFIL"

usage() {
    echo "Usage: $(basename $0) [-options]"
    echo "Install this plugin to yazi configuration."
    echo "-r (restore to original)"
    exit 1
}

RESTORE=0
while getopts r\? c; do
    case $c in
        r) RESTORE=1;;
        \?) usage;;
    esac
done

shift $((OPTIND - 1))

if [ $# -ne 0 ]; then
    usage
fi

if [[ $RESTORE -eq 1 ]]; then
    if [[ ! -d $TDIR ]]; then
        echo "Plugin not installed."
    elif [[ ! -f $BFIL ]]; then
        echo "Plugin was not modified."
    else
        echo "Restoring $(basename $BFIL) to $(basename $TFIL) .."
        mv -f $BFIL $TFIL
    fi
else
    if [[ -d $TDIR ]]; then
        # Directory exists
        if [[ ! -f $BFIL ]]; then
            # Backup file does not exist, so save it
            echo "Saving backup $(basename $BFIL) .."
            mv $TFIL $BFIL
        fi
    else
        mkdir $TDIR
    fi

    if cmp -s $SFIL $TFIL; then
        echo "This plugin version is already installed."
    else
        echo "Installing $SFIL to $TDIR/ .."
        cp $SFIL $TDIR/
    fi
fi
