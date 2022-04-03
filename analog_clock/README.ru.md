:globe_with_meridians:  [english](README.md)	[český](README.cz.md)	**<u>русский</u>**

# Код проекта стимпанк часов Flutter Clock

## Содержание

* [Описание](#Описание)
* [Лицензии](#Лицензии)
* [Кадры с реальных устройств](#Кадры-с-реальных-устройств)
* [Изменения](#Изменения)
* [Релизы](#Релизы)
* [Тесты](#Тесты)

![Скриншот](screenshot.jpg)

## Описание

Здесь находится весь код, относящийся к проекту стимпанк часов, конкурса Flutter Clock. Написание кода было регулировано правилами конкурса, больше о правилах, на английском языке, вы можете прочитать тут: [flutter.dev/clock](https://flutter.dev/clock).

## Лицензии

Код лицензируется по соответствующей лицензии с открытым исходным кодом (лицензия типа BSD или Калифорнийского университета), анимации в папке [assets](./assets) лицензируются с лицензией CC BY 4.0, а шрифт в папке [third_party](./third_party) содержит лицензию OFL. Вы можете найти файл с именем LICENSE, внутри папок, который содержит копию лицензии, с полным текстом этой лицензии, на английском языке.

## Кадры с реальных устройств

Здесь вы можете найти необработанные 4K-кадры с реальных устройств, работающих под управлением операционных систем iOS (iPhone, 2016 года) и Android (планшет 2-в-1, с 2013 года) с этими часами в стиле стимпанк.

Контрольные суммы:

MD5: ```85112361007BD86664C871030E1D3D55```

SHA-1: ```0CFCDFE7EA241C304CA694CC376983F11B1C6E6D```

[![Предварительный просмотр видео](https://drive.google.com/thumbnail?authuser=0&sz=w3840&id=1MEvmXMpxN4UaGxbnPOzpHPvQ4rkUYXqv)](https://1drv.ms/u/s!Aoc8-1_hYIfGiFPEwgpoCKerXyNC?e=TLMM3v)

[Dropbox](https://www.dropbox.com/sh/artyk72v9tckws3/AAAc5q7e0c70HiCDLuuiNN9Ia?dl=0) |
[Google Drive](https://drive.google.com/open?id=1XkKovGk6c6a0NpMadtCMXMx6KAM61RPp) | [Mega.nz](https://mega.nz/#F!5UlUzKBT!NZLFHkueFZT_SJWvZf1yAQ) |
[OneDrive](https://1drv.ms/u/s!Aoc8-1_hYIfGiFPEwgpoCKerXyNC?e=TLMM3v) |
[Amazon Drive](https://www.amazon.com/clouddrive/share/gtEpUwtoJYL0UvYkvPirVcsCnrloKuaGbtxKqbrCWlr) |
[iCloud](https://www.icloud.com/iclouddrive/0BYofNXgp-nZoBJBiTW_gIJlg#20200121%5F143234)

## Изменения

Главные изменения, которые были сделаны, исходя из примера от Гугла:

* удалены неиспользуемые файлы и папки,
* в этой [корневой](./) папке:
  * добавлены записи в [.gitignore](./.gitignore) файл,
  * добавлены линты в [analysis_options.yaml](./analysis_options.yaml) файл,
  * добавлены раннеры для всех платформ,
  * добавлены тесты в папку [test](./test) и их покрытие в папку [coverage](./coverage),
  * добавлены [README.md](./README.md) файлы на разных языках,
  * [pubspec.yaml](./pubspec.yaml) — добавлена зависимость [Rive](https://rive.app) (бывшее Flare), зависимости для тестов и линтов, изменено описание и версия фреймворка повышена на 2.16.0,
* в папке [lib](./lib):
  * [main.dart](./lib/main.dart) — настроен ландшафтный и полноэкранный режим, кэширование анимации, остальное без изменений,
  * [analog_clock.dart](./lib/analog_clock.dart) — удалены неиспользуемые переменные, декларирован контроллер анимации и изменены два метода, остальное без изменений,
  * добавлены [time_animation_controller.dart](./lib/time_animation_controller.dart) и [temperature_converter.dart](./lib/temperature_converter.dart),
* в папке [assets](./assets) — неиспользованная графика была заменена файлом анимации,
* в папке [ios](./ios) — аппликация настроена на запуск в ландшафтном режиме, добавлено уникальное название,
* в папке [android](./android) — изменён файл [build.gradle](./android/build.gradle) (смотрите Известные проблемы),
* добавлена папка [third_party](./third_party) с шрифтом и его лицензией.

**Добавленный или изменённый код был комментирован**, дабы было понятно, что он делает.

## Релизы

Вы можете найти бинарники (исполняемые файлы) в разделе [Releases](https://github.com/tsinis/flutter_clock/releases) этого репозитория GitHub.

## Тесты

Апликация покрыта на 100% unit/widget тестами (репорт находится в [./coverage](./coverage/html/)) или запустите в терминале команду*:

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html'
```

> необходимо иметь установленный lcov*
