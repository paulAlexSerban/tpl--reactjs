#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo "🛑  CLEAN Frontend ReactJS node_modules"
rm -rfv ../../../frontend/reactjs/node_modules

echo "🔧  INSTALL Frontend ReactJS"
npm --prefix ../../../frontend/reactjs install
