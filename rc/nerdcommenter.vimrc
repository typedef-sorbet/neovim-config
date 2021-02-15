" Add a space after comments by default
let g:NERDSpaceDelims = 1

" Allow commenting empty lines
let g:NERDCommentEmptyLines = 1

" Trim trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Remap toggle comment to Ctrl-/ in Normal, Insert, and Visual modes
nmap <C-_> <Leader>c<Space>
imap <C-_> <Leader>c<Space>
vmap <C-_> <Leader>c<Space>
