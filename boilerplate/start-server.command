#!/bin/sh
cd "`dirname "$0"`"
port="${1:-8000}"
open "http://localhost:${port}/"
echo "Starting Server"
echo ""
echo "/----/----/"
echo ""
echo "Press [Ctrl] + C to quit"
echo ""
echo "/----/----/"
echo ""
# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
read -p "Press any key to exit > " -n1 junk
echo
