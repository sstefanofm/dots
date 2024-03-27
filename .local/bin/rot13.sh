#! /usr/bin/env bash

rot13() {
  echo $1 | tr 'A-Za-z' 'N-ZA-Mn-za-m'
}

echo "Enter text to rot13"
read plaintext

echo "Encrypted text"
rot13 "$plaintext"

