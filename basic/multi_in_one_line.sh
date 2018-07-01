#!/bin/bash

#To summarize (non-exhaustively) bash's command operators/separators:

#    | pipes (pipelines) the standard output (stdout) of one command into the standard input of another one. Note that stderr still goes into its default destination, whatever that happen to be.
#    |& pipes both stdout and stderr of one command into the standard input of another one. Very useful, available in bash version 4 and above.
#    && executes the right-hand command of && only if the previous one succeeded.
#    || executes the right-hand command of || only it the previous one failed.
#    ; executes the right-hand command of ; always regardless whether the previous command succeeded or failed. Unless set -e was previously invoked, which causes bash to fail on an error.

do_something()
{
   if [ $1 -ge 1 ]
   then 
       return 0   # success 
   else
       return 1   # failed 
   fi 
}


do_something 1 && echo "run 1"

#do_something 1 || echo "run 1"

echo "do_something 2"
do_something 2 || echo "run 2"



