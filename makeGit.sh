#!/bin/bash
FOLDER_NAME=$1
CURRENT_LOCATION="`pwd`"

cd $FOLDER_NAME
rm -Rf *.git

for i in $(ls -p $FOLDER_NAME | grep "/" | sed 's/\///g'); do
echo "file:$i"
	rm -Rf $i/.git
	rm -f $i/.gitignore
	cp $CURRENT_LOCATION/gitignoreC $i/.gitignore
	cd $i
	git init
	git add .
	git commit -m "initial"
	cd ..
	git clone --bare $i $i.git
done
