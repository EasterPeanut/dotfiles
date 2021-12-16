" run commands
" nmap <leader>r :call RunTerminalCommand('mix run script.exs')<CR>
" nmap <leader>dg :call RunTerminalCommand('mix deps.get')<CR>
" nmap <leader>m :call RunTerminalCommand('psql detroit_dev < query.sql')<CR>

" insert factory: insert(:whatever)
let @i = 'yiwA = insert(:jjpa)jj'
" insert IO.inspect with a label
let @l = 'o|> IO.inspect(label: "")jjF"i'
" insert IO.inspect
let @o = 'o|> IO.inspect()jj'
" move test attrs on one line
let @a = '$F%ijjJJ'
" add , %{conn: conn} after test description
let @c = '$T"Da, %{conn: conn} dojjF}'
" in front of an insert, add: %{id: x_id} = 
let @d = '^f:lyw^i%{id: jjpa_id} = jj'
" wrap current line in a eex do block:
" <%= if line do %>\n\n<% end %>
let @b = '^i<%= if jjA do %>jjo<% end %>jjO'
" wrap current selection in an eex do block:
" <%= if  do %>\nselection\n<% end %> 
let @w = '>`>o<% end %>jj`<ki<%= if  do %>jjF ;i'
" use vim-surround to wrap selection in <%=  %>
" ysiw= will become <%= selection %>
" ysiw- will become <% selection %>

" Open the view belonging to the template
" or the template beloning to the view
" split or vertical split
nmap <leader>s :call OpenViewOrTemplate('sp')<CR>
nmap <leader>v :call OpenViewOrTemplate('vs')<CR>

function! OpenViewOrTemplate(side)
  if expand('%:t') == 'template.html.eex'
    execute a:side . fnamemodify(expand('%:p:h') . '/view.ex', '%:p:h')
  elseif expand('%:t') == 'view.ex'
    execute a:side . fnamemodify(expand('%:p:h') . '/template.html.eex', '%:p:h')
  endif
endfunction
