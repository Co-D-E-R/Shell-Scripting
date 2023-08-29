#!/bin/bash
# Linux users have to change $8 to $9
awk '\
BEGIN   { print "sed" } \
                { print $8, "\t", $3}   \
END     { print " - DONE -" } \'

