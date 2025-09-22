#!/bin/bash

# Generate logo background
magick -size 553x640 xc:none \
    -fill "#FFF9F2" \
    -stroke "#F06060" -strokewidth 11 \
    -draw "polygon 276.5,7 547,163 547,477 276.5,633 6,477 6,163" \
    man/figures/logo.png

# Generate text image and compose with background due to
# limited ligatures support in hexSticker and ImageMagick.
if [[ "$OSTYPE" == "darwin"* ]]; then
    CHROME_BIN="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    CHROME_BIN="/c/Program Files/Google/Chrome/Application/chrome.exe"
else
    CHROME_BIN="/usr/bin/google-chrome"
fi

if [ ! -f "$CHROME_BIN" ]; then
    echo "Chrome/Chromium not found at $CHROME_BIN"
    exit 1
fi

alias chrome="\"$CHROME_BIN\""

chrome --headless \
    --disable-gpu \
    --no-margins \
    --no-pdf-header-footer \
    --print-to-pdf-no-header \
    --print-to-pdf=tools/logo-text.pdf \
    tools/logo-text.svg

pdfcrop --quiet \
    tools/logo-text.pdf tools/logo-text.pdf

magick -density 2000 tools/logo-text.pdf \
    -resize 25% \
    -alpha set -background none -channel A \
    -evaluate multiply 1.3 +channel \
    -transparent white \
    tools/logo-text.png

magick man/figures/logo.png tools/logo-text.png \
    -gravity center \
    -geometry +0-0 \
    -composite man/figures/logo.png

rm tools/logo-text.pdf tools/logo-text.png

# Optimize PNG
pngquant man/figures/logo.png \
    --force \
    --output man/figures/logo.png
