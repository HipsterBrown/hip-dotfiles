function! spacevim#before() abort
  call SpaceVim#custom#LangSPC('typescriptreact', 'nmap', ['a'], '<Plug>(coc-codeaction)', 'view action menu', 0)
  call SpaceVim#custom#LangSPC('typescript', 'nmap', ['a'], '<Plug>(coc-codeaction)', 'view action menu', 0)
  call SpaceVim#custom#LangSPC('typescriptreact', 'nmap', ['l'], '<Plug>(coc-references)', 'find all references', 0)
  call SpaceVim#custom#LangSPC('typescript', 'nmap', ['l'], '<Plug>(coc-codeaction)', 'find all references', 0)
  call SpaceVim#custom#LangSPC('typescriptreact', 'nmap', ['f'], '<Plug>(coc-fix-current)', 'fix action on current line', 0)
  call SpaceVim#custom#LangSPC('typescript', 'nmap', ['f'], '<Plug>(coc-codeaction)', 'fix action on current line', 0)
  call SpaceVim#custom#SPC('nmap', ['g', 'B'], 'GBranches', 'view branches', 1)

  let g:github_dashboard = { 'username': 'hipsterbrown', 'password': $GITHUB_TOKEN }
  let g:gista#client#default_username = 'hipsterbrown'
endfunction
