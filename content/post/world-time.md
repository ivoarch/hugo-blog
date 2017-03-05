+++
date = "2014-10-27"
title = "Световното време в терминалът"
tags = ["bash"]
+++

Може би сте срещали различни добавки за панели или такива за десктопа, при които ви се показва световното време (world time).
Ето какво успях да сглобя само, че за терминалът в Linux.

Следвайте стъпките:

1. Запазете като например: `wtime.sh`
2. След което направете скрипта изпълним: `chmod +x wtime.sh` 
3. По желание добавете други часови зони (погледнете във `/usr/share/zoneinfo`)
4. Стартирайте `./wtime.sh`

```sh
#!/bin/bash
 
shopt -s expand_aliases
 
clear;
 
alias datetime="date +'%a-%d-%b,%H:%M'"
echo -e 'Колко е часът във Европа?'
echo -e '==========================='
echo -e 'Amsterdam:\t\t' "$(TZ="Europe/Amsterdam" datetime)"
echo -e 'Madrid: \t\t' "$(TZ="Europe/Madrid" datetime)"
echo -e 'Berlin: \t\t' "$(TZ="Europe/Berlin" datetime)"
echo -e 'Sofia: \t\t' "$(TZ="Europe/Sofia" datetime)"
echo -e 'Moscow: \t\t' "$(TZ="Europe/Moscow" datetime)"
echo -e 'Istanbul: \t\t' "$(TZ="Europe/Istanbul" datetime)"
echo -e 'London: \t\t' "$(TZ="Europe/London" datetime)"
echo -e ''
echo -e 'Колко е часът във Америка?'
echo -e '==========================='
echo -e 'NYC: \t\t' "$(TZ="America/New_York" datetime)"
echo -e 'Bogota: \t\t' "$(TZ="America/Bogota" datetime)"
echo -e 'Mexico City:\t\t' "$(TZ="America/Mexico_City" datetime)"
echo -e ''
echo -e 'Колко е часът във Азия?'
echo -e '==========================='
echo -e 'Tokyo: \t\t' "$(TZ="Asia/Tokyo" datetime)"
echo -e 'Bangkok: \t\t' "$(TZ="Asia/Bangkok" datetime)"
echo -e 'HongKong: \t\t' "$(TZ="Asia/Shanghai" datetime)" 
```
