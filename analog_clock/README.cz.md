:globe_with_meridians:  [english](README.md)    <u>**český**</u>    [русский](README.ru.md)

# Kód projektu steampunkových hodinek Flutter Clock

## Obsah:
* [Popis](#Popis)
* [Licence](#Licence)
* [Záběry ze skutečných zařízení](#Záběry-ze-skutečných-zařízení)
* [Změny](#Změny)
* [Vydání](#Vydání)
* [Známé problémy](#Známé-problémy)
  * [Generovaní APK souborů](#Generovaní-APK-souborů)
  * [Chabý výkon některých zařízeních](#Chabý-výkon)
* [Technická data](#Technická-data)

![Screenshot](screenshot.jpg)

## Popis
Tady naleznete kód tohoto projektu Steampankových hodinek pro soutěž Flutter Clock, Kód se řidí pravidly soutěže, které jsou k dispozici na webu, v anglickém jazyce: [flutter.dev/clock](https://flutter.dev/clock).

## Licence
Kód je licencován na základě příslušné licence s otevřeným zdrojovým kódem (licence BSD tzv. Kalifornské univerzity v Berkeley), podklady ve složce [assets](./assets) jsou licencována s licencí CC BY 4.0 a písmo ve složce [third_party](./third_party), obsahuje licenci OFL. Soubor s názvem LICENSE najdete uvnitř adresářů, který obsahuje kopii licence, s plným textem této licence, v anglickém jazyce.

## Záběry ze skutečných zařízení

Zde najdete nedotčené, 4K záběry, ze skutečných zařízení, s operačními systémy iOS (iPhone, z roku 2016) a Android (tablet 2 v 1, z roku 2013), na nichž jsou vidět tyto hodiny.

Kontrolní součty:

MD5: ```85112361007BD86664C871030E1D3D55```

SHA-1: ```0CFCDFE7EA241C304CA694CC376983F11B1C6E6D```

[![Náhled videa](https://drive.google.com/thumbnail?authuser=0&sz=w3840&id=1MEvmXMpxN4UaGxbnPOzpHPvQ4rkUYXqv)](https://1drv.ms/u/s!Aoc8-1_hYIfGiFPEwgpoCKerXyNC?e=TLMM3v)

[Dropbox](https://www.dropbox.com/sh/artyk72v9tckws3/AAAc5q7e0c70HiCDLuuiNN9Ia?dl=0) |
[Google Drive](https://drive.google.com/open?id=1XkKovGk6c6a0NpMadtCMXMx6KAM61RPp) | [Mega.nz](https://mega.nz/#F!5UlUzKBT!NZLFHkueFZT_SJWvZf1yAQ) |
[OneDrive](https://1drv.ms/u/s!Aoc8-1_hYIfGiFPEwgpoCKerXyNC?e=TLMM3v) |
[Amazon Drive](https://www.amazon.com/clouddrive/share/gtEpUwtoJYL0UvYkvPirVcsCnrloKuaGbtxKqbrCWlr) |
[iCloud](https://www.icloud.com/iclouddrive/0BYofNXgp-nZoBJBiTW_gIJlg#20200121%5F143234)

## Změny
Hlavní změny oproti původnímu kódu, z příkladu analogových hodinek, poskynutého firmou Google:
* odstraněný nevyužité soubory a složky,
* v tomto [kořenovém](./) adresáři:
    * úpraven [.gitignore](./.gitignore) soubor,
    * přidány [README.md](./README.md) soubory v různých jazycích,
    * do [pubspec.yaml](./pubspec.yaml) přidány — závislost [Rive](https://rive.app) (bývalé Flare), upraven popis a verze SDK byla zvýšena na 2.7.0,
* v [lib](./lib) adresáři:
    * [main.dart](./lib/main.dart) — přidán celoobrazovkový řežím a orientace na šířku, ukládaní animaci do mezipaměti, zbytek beze změn,
    * [analog_clock.dart](./lib/analog_clock.dart) — odstraněné nevyužité proměnné, deklarován ovladač animaci a změnený dvě metody, zbytek beze změn,
    * přidány soubory [animation_controller.dart](./lib/animation_controller.dart) a [temperature_converter.dart](./lib/temperature_converter.dart),
* složka [assets](./assets) — nevyužita grafika vyměněna za soubor animace,
* složka [ios](./ios) — nastavená orientace na šířku pro iOS zařízeni, vygenerován unikátní název,
* složka [android](./android) — upraven [build.gradle](./android/build.gradle) soubor (viz Známé problémy),
* přidána složka [third_party](./third_party), obsahující písmo a licenci k němu.

**Veškerý nový/úpravný kód obsahuje komentáře**, popisující co se děje.

## Vydání

Binární spouštěcí soubory najdete v části [Releases](https://github.com/tsinis/flutter_clock/releases) tohoto repozitáře GitHub. Přidávám je postupně.

## Známé problémy
Na platformě Android se mohou vyskytovat tyto problémy:
#### Generovaní APK souborů
Vygenerovaní jakéhokoliv typu APK souboru je ukončeno s chybou v terminálu. Opravou slouží následující úprava závislosti v buildscript’u, souboru [build.gradle](./android/build.gradle), ve složce android. Poslední známa funkční verze byla 3.4.2, proto změňte řádek číslo devět z:
```markdown
classpath 'com.android.tools.build:gradle:3.5.0'
```
na:
```markdown
classpath 'com.android.tools.build:gradle:3.4.2'
```
Potíže by měli tímto zmizet.
#### Chabý výkon
Všechny animace jsou nastavené na frekvencí snímku do **25 FPS**, ale v tuto chvíli (leden 2020), na některých Android zařízeních, nejsou animace plynulé. Je tady hned několik otevřených případů v [Issues](https://github.com/2d-inc/Flare-Flutter/issues), repositáře flare_flutter, které se tohoto problému tykají a Rive tým se problémem zabývá, spolu s týmem Skia, tak že v závislosti na tom, kdy toto čtete se u vás problém může nebo nemusí projevit. Pokud ale přece jenom výsledný FPS není dostačující — zkuste v závislostech změnit oficiální baliček flare_flutter na [můj fork](https://github.com/tsinis/flare-flutter) verze 2.0.1, s vypnutým vyhlazováním. Uvnitř [pubspec.yaml](./pubspec.yaml) (v tomto kořenovém adresáři) změňte řádek:
```markdown
  flare_flutter: ^2.0.1
```
na:
````markdown
  flare_flutter:
    git:
      url: git://github.com/tsinis/Flare-Flutter.git
      ref: stable
      path: flare_flutter
````
> **Poznámka:** tento problém s největší pravděpodobnosti závislý na zařízeni, jelikož se mi povedlo úspěšně spustit aplikaci na tabletu z roku 2013 (se systémem Android), bez jakýchkoliv velkých propadů FPS, viz [Záběry ze skutečných zařízení](#Záběry-ze-skutečných-zařízení).

**Na zařízeních se systémem iOS (iPhony) jsem žádné problémy nezaznamenal**, ale v každém případě budu rád za reporty nebo rády k optimalizaci, v Issues sekci.
## Technická data

| Název | Popis |
| ---- | ----------- |
| **Název frameworku** | [Flutter](https://flutter.dev) |
| Verze frameworku | [1.12.13+hotfix.5](https://github.com/flutter/flutter) |
| Kanál frameworku | stabilní |
| **Název jazyka** | [Dart](https://dart.dev) |
| Verze jazyka | [2.7.0](https://github.com/dart-lang) |
| Kanál jazyka | stabilní |
| **Název vývojového prostředí** | [Visual Studio Code](https://code.visualstudio.com/insiders/) |
| Verze vývojového prostředí | [1.42.0](https://github.com/microsoft/vscode) |
| Kanál vývojového prostředí | předběžný |
| Název závislosti **první** strany | Flutter Clock Helper |
| Balíček závislosti **první** strany | [flutter_clock_helper](../flutter_clock_helper) |
| Název závislosti třetí strany | [Rive](https://rive.app) (bývalé Flare) |
| Balíček závislosti třetí strany | [flare_flutter](https://pub.dev/packages/flare_flutter) |
| Verze závislosti třetí strany | [2.0.1](https://github.com/2d-inc/Flare-Flutter) |
| Kanál závislosti třetí strany | stabilní |
| Architektura | Výchozí (posluchač) |