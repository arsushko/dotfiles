#!/bin/bash
# Necessary for bat, for some reason I don't remember.
unset COLORTERM

has() { command -v "$1" >/dev/null 2>&1; }

# Fallback: just show file description
info() {
    if has file; then
        file --brief "$1"
    else
        ls -lh "$1"
    fi
}

text() {
    if has bat; then
        bat --color=always "$1"
    elif has batcat; then  # Debian/Ubuntu name
        batcat --color=always "$1"
    else
        cat "$1"
    fi
}

if has file; then
    mime_type=$(file --brief --mime-type "$1")
elif grep -qI . "$1"; then  # No file(1): grep -I treats binaries as non-matching
    mime_type=text/plain
fi

case "$mime_type" in
    application/x-tar|application/gzip|application/x-bzip2|application/x-xz)
        has tar && tar tf "$1" || info "$1";;
    application/zip)
        has unzip && unzip -l "$1" || info "$1";;
    application/vnd.rar)
        has unrar && unrar l "$1" || info "$1";;
    application/x-7z-compressed)
        has 7z && 7z l "$1" || info "$1";;
    application/x-bittorrent)
        has transmission-show && transmission-show "$1" || info "$1";;
    image/*)
        has chafa && chafa --format=symbols --size="${2}x${3}" "$1" || info "$1";;
    video/*|audio/*)
        has mediainfo && mediainfo "$1" || info "$1";;
    application/pdf)
        has pdfinfo && pdfinfo "$1" || info "$1";;
    text/*|application/json|application/xml|application/javascript)
        text "$1";;
    *)
        info "$1";;
esac
