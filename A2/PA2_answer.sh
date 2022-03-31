ls ~/X &> /dev/null || ln -s /dev/null ~/X
ls ~/D &> /dev/null || ln -s ~/PA2assignment/dunnet ~/D

alias x='(cat >../obj;cd ->~/X;cat `cat ~/D/obj` || (cd ~/D/inv && cat `cat ~/D/obj`)||echo "I do not see that here.")2>~/X < '
alias i='(cd ~/D/inv>~/X;echo -n "You currently have: "; ls [abfgjklrs]*[^s] 2> ~/X || echo)'

alias hereitems='ls *[duh-ov]?[dreply] &> ~/X || ls [able][acme]* &> ~/X && echo Here there is: `ls *[duh-ov]?[dreply] [able][acme]* 2>~/X`'

alias disp='(ls .v &>~/X && head -1 de*||cat de*;echo >.v;hereitems;ls>~/X)'
alias l='(cd ->~/X;rm .v;disp)'

alias cleanup='rm temp 2>~/X && echo "You cannot go that way.";cd `pwd -P`;cd ~/D/objs'
alias n='cd ->~/X;cd n 2>~/X && disp || cat n 2>~/X || echo >temp; rm ../s/temp 2>~/X && cd .. && disp; cleanup'
alias s='cd ->~/X;cd s 2>~/X && disp || echo >temp; rm ../n/temp 2>~/X && cd .. && disp; cleanup'
alias e='cd ->~/X;cd e 2>~/X && disp || cat e 2>~/X || echo >temp; rm ../w/temp 2>~/X && cd .. && disp; cleanup'
alias w='cd ->~/X;cd w 2>~/X && disp || echo >temp; rm ../e/temp 2>~/X && cd .. && disp; cleanup'
alias u='cd ->~/X;cd u 2>~/X && disp || echo >temp; rm ../d/temp 2>~/X && cd .. && disp; cleanup'
alias d='cd ->~/X;cd d 2>~/X && disp || echo >temp; rm ../u/temp 2>~/X && cd .. && disp; cleanup'
alias nw='cd ->~/X;cd nw 2>~/X && disp||cat nw 2>~/X||echo >temp; rm ../se/temp 2>~/X &&cd .. && disp; cleanup'
alias sw='cd ->~/X;cd sw 2>~/X && disp||echo >temp; rm ../ne/temp 2>~/X &&cd .. && disp; cleanup'
alias ne='cd ->~/X;cd ne 2>~/X && disp||cat ne 2>~/X||echo >temp; rm ../sw/temp 2>~/X &&cd .. && disp; cleanup'
alias se='cd ->~/X;cat se 2>~/X&&exit; cd se 2>~/X && disp||echo >temp; rm ../nw/temp 2>~/X &&cd .. && disp; cleanup'

cd ~/PA2assignment
rm -rf dunnet
tar -xf PA1.tar
cd ~/D/rooms
disp
cd ~/D/objs
PS1=">"
