#!/bin/sh
# Build the ChatGPT plugin ZIP (#799). plugin.json must sit at the ARCHIVE
# ROOT, so the zip is made from inside this directory, never of the directory.
# Usage: sh plugin/build.sh [out.zip]   (default: findmykol-plugin-<version>.zip
# next to this script)
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"
VERSION=$(python3 -c "import json; print(json.load(open('plugin.json'))['version'])")
OUT="${1:-$DIR/findmykol-plugin-$VERSION.zip}"
# Sanity: every referenced path exists and the JSON parses.
python3 - <<'EOF'
import json, os
p = json.load(open('plugin.json'))
iface = p['extensions']['com.openai']['interface']
assert len(iface['displayName']) <= 30 and len(iface['shortDescription']) <= 30
assert len(iface['longDescription']) <= 4000 and len(iface['developerName']) <= 80
for k in ('logo', 'composerIcon'):
    assert os.path.exists(iface[k]), f"{k} missing: {iface[k]}"
json.load(open('mcp.json'))
assert os.path.exists('skills/find-kols/SKILL.md')
print('manifest OK: findmykol', p['version'])
EOF
rm -f "$OUT"
zip -q -r "$OUT" plugin.json mcp.json skills assets -x "*.DS_Store"
echo "built: $OUT"
unzip -l "$OUT"
