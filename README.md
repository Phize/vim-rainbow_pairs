# Rainbow Pairs

'Rainbow Pairs' for Vim is a plugin which colorfully higlights nested string pairs ( (, ), [, ], {, }, <, > by default).

(This plugin based on '[Better Rainbow Parentheses] (https://github.com/kien/rainbow_parentheses.vim)'.)

---

## Default key mappings

### Toggle Rainbow Pairs
\<Leader\>r

---

## Customizing key mappings

```vim
nmap <silent> <Leader>rt <Plug>(rainbow_pairs_toggle)
nmap <silent> <Leader>re <Plug>(rainbow_pairs_enable)
nmap <silent> <Leader>rd <Plug>(rainbow_pairs_disable)
nmap <silent> <Leader>ru <Plug>(rainbow_pairs_update)
```

---

## Ex commands

### Toggle Rainbow Pairs

```vim
RainbowPairsToggle
```

### Enable Rainbow Pairs

```vim
RainbowPairsEnable
```

### Disable Rainbow Pairs

```vim
RainbowPairsDisable
```

### Update Rainbow Pairs (forcibly)

```vim
RainbowPairsUpdate
```

---

## Options

### Disable Rainbow Pairs on startup

```vim
let g:rainbow_pairs_enable_on_startup = 0
```

### Disable default key mappings

```vim
let g:rainbow_pairs_enable_key_mappings = 0
```

### Disable autocmds

```vim
let g:rainbow_pairs_enable_autocmds = 0
```

### Token pairs

A list of start/end tokens (RegExp) list.

```vim
let g:rainbow_pairs_token_pairs = [
                \ ['/(/',  '/)/'],
                \ ['/\[/', '/\]/'],
                \ ['/{/',  '/}/'],
                \ ['/</',  '/>/']
            \ ]
```

### Color pairs

A list of terminal/GUI colors list (shallow nested level to deep nested level).

```vim
let g:rainbow_pairs_color_pairs = [
                \ ['red',         'firebrick3'],
                \ ['brown',       'RoyalBlue3'],
                \ ['Darkblue',    'SeaGreen3'],
                \ ['darkgray',    'DarkOrchid3'],
                \ ['darkgreen',   'firebrick3'],
                \ ['darkcyan',    'RoyalBlue3'],
                \ ['darkred',     'SeaGreen3'],
                \ ['darkmagenta', 'DarkOrchid3'],
                \ ['brown',       'firebrick3'],
                \ ['gray',        'RoyalBlue3'],
                \ ['black',       'SeaGreen3'],
                \ ['darkmagenta', 'DarkOrchid3'],
                \ ['Darkblue',    'firebrick3'],
                \ ['darkgreen',   'RoyalBlue3'],
                \ ['darkcyan',    'SeaGreen3'],
                \ ['darkred',     'DarkOrchid3']
            \ ]
```

### Maximum nested levels

```vim
let g:rainbow_pairs_max = 16
```
