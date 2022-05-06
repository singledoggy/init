
function! LatRe()
:silent! %s/SO2/$\\mathrm{SO_2}$/g
:silent! %s/PM10/$\\mathrm{PM_{10}}$/g
:silent! %s/PM25/$\\mathrm{PM_{2.5}}$/g
:silent! %s/O3/$\\mathrm{O_{3}}$/g
:silent! %s/NO[xX]/$\\mathrm{NO_{x}}$/g
endfunc

command! LatRe  call LatRe()
