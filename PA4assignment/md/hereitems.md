# Hereitems

Regarding how items display when you enter a room (i.e., what the hereitems alias should do), we can start by summarizing what the walkthrough showed us.

## Individual messages

We learned that the generic `There is ... here.` messages of PA3 need to be customized to the individual messages:

- "a large boulder",
- "a ferocious bear",
- "a packet of nitric acid",
- "a packet of glycerine",
- "a valuable amethyst",
- "an emerald bracelet",
- "a valuable ruby",
- "a CPU card",
- "a glass jar",
- "a bus driver\`s license",
- "a dinosaur bone",
- "a shiny brass key",
- "a silver bar",
- "some food",
- "a shovel",
- "a lamp".

Let us observe five things about these customized display messages.

1. To begin, note that we will not be using the `There is a` directory in this new homework because the sed command is easily able to add the words `There is a` in the front of each file name.

2. Second, notice that the final four items in the list (the silver, the food, the shovel, and the lamp) did not add an adjective before the noun.
   
   1. As for the shovel, it displays just as it did in the previous homework.
   2. As for the food, however, the message is "some food" instead of "a food" in the previous PA3.
   3. And as for the lamp, although the message of "a lamp" is just like in PA3, what comes after it is special: "a lamp nearby." instead of "a lamp here."
   4. As for the silver, although there is no adjective added to the front, the word "bar" is added to the end: "a silver bar".

3. Third, consider the "CPU card". The object that this is displayed for is named "board". So this is the one case where the object name is not part of the message that is displayed for the object.

4. Fourth, consider the use of the articles (a/an). In PA3, we needed to add the `n` to create `an acid` and `an amethyst`. In this new homework, these items don't need an `n` anymore, because they have become `a packet of nitric acid` and `a valuable amethyst`. But there's a new problem, because the new messages now include `an emerald bracelet`. So we need to look for the `"a e"` pattern.  I will, however, require you to be general and to look for an `"a "` followed by any vowel (even though it is technically true that, in the part of the game we are implementing, we know that the only time we need the `an` article is for the case of a next word that starts with an `e`).

5. Fifth, consider again the acid and the glycerine. These two items can be put into the jar, and they display differently in that case. The walkthrough demonstrated their behavior:
   
   ```bash
   % grep -A4 "jar here" PA4walkthrough.txt | tail -5
      There is a glass jar here.
      The jar contains:
           There is a packet of glycerine here.
           There is a packet of nitric acid here.
      >
   %
   ```

So the behavior was to get an extra line `The jar contains`, and then to put five spaces in front of these items.

Now the way that we will implement this is to make a directory for the jar.
Consider:

```bash
% cd ~/PA2assignment/allroomdirsandfile
% ls  [abfgjklrs]*[^tg][pterodactyl]
acid      bear        board  boulder   food       jar  lamp    ruby   silver
amethyst  blackboard  bone   bracelet  glycerine  key  license shovel
%
```

As we see above, there is a single wildcard pattern that lists all of the objects that need to display.

> It also lists one of the other objects, the blackboard, but we can get rid of that object later.

## jar

Now that we are in the allroomdirsandfile directory, let's look at the jar.

```bash
% cat jar
It is a plain glass jar.
%
```

As we see above, the earlier homeworks treated the jar as an ordinary file.

Next, let's suppose that the we have already been able to implement the new hereitems alias.

Then we could run it from this allroomdirsandfile directory to get:

```bash
% hereitems
There is a packet of nitric acid here.
There is a valuable amethyst here.
There is a ferocious bear here.
There is a CPU card here.
There is a dinosaur bone here.
There is a large boulder here.
There is an emerald bracelet here.
There is a food here.
There is a packet of glycerine here.
There is a glass jar here.
There is a shiny brass key here.
There is a lamp nearby.
There is a bus driver`s license here.
There is a valuable ruby here.
There is a shovel here.
There is a silver bar here.
%
```

But in this new homework, we are concerned with how to put the **acid** and the **glycerine** into the jar

> these are the only two items that can be put in the jar.

The way that we will implement this behavior is to turn the jar into a directory.

We can test this behavior by changing the jar in the `allroomdirsand`
directory, like this:

```bash
% rm jar
% mkdir jar
% ls [abfgjklrs]*[^tg][pterodactyl]
acid      bear        board  boulder   food       key   license  shovel
amethyst  blackboard  bone   bracelet  glycerine  lamp  ruby     silver

jar:
%
% mv acid glycerine jar
% ls [abfgjklrs]*[^tg][pterodactyl]
amethyst  blackboard  bone     bracelet  key   license  shovel
bear      board       boulder  food      lamp  ruby     silver

jar:
acid  glycerine
%
```

From the above, we see that the jar's contents display below a `jar:` line.

This line is already similar to the `The jar contains:` line from the game.

Let's look again at the above `ls [abfgjklrs]*[^tg][pterodactyl]`, but with the result piped out, so that we can see the way it displays:

```bash
% ls [abfgjklrs]*[^tg][pterodactyl] | cat
amethyst
bear
blackboard
board
bone
boulder
bracelet
food
key
lamp
license
ruby
shovel
silver

jar:
acid
glycerine
%
```

So let's run the alias again, for this new type of jar directory:

```bash
% hereitems
There is a valuable amethyst here.
There is a ferocious bear here.
There is a CPU card here.
There is a dinosaur bone here.
There is a large boulder here.
There is an emerald bracelet here.
There is a food here.
There is a shiny brass key here.
There is a lamp nearby.
There is a bus driver`s license here.
There is a valuable ruby here.
There is a shovel here.
There is a silver bar here.
There is a glass jar here.
The jar contains:
     There is a packet of nitric acid here.
     here is a packet of glycerine here.
%
```

From the above, we see that each line has had the appropriate text inserted at the front and at the end of the object name.

As for the jar, consider:

```bash
% ls [abfgjklrs]*[^tg][pterodactyl] | tail -5 | head -4
silver

jar:
acid
% hereitems | tail -5 | head -4
There is a silver bar here.
There is a glass jar here.
The jar contains:
     There is a packet of nitric acid here.
%
```

Looking at the above, we see that it is actually the empty line that became `There is a glass jar here.`, while the `jar:` line became `The jar contains:`

One thing that complicates things is knowing when to add the five spaces in front of the acid or the glycerine:

```bash
% ls [abfgjklrs]*[^tg][pterodactyl] | tail -3
jar:
acid
glycerine
% hereitems | grep -eacid -eglycerine -ejar
There is a glass jar here.
The jar contains:
     There is a packet of nitric acid here.
     here is a packet of glycerine here.
% mv jar/acid .
% ls [abfgjklrs]*[^tg][pterodactyl] | tail -3

jar:
glycerine
% hereitems | grep -eacid -eglycerine -ejar
There is a packet of nitric acid here.
There is a glass jar here.
The jar contains:
     here is a packet of glycerine here.
%
```

So, how did the above decide to add the five spaces before the glycerine, but not the acid?

The answer is that the glycerine comes after the `jar:` line,
whereas the acid line did not.

But there is also the case of the empty jar:

```bash
% mv jar/glycerine .
% ls [abfgjklrs]*[^tg][pterodactyl] | tail -3
silver

jar:
% hereitems | grep -eacid -eglycerine -ejar
There is a packet of nitric acid here.
There is a packet of glycerine here.
There is a glass jar here.
%
```

In the above case, the empty line still became "There is a glass jar here.", but the "The jar contains:" lines didn't display because the jar directory is empty.

## alias of hereitems

OK. So how to implement the "hereitems" alias?

At the moment, we will discuss the implementation using the `alias hereitems='...'` syntax of bash; But, in the end, we will be using the `alias hereitems '...'` syntax of csh.

So, what is the structure of the alias? It is this:

```tcsh
alias hereitems='ls [abfgjklrs]*[^tg][pterodactyl] | sed 's__1__;s__2__;s__3____;...;s__16__' | tr \\n @ | sed -n 's__17__;...;s__X__'

ls [abfgjklrs]*[^tg][pterodactyl] | sed 's/^\(ac\|gl\)/packet of &/;s/ acid/ nitric&/;s/^\(am\|ru\).*/valuable &/;s/^$/glass jar/;s/^board/CPU card/;s/bear/ferocious &/;s/bone/dinosaur &/;s/boulder/large &/;s/bracelet/emerald &/;s/key/shiny brass &/;s/lamp/& nearby./;s/license/bus driver`s &/;s/silver/& bar/;s/.*[^:]$/There is a &/;s/a \(food\)/some \1/;s/[^.:]$/& here./;s/a \([aeiou]\)/an \1/;s/\(jar\):/The \1 contains:/' | tr \\n @ | sed -n 's/The jar contains:@$//;s/:@/&     /;s/@There is a blackboard//;s/@/\n/gp'
```

To explain the above, let us first note that the `;` command allows sed to do multiple substitutions.

That is to say:

```bash
  % echo abcdef | sed s/a/A/ | sed s/c/C/ | sed s/e/E/
  AbCdEf
  % echo abcdefg | sed 's/a/A/;s/c/C/;s/e/E/'
  AbCdEf
  %
```

Now, to complete `hereitems`, you must insert a series of sed `s` commands.

Note that you cannot use any commands except the sed "s" command.

### Detail

Here are the details for implementing those `s` commands:

1. \_\_1\_\_:  This adds `"packet of "` in front of the acid AND the glycerine.

```tcsh
sed 's/^\(ac\|gl\)/packet of &/'
```

2. \_\_2\_\_:  This adds `"nitric "` in front of acid.

```tcsh
sed 's/ acid/ nitric&/'
```

3. \_\_3\_\_:  This adds `valuable` in front of the ruby AND the amethyst.

```tcsh
sed 's/^\(am\|ru\).*/valuable &/'
```

4. \_\_4\_\_:  This changes the empty line to `glass jar`.

```tcsh
sed 's/^$/glass jar/'
```

5. \_\_5\_\_:  This changes `board` to `CPU card`.

```tcsh
sed 's/^board/CPU card/'
```

6. \_\_6\_\_ - \_\_13\_\_: These substitutions each fix one item.
   
   > But there is a rule:
   > 
   > In each case, you must use the `&` symbol for the substitution.
   
   ```tcsh
   sed 's/bear/ferocious &/;
        s/bone/dinosaur &/;
        s/boulder/large &/;
        s/bracelet/emerald &/;
        s/key/shiny brass &/;
        s/lamp/& nearby./;
        s/license/bus driver`s &/;
        s/silver/& bar/'
   ```

7. \_\_14\_\_: This adds the `"There is a "` at the front of each line

    ```tcsh
    sed 's/.*[^:]$/There is a &/'
    ```

8. \_\_15\_\_: This turns the `a` to `an` for the emerald bracelet.
   
   > But the rule is:
   > 
   > It should be a general solution, that also would work for other words that start with vowels (eg, the "axe" that appears in a different part of the game).

    ```tcsh
    sed 's/a \([aeiou]\)/an \1/'
    ```

9. \_\_16\_\_: This turns the line that originally was `jar:` to `The jar contains:`

    ```tcsh
    sed 's/\(jar\):/The \1 contains:/'
    ```

10. tr \\n @: The purpose of this is to put all the text onto one line.
    
    > But why do we want to do this?
    > 
    > > The answer has to do with deciding whether to add five spaces before the "There is a packet of nitric acid here." or the "There is a packet of glycerine here.".
    > > 
    > > To decide whether to add the spaces, we have to know whether these items come somewhere after a ":". But that ":" was on an earlier line, so the "tr \\n @" puts everything on one line (while marking the original line breaks with "@" symbols).

11. \_\_17\_\_-\_\_X\_\_: Here, use as many substitutions as you need to use in order to:
    1. Add the spaces in front of the things in the jar,
    2. Remove the `The jar contains:` line if the jar is empty.
    3. Don't print anything about the blackboard object (not even printing an empty line).
    4. Turn each @ back into `\n`
    5. Print the result, if it is not empty.
       
       > For example, suppose that you go to the classroom, then you get the glycerine, then you leave the room, then you re-enter the classroom.  In this case, hereitems should print nothing, not even an empty line.

    ```tcsh
    sed -n 's/The jar contains:@$//;s/:@/&     /;s/@There is a blackboard//;s/@/\n/gp'
    ```

