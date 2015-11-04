#!/usr/bin/env node

var fs = require('fs');

var pkgPath = './package.json';
var pkg = require(pkgPath);

var bowerPath = './bower.json';
var bower = require(bowerPath);
var args = require('minimist')(process.argv.slice(2))._;

if (args.length === 0) {
  console.log('Must supply a release number. Usage:\n\n$> ./bump.sh 1.0.0');
  process.exit(1);
} else {
  var version = args[0];
}

pkg.version = bower.version = version;
fs.writeFileSync(pkgPath, JSON.stringify(pkg, null, 2));
fs.writeFileSync(bowerPath, JSON.stringify(bower, null, 2));
