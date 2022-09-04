#!/bin/bash

WANTED=80

CURRENT=$(tmux list-panes | awk -F"[ x:\\\[\\\]]+" '/^1:/{print $2}')
if [[ "${CURRENT}" -gt "${WANTED}" ]];
then
    ((DIFFERENCE = "${CURRENT}" - "${WANTED}"))
    tmux resize-pane -R -t 1 "${DIFFERENCE}"
elif [[ "${CURRENT}" -lt "${WANTED}" ]];
then
    ((DIFFERENCE = "${WANTED}" -"${CURRENT}"))
    tmux resize-pane -L -t 1 "${DIFFERENCE}"
fi
