#!/bin/bash

source utils.sh 
i3-msg workspace number $(get_empty_workspace_number)
