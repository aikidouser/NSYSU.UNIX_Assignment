#!/usr/bin/bash
ls ~/X &> /dev/null || ln -s /dev/null ~/X
ls ~/D &> /dev/null || ln -s ~/dunnet ~/D

alias u2d='sed s/\$/\\r/'

alias x='(cat >../obj;\
          cd ->~/X;\
          cat `cat ~/D/obj` || (cd ~/D/inv && cat `cat ~/D/obj`) || echo "I do not see that here.")2>~/X < '
alias i='(cd ~/D/inv>~/X;\
          echo -n "You currently have: ";\
          ls [abfgjklrs]*[^s] 2> ~/X | u2d | tr "\r\n" ", " | rev | cut -c 1-2 --complement | rev && echo .) | tr -d "\n" | fold -s;\
          echo'
alias drop='(cat >../obj; (cd ..; \
                           cat obj | grep ".*ra.*l.*" &> ~/X && echo *ra*l* > obj; \
                           cat obj | grep ".*i[cd]$" &> ~/X && echo *i[cd] > obj; \
                           cat obj | grep "^[bc][^le].*[dup]$" &> ~/X && echo [bc][^le]*[dup] > obj); \
            cd ->~/X; \
            mv ~/D/inv/`cat ~/D/obj` . \
            && echo Dropped. \
            || echo You do not have that.)2>~/X <'
alias get='(cat >../obj; \
            cd ->~/X; (mv [ablefnsrc][hiacmoru]?[^lihsop]* *[chijka][pinaem][prupey] ~/D/get &>~/X; \
                       ls `cat ~/D/obj` &> ~/X && echo "You cannot take that." \
                       || (cd ~/D/get; cat ~/D/obj | grep "all" \
                           && ([[ `ls -A` ]] \
                               && ls | xargs echo "Taken:" | fold -s; \
                               || echo "Nothing to take.") \
                       || (ls ~/D/get/`cat ~/D/obj` &> ~/X && echo "Taken." || echo "I do not see that here."))); \
            (cd ~/D; \
             cat obj | grep ".*ra.*l.*" &> ~/X && echo *ra*l* > obj; \
             cat obj | grep ".*i[cd]$" &> ~/X && echo *i[cd] > obj; \
             cat obj | grep "^[bc][^le].*[dup]$" &> ~/X && echo [bc][^le]*[dup] > obj; \
             cat obj | grep "all" &> ~/X && echo "*" > obj; \
             cd get; \
             mv `cat ../obj` ../inv)&>~/X; \
             mv ~/D/get/* .)2>~/X <'

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

cd ~/
rm -rf dunnet
tar -xf PA1.tar
cd ~/D/rooms
disp
cd ~/D/objs
PS1=">"
