+++
date = "2013-12-18"
title = "Организиране на текстови бележки с emacs"
tags = ["emacs", "deft"]
+++

Преди няколко дни открих [deft](http://jblevins.org/projects/deft/) за emacs, който служи за бързо преглеждате, филтриране и редакция на директории с обикновени текстови бележки. Това ще рече, че лесно може да преглеждаме и организираме нашите летящи бележки във вид на файлове, също запазваме дори синхронизираме в посочена от нас директория. Едно удобно решение може да бъде, всичките да отиват в Dropbox, в папка която аз например съм нарекъл Enotes (еmacs notes), така ще направим справянето с тази голяма колекция от хвърчащи листчета много по-лесно.

Ако някой се интересува това е моята настройка:

```cl
(require 'deft)
(setq
   deft-use-filename-as-title t
   deft-extension "org"
   deft-directory "~/Dropbox/Enotes/"
   deft-text-mode 'org-mode)

(global-set-key [f8] 'deft)
```

Аз съм избрал [org-mode](http://orgmode.org/), но ако желаете може да използвате за вашите бележки markdown формат:

```cl
(setq deft-text-mode 'markdown-mode)
```

После стартираме със <kbd>M-x</kbd> deft , някои полезни команди .

- <kbd>RET</kbd> - Отваряне на текущият файл.
- <kbd>C-c C-n</kbd> - Създаване на нов файл.
- <kbd>C-c C-d</kbd> - Изтриване на файл.
- <kbd>C-c C-r</kbd> - Променяне името на файла.

