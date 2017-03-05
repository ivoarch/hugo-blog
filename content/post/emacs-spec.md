+++
date = "2013-10-14"
title = "Създаване на RPM .spec файл използвайки emacs"
tags = ["emacs", "rpm"]
+++

Полезен трик за изготването на бърз шаблон за направата на RPM .spec файл на Red Hat Enterprise Linux или Fedora. Когато първоначално се създава .spec файл с emacs, той ви дава шаблон който има много от секциите, които ще са ви нужни за направата на вашият RPM .spec файл.

Инсталирайте rpm-spec-mode.

Ако използвате Emacs/24, или имате последната версия на `package.el` може да си инсталирате лесно rpm-spec-mode,
от хранилищата [Marmalade](http://marmalade-repo.org/) и [Melpa](http://melpa.milkbox.net/), с командата `M-x package-install`. Веднъж инсталиран, добавете следното в `.emacs` или `init.el` файла.

```cl
;; RPM .SPEC mode
(autoload 'rpm-spec-mode "rpm-spec-mode.el" "RPM spec mode." t)
  (setq auto-mode-alist (append '(("\\.spec" . rpm-spec-mode))
                                 auto-mode-alist))
```

След което, отидете до директорията на вашият файл *.spec, и го отворете със emacs.

```
$ cd ~/rpmbuild/SPECS
$ emacs program.spec
```

И най накрая шаблона.

![emacs-spec](/images/emacs-spec-templete.png)
