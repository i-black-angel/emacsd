# emacsd

This directory includes some cool emacs feature configuration and
plugins files. Before started below actions, MAKE SURE YOU HAVE BACKUP
YOUR PRECIOUS CONFIGURE FILES. :D

1. BACKUP FILES(optional)

       $ mv ~/.emacs.d ~/.emacs.d-bak
       
       $ mv ~/.emacs ~/.emacs-bak

2. GIT CLONE
   Clone this reporitory to your HOME dirctory.

       $ git clone https://github.com/i-black-angel/emacsd.git ~/.emacs.d

3. SETUP
   
       $ ln -s .emacs.d/dotemacs ~/.emacs

   And now, you can start emacs with all these configurations.
   It's very easy, right? 

4. OPTIMIZE (optional)
   Start emacs, type

       'C-0 M-x byte-recompile-directory'

   and type '~/.emacs.d', this command will compile all the .el files in
   the directory and in all subdirectories below.
