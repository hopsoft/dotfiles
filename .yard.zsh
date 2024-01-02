mkdir -p ./tmp/rdoc ./tmp/yard

export RDOCOPT="--force-output --verbose --markup=markdown --exclude=assets|build|javascript|log|node_modules|tmp --include=app,lib --output=./tmp/rdoc"
export YARD_OPTS='--one-file --safe --verbose --format markdown --output-dir ./tmp/yard --yardopts .yardopts {app,lib}/**/*.rb'
