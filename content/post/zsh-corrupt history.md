+++
date = "2014-05-25"
title = " Как да поправим повреден файл на историята в zsh"
tags = ["zsh"]
+++

Ако някога видите такова съобщение **zsh: corrupt history file /home/ivo/.zsh_history** при стартиране на сесия в терминалът. Не бързайте да триете `~/.zsh_history` файла, и с него цялата история която пази. Решението е по просто от колкото вие може би си мислите . 

Изпълнете в терминала .

```
$ cd ~/
$ mv .zsh_history .zsh_history.back
$ strings .zsh_history.back > .zsh_history
```

Презаредете историята и zsh сесията . 

```
$ fc -R .zsh_history
$ . ~/.zshrc
```
