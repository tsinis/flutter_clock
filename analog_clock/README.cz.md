:globe_with_meridians:  [english](README.md)    <u>**český**</u>    [русский](README.ru.md)

# Kód projektu steampunkových hodinek Flutter Clock

## Obsah:
* [Popis](#Popis)
* [Licence](#Licence)
* [Změny](#Změny)
* [Známé problémy](#Známé-problémy)
  * [Generovaní APK souborů](#Generovaní-APK-souborů)
  * [Chabý výkon některých zařízeních](#Chabý-výkon)
* [Technická data](#Technická-data)

----
## Popis
Tady naleznete kód tohoto projektu Steampankových hodinek pro soutěž Flutter Clock, Kód se řidí pravidly soutěže, které jsou k dispozici na webu, v anglickém jazyce: [flutter.dev/clock](https://flutter.dev/clock).

## Licence
Kód je licencován na základě příslušné licence s otevřeným zdrojovým kódem (licence BSD tzv. Kalifornské univerzity v Berkeley), podklady ve složce [assets](./assets) jsou licencována s licencí CC BY 4.0 a písmo ve složce [third_party](./third_party), obsahuje licenci OFL. Soubor s názvem LICENSE najdete uvnitř adresářů, který obsahuje kopii licence, s plným textem této licence, v anglickém jazyce.

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
Všechny animace jsou nastavené na frekvencí snímku do **25 FPS**, ale v tuto chvíli (leden 2020), na některých Android zařízeních, nejsou animace plynulé. Je tady hned několik otevřených případů v [Issues](https://github.com/2d-inc/Flare-Flutter/issues), repositáře flare_flutter, které se tohoto problému tykají a Rive tým se problémem zabývá. S velkou pravděpodobnosti vydají ještě letos runtime i pro platformu Android (alespoň tak je uvedeno v jejích [Roadmap](https://portal.productboard.com/rive/1-roadmap/c/56-android-runtime)), tak že v závislosti na tom, kdy toto čtete se u vás problém může nebo nemusí projevit. Pokud ale přece jenom výsledný FPS není dostačující — zkuste v závislostech změnit oficiální baliček flare_flutter na [můj fork](https://github.com/tsinis/flare-flutter) verze 2.0.1, s vypnutým vyhlazováním. Uvnitř [pubspec.yaml](./pubspec.yaml) (v tomto kořenovém adresáři) změňte řádek:
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
> **Poznámka:** tento problém s největší pravděpodobnosti závislý na zařízeni, jelikož se mi povedlo úspěšně spustit dokonce i ladicí verzi aplikaci na tabletu z roku 2013 (se systémem android_x86_64), bez jakýchkoliv velkých propadů FPS.

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