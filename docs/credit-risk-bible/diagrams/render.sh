#!/usr/bin/env bash
# Render a Graphviz .dot file to a clean, responsive SVG that Obsidian embeds well.
# Usage: ./render.sh path/to/diagram.dot   -> writes path/to/diagram.svg next to it
set -euo pipefail
src="$1"
out="${src%.dot}.svg"
dot -Tsvg "$src" -o "$out.tmp"
python3 - "$out.tmp" "$out" <<'EOF'
import re, sys
raw = open(sys.argv[1]).read()
s = raw[raw.index('<svg'):]
s = re.sub(r'<svg[^>]*?width="[^"]*"\s+height="[^"]*"',
           lambda m: re.sub(r'\s+width="[^"]*"\s+height="[^"]*"', ' width="100%"', m.group(0)), s, count=1)
s = re.sub(r'<!--.*?-->', '', s, flags=re.S)
s = re.sub(r'\n\s*\n', '\n', s)
open(sys.argv[2], 'w').write(s)
EOF
rm -f "$out.tmp"
echo "wrote $out"
