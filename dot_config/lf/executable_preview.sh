#!/bin/bash
# Necessary for bat, for some reason I don't remember.
unset COLORTERM

mime_type=$(file --brief --mime-type "$1")

case "$mime_type" in
    application/x-tar|application/gzip|application/x-bzip2|application/x-xz)
        tar tf "$1";;
    application/zip)
        unzip -l "$1";;
    application/vnd.rar)
        unrar l "$1";;
    application/x-7z-compressed)
        7z l "$1";;
    application/x-bittorrent)
        transmission-show "$1";;
    image/*)
        chafa --format=symbols --size="${2}x${3}" "$1";;
    video/*|audio/*)
        mediainfo "$1";;
    text/*|application/json|application/xml|application/javascript)
        bat --color=always "$1";;
    *)
        file --brief "$1";;  # Fallback: just show file description
esac
