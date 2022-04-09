#!/bin/bash
ls ~/X &> /dev/null || ln -s /dev/null ~/X
ls ~/D &> /dev/null || ln -s ~/PA2assignment/dunnet ~/D

alias l='cd - &> ~/X; rm .v; disp; cd - &> ~/X'
alias disp='(ls .v &> ~/X && head -n1 $(ls description*) || cat $(ls description*) ; touch .v; hereitems; echo Success > ~/X;)'
alias hereitems='ls [a]*[dt] bone chip emerald food glycerine jar key [l]*[pe] ruby [s]*[lr] &> ~/X || ls [b]*[r] &> ~/X && echo Here there is: $(ls [a]*[dt] bone chip emerald food glycerine jar key [l]*[pe] ruby [s]*[lr][b]*[r] 2> ~/X)'

alias i='cd ~/D/inv; echo You currently have: $(ls [a]*[dt] [b]*[det] food glycerine jar key [l]*[pe] ruby [s]*[lr])'
alias x='(cat >../obj; cat ../inv/`cat ../obj` || cd - && cat `cat ~/D/obj` || echo I do not see that here) 2> ~/X < '

alias u='cd ->~/X; cd u 2> ~/X && disp || touch .temp; rm ../d/.temp 2> ~/X && cd .. && disp; cleanup'
alias d='cd ->~/X; cd d 2> ~/X && disp || touch .temp; rm ../u/.temp 2> ~/X && cd .. && disp; cleanup'
alias cleanup='rm .temp && echo You cannot go that way.; cd $(pwd -P); cd ~/D/objs'

alias n='cd ->~/X; cd n 2> ~/X && disp || cat n 2> ~/X || touch .temp; rm ../s/.temp 2> ~/X && cd .. && disp; cleanup'
alias s='cd ->~/X; cd s 2> ~/X && disp || cat s 2> ~/X || touch .temp; rm ../n/.temp 2> ~/X && cd .. && disp; cleanup'
alias e='cd ->~/X; cd e 2> ~/X && disp || cat e 2> ~/X || touch .temp; rm ../w/.temp 2> ~/X && cd .. && disp; cleanup'
alias w='cd ->~/X; cd w 2> ~/X && disp || cat w 2> ~/X || touch .temp; rm ../e/.temp 2> ~/X && cd .. && disp; cleanup'
alias ne='cd ->~/X; cd ne 2> ~/X && disp || cat ne 2> ~/X || touch .temp; rm ../sw/.temp 2> ~/X && cd .. && disp; cleanup'
alias sw='cd ->~/X; cd sw 2> ~/X && disp || cat sw 2> ~/X || touch .temp; rm ../ne/.temp 2> ~/X && cd .. && disp; cleanup'
alias nw='cd ->~/X; cd nw 2> ~/X && disp || cat nw 2> ~/X || touch .temp; rm ../se/.temp 2> ~/X && cd .. && disp; cleanup'
alias se='cd ->~/X; cd se 2> ~/X && disp || cat se 2> ~/X && exit || touch .temp; rm ../nw/.temp 2> ~/X && cd .. && disp; cleanup'

cd ~/PA2assignment
rm -rf dunnet
tar -xf PA1.tar
cd ~/D/rooms
disp
cd ~/D/objs
PS1=">"
