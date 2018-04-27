#!/usr/bin/env bash

if [ -s /tmp/workspace_list ]
then
	awk '{
		if (NR == 1) {
			store=$0;
			print "\""$0"\"";
		} else {
			print > "/tmp/workspace_list"
		}
	}
	END {
		print store > "/tmp/workspace_list"
	}' /tmp/workspace_list | xargs i3-msg workspace
fi
