function! iy#opfunc#tmux#Send(lines = @") abort
  if !exists('g:iy_opfunc_tmux_target')
    let g:iy_opfunc_tmux_target = '=' . trim(system('tmux has-session &>/dev/null && tmux split-window -h -P || tmux new-session -d -s "tmux-send" -P'))
  endif
  let tt_send = 'tmux send-keys -t ' . shellescape(trim(g:iy_opfunc_tmux_target)) . ' '
  for line in split(a:lines, '\n')
    call system(tt_send . shellescape(line) . ' C-M')
  endfor
endfunction
