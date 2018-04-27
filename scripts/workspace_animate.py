#!/usr/bin/env python3

import i3ipc
import time
import threading
import sys

with open('/tmp/workspace_list') as list_file:
    def animate():
        workspaces = []
        for workspace in list_file:
            workspaces.append(workspace)

        while True:
            for workspace in workspaces:
                i3.command('workspace ' + workspace)
                time.sleep(1)


    i3 = i3ipc.Connection()

    i3.command('mode "Workspace Animate"')
    i3.on('mode::default', lambda event: i3.main_quit())

    thread = threading.Thread(target=animate)
    thread.daemon = True
    thread.start()

    i3.main()
