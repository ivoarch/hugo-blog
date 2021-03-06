+++
date = "2012-07-12"
title = "Emacs guru-mode"
tags = ["emacs"]
+++

Ако учите Emacs, трябва да свиквате с правилните клавиши за навигация, или преминаването към определено място
в рамките текста на екрана. Можете да направите това по няколко начина. Може да използвате клавишите със
стрелки, но е по-ефективно да поддържате ръцете си в позиция, използвайки стандартните команди <kbd>C-p</kbd>, <kbd>C-b</kbd>, <kbd>C-f</kbd>, и <kbd>C-n</kbd>. Тези символи са еквивалентни на четирите клавиши със стрелки, по следния начин:


                              Предишна линия, C-p
                                     :
                                     :
           Назад, C-b.... Текущата позиция на курсора .... Напред, C-f
                                     :
                                     :
                              Следваща линия, C-n

[Guru-mode](https://github.com/bbatsov/guru-mode) написана от [Bozhidar Batsov](http://batsov.com/), забранява тези команди на клавиатурата със стрелките и предлага използването на алтернативните установени от Emacs.

Ако използвате Emacs/24, или имате последната версия на `package.el` може да си инсталирате лесно `Guru-mode`
от хранилищата [Marmalade](http://marmalade-repo.org/) и [Melpa](http://melpa.milkbox.net/), с командата `M-x package-install`. Веднъж инсталиран, добавете следното в `.emacs` или `init.el` файла.

```cl
(require 'guru-mode)
(guru-global-mode +1)
```
