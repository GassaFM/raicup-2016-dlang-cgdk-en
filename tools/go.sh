#!/bin/bash
pushd ..
7z x java-model.7z
popd
dmd -debug -unittest java_to_d.d
rm java_to_d.obj
mkdir -p ../model
mkdir -p ../docs
./java_to_d
for f in move world ; do
	patch ../model/$f.d $f.d.diff
	unix2dos ../model/$f.d
done
pushd ..
for f in model/*.d ; do
	dmd -o- -c -D -Dddocs $f
done
popd