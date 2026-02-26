#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "usage: $0 <powerman-config-version> [output-path]" >&2
  exit 2
fi

version="$1"
output="${2:-.golangci.yml}"
# Default to an immutable upstream snapshot ref for reproducible fetches.
# Override with UPSTREAM_REF=main only when intentionally refreshing/checking upstream.
snapshot_ref="a57453b8e81b9eb41891d7bb38524049cea733e7"
upstream_ref="${UPSTREAM_REF:-$snapshot_ref}"
url="https://raw.githubusercontent.com/powerman/golangci-lint-strict/${upstream_ref}/${version}/.golangci.yml"

if [[ -e "$output" ]]; then
  echo "refusing to overwrite existing file: $output" >&2
  echo "this script never overwrites automatically" >&2
  echo "choose a different output path, or after explicit confirmation back up/remove the file and rerun" >&2
  exit 1
fi

tmp="${output}.tmp.$$"
cleanup() {
  rm -f "$tmp"
}
trap cleanup EXIT

if command -v curl >/dev/null 2>&1; then
  curl -fsSL "$url" -o "$tmp"
elif command -v wget >/dev/null 2>&1; then
  wget -qO "$tmp" "$url"
else
  echo "need curl or wget to fetch $url" >&2
  exit 1
fi

expected_origin="# Origin: https://github.com/powerman/golangci-lint-strict version ${version}"
if ! head -n 5 "$tmp" | grep -Fqx "$expected_origin"; then
  echo "downloaded file header does not contain expected origin marker" >&2
  echo "expected: $expected_origin" >&2
  echo "source URL: $url" >&2
  exit 1
fi

mv "$tmp" "$output"
trap - EXIT

echo "installed strict config unchanged:"
echo "  version: ${version}"
echo "  ref:     ${upstream_ref}"
echo "  source:  ${url}"
echo "  output:  ${output}"
