# Tmux

Start new session with name `0`, `1`, ... :
```
tmux
tmux new
tmux new-session
```

Start new session with name `sesname`:
```
tmux new -s sesname
```

Kill session `sesname`:
```
tmux kill-ses -t sesname
tmux kill-session -t sesname
```

Kill all session but current:
```
tmux kill-ses -a
```

Kill all session but `sesname`:
```
tmux kill-ses -a -t sesname
```

Attach to last session:
```
tmux a
tmux at
tmux attach
tmux attach-session
```

Attach to session `sesname`:
```
tmux a -t sesname
```

List all sessions:
```
tmux ls
tmux list-sessions
```

Leader `Ctrl+b` enables shortcuts:

<table>
<tbody>
  <tr>
    <td rowspan="3">General Operations</td>
    <td><code>?</code></td>
    <td>list all shortcuts</td>
  </tr>
  <tr>
    <td><code>:</code></td>
    <td>command line mode</td>
  </tr>
  <tr>
    <td><code>~</code></td>
    <td>show messages</td>
  </tr>
  <tr>
    <td rowspan="7">Session Operations</td>
    <td><code>d</code></td>
    <td>detach current session and return to shell
  </tr>
  <tr>
    <td><code>D</code></td>
    <td>choose session to detach</td>
  </tr>
  <tr>
    <td><code>Ctrl+z</code></td>
    <td>suspend current session</td>
  </tr>
  <tr>
    <td><code>(</code></td>
    <td>select previous session</td>
  </tr>
  <tr>
    <td><code>)</code></td>
    <td>select next session</td>
  </tr>
  <tr>
    <td><code>s</code></td>
    <td>list all sessions</td>
  </tr>
  <tr>
    <td><code>$</code></td>
    <td>rename session</td>
  </tr>
  <tr>
    <td rowspan="9">Window Operations</td>
    <td><code>c</code></td>
    <td>create a new window</td>
  </tr>
  <tr>
    <td><code>&amp;</code></td>
    <td>close current window</td>
  </tr>
  <tr>
    <td><code>Number</code></td>
    <td>select window</td>
  </tr>
  <tr>
    <td><code>p</code></td>
    <td>to previous window</td>
  </tr>
  <tr>
    <td><code>n</code></td>
    <td>to next window</td>
  </tr>
  <tr>
    <td><code>l</code></td>
    <td>to previously selected window</td>
  </tr>
  <tr>
    <td><code>w</code></td>
    <td>choose window interactively</td>
  </tr>
  <tr>
    <td><code>,</code></td>
    <td>rename current window</td>
  </tr>
  <tr>
    <td><code>.</code></td>
    <td>change index of current windiw</td>
  </tr>
  <tr>
    <td rowspan="12">Pane Operations</td>
    <td><code>"</code></td>
    <td>split current pane into two, top and bottom</td>
  </tr>
  <tr>
    <td><code>%</code></td>
    <td>split current pane into two, left and right</td>
  </tr>
  <tr>
    <td><code>x</code></td>
    <td>kill current pane</td>
  </tr>
  <tr>
    <td><code>!</code></td>
    <td>break current pane out to a new window</td>
  </tr>
  <tr>
    <td><code>Ctrl+Arrow</code></td>
    <td>resize current pane in steps of 1 cell</td>
  </tr>
  <tr>
    <td><code>Alt+Arrow</code></td>
    <td>resize current pane in steps of 5 cells</td>
  </tr>
  <tr>
    <td><code>Space</code></td>
    <td>arrange panes in preset layouts</td>
  </tr>
  <tr>
    <td><code>q</code></td>
    <td>display pane index</td>
  </tr>
  <tr>
    <td><code>o</code></td>
    <td>select next pane in current window</td>
  </tr>
  <tr>
    <td><code>Arrow</code></td>
    <td>select pane</td>
  </tr>
  <tr>
    <td><code>{</code></td>
    <td>swap current pane with previous pane</td>
  </tr>
  <tr>
    <td><code>}</code></td>
    <td>swap current pane with next pane</td>
  </tr>
</tbody>
</table>
