 #!/usr/bin/bash

SPLITH_TEXT='H'
SPLITV_TEXT='V'
SPLIT_NONE='•'
LAYOUT=$(i3-msg -t get_tree | jq -r 'recurse(.nodes[];.nodes!=null)|select(.nodes[].focused).layout')

if [ $LAYOUT == "splitv" ]; then
    echo "<big>$SPLITV_TEXT</big>"
elif [ $LAYOUT == "splith" ]; then
    echo "<big>$SPLITH_TEXT</big>"
else
    echo "<big>$SPLIT_NONE</big>"
fi
