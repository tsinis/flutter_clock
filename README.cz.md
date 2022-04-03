:globe_with_meridians:  [english](README.md)    <u>**český**</u>    [русский](README.ru.md)

# Steampunk hodinky pro soutěž Flutter Clock

Tento projekt je **jedním z vítězů** ve společné vývojářské/design soutěži firem **Google a Lenovo**, pod názvem “***Flutter Clock***” (s **více než 850** platnými příspěvky z celého světa). Cílem této soutěže bylo vytvoření nejhezčího designu chytrých hodinek Lenovo, za použiti frameworku Flutter, pomocného baličku Flutter Clock Helper a bezplatných/volných nástrojů. Více o soutěži, v anglickém jazyce naleznete na oficiálních stránkách: [flutter.dev/clock](https://flutter.dev/clock)

![Vizualizace Steampunk hodinek](previews/preview.jpg)

Vytvořil jsem variantu analogových hodinek, v duchu Viktoriánské éry (konec osmnáctého, začátek devatenáctého století). Je to spíše designérská soutěž — proto je tu **hodně detailů a animaci**, vytvořených pomoci nástroje [Rive](https://rive.app) (bývalé Flare).

> **Poznámka:** design je sám o sobě nezávislý na velikosti displeje, tj. aplikaci lze spustit na jakkoli velkém displeji bez ztráty kvality (všechna grafika je připravena ve křivkách), avšak vytvářel jsem ho pro menší displeje, o velikosti cca 4-6’ (tak je velký displej chytrých hodinek Lenovo).

Obsahují tmavé a světlé téma, **kukačku, čtyři "easter egg"** a taky zobrazují počasí a teplotu, získané přes pomocný balíček Flutter Clock Helper. Aplikace funguje na všech platformách, které Flutter nabízí, a je plně pokryta testy. **Ukázku všech hlavních funkci a animaci naleznete v tomto videu:**

[![Steampunk hodinky pro soutěž Flutter Clock](previews/video_preview.jpg)](https://vimeo.com/tsinis/flutterclock)
[Vimeo](https://vimeo.com/tsinis/flutterclock) nebo [YouTube](https://youtu.be/1cwBYMQwRb8)

---

* Samotný kód tohoto projektu (včetně mých komentářů) а další informace, se nacházejí ve složce [analog_clock](./analog_clock).
* Další informace o ručně zpracované vektorové grafice, použité pro animace [Rive](https://rive.app), naleznete ve složce [vector_assets](./vector_assets).

> V každé z těchto dvou složek jsou další video materiály o přípravě animací nebo o spuštění aplikace na reálných zařízeních.

* Kód pomocného baličku Flutter Clock Helper se nachází v *nedotčené** složce [flutter_clock_helper](./flutter_clock_helper) tohoto repositáře GitHub.

[* *pouze jsem aktualizoval kód na null-safety a přesunul soubor LICENCE Googlu, protože je to jejich kód*](./flutter_clock_helper/LICENSE)
