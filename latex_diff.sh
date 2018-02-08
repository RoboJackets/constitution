#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: <git commit ref>"
	exit 1
fi

SRCFILE="src/SGA_Constitution.tex"
STARTDIR=`pwd`
TMPDIR=`mktemp -d /tmp/latexdiffscript.XXXXXX`
echo $TMPDIR

git worktree add $TMPDIR --detach
cd $TMPDIR
git checkout $1 -- $SRCFILE

latexdiff $TMPDIR/$SRCFILE $STARTDIR/$SRCFILE > $STARTDIR/build/SGA_Constitution.diff.tex

cd $STARTDIR
git worktree prune
