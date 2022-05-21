# PA4assingment Init

## Display the room description and contents

- In this new assignment, we have a new problen related to the `panel lights` in the computer room inside the house. Consider:
  > Suppose we type `emacs -batch -l dunnet`, then `get shovel`, then `e`, then `e`, then `dig`, then `get cpu`, then `se`, then `get food`, then `se`, then `drop food`, then `get key`, then `nw`, then `nw`, then `ne`, then `ne`, then `ne`. If so, we'll be in the `Old Building hallway`.

- Then, continuing on, we get:

```tcsh
>w
Computer room
You are in a computer room.  It seems like most of the equipment has
been removed.  There is a VAX 11/780 in front of you, however, with
one of the cabinets wide open.  A sign on the front of the machine
says: This VAX is named ‘pokey’.  To type on the console, use the
‘type’ command.  The exit is to the east.
The panel lights are steady and motionless.
>
>
>e
Old Building hallway
>w
Computer room
The panel lights are steady and motionless.
>
>
>put cpu in vax
As you put the CPU board in the computer, it immediately springs to life.
The lights start flashing, and the fans seem to startup.
>l
Computer room
You are in a computer room.  It seems like most of the equipment has
been removed.  There is a VAX 11/780 in front of you, however, with
one of the cabinets wide open.  A sign on the front of the machine
says: This VAX is named ‘pokey’.  To type on the console, use the
‘type’ command.  The exit is to the east.
The panel lights are flashing in a seemingly organized pattern.
>e
Old Building hallway
>w
Computer room
The panel lights are flashing in a seemingly organized pattern.
>
>
>drop key
Done.
>e
Old Building hallway
>w
Computer room
The panel lights are steady and motionless.
There is a key here.
>x panel
I don't know what that is.
>x lights
I don't know what that is.
>
```

- Looking at the above, we see four things:
    1. A `panel lights` message always displays whenever the room is entered.
    2. The `panel lights` message always displays just after the `Computer room` message.
        > That's to say: object messages (eg, the `There is a key here.` message, above) can only display after the `panel lights` message.
    3. The `panel lights` message changes when you fix the computer.
    4. The `panel lights` are not an object. You cannot `x panel` or `x lights`.

- To recall, PA3 had:

    ```bash
    alias disp='(ls .v &>~/X && head -1 de*||cat de*;echo >.v;hereitems;ls>~/X)'
    ```

- In this new version, we no longer need to use command cordination with disp, So the `(....;ls>~/X)` can be removed to simplified the PA3 solution to:

    ```tcsh
    alias disp='ls .v &> ~/X && head -1 de*||cat de*;echo >.v;hereitems'
    ```

    - Looking above, we see that the `head -1` always displays the first line.
    - But now we want to also display the last line, if it is about `panel lights`.
    - Therefore, you must replace the `head -1` with a sed program.
    - In Lecture 9, We learned about a variety of `sed` commands that you can use to accomplish the behavior of: 
        1. printing the first line of the description file, and
        2. printing the last line -- if it involves "panel lights".

- So, in summary, fill in the __3__ blank below with a series of sed commands:

    ```tcsh
    alias disp 'ls .v >&~/X && sed __3__ <de* || cat de*; echo >.v; hereitems'
    __3__: sed -n "1p;/panel lights/p"
    ```
