#!/bin/sh

# GCVIEWER_JAR=/path/to/gcviewer.jar

if [ -z $GCVIEWER_JAR ]; then
    GCVIEWER_JAR=$1
fi
if [ -z $GCVIEWER_JAR ]; then
    echo "Generate GC log summary using gcviewer. Please specify gcviewer.jar path in the first parameter."
    echo "https://github.com/chewiebug/GCViewer"
    echo ""
    echo "Usage: $0 <gcviewer.jar>"
    exit 1
fi

for f in `find . -name '*.log'`; do
    if [ ! -f "$f-summary.txt" ]; then
        java -jar $GCVIEWER_JAR $f $f-summary.txt
    fi
done

