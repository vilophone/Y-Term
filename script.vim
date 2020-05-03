function GetLinks()
  exe "normal gg0v"
  let w=0
  while w <= 18
    / "><a href="\/w
    exe "normal n2f\"df\"\i\<Enter>\<Esc>0vk"
    / title=
    exe "normal nf\"df\"\i\<Enter>\<Esc>0v"
    let w += 1
  endwhile
  exe "normal 39GGd"
endfunction
