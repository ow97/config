#!/usr/bin/env python3

import i3ipc

with open('/tmp/workspace_list', 'w') as list_file:
    def on_workspace_focus(self, e):
        if e.current:
            list_file.write(e.current.name + '\n')
            print(e.current.name)


    i3 = i3ipc.Connection()

    i3.command('mode "Workspace Record"')

    i3.on('workspace::focus', on_workspace_focus)
    i3.on('mode::default', lambda event: i3.main_quit())

    i3.main()
