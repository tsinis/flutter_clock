:globe_with_meridians:  [english](README.md)	[český](README.cz.md)	**<u>русский</u>**

# Векторная графика использованная в стимпанк часах Flutter Clock

Вся векторная графика находящаяся тут, была создана и оптимизирована, для использования в [Rive](https://rive.app) (бывшее Flare) анимации, с помощью бесплатных онлайн инструментов.
> **Примечание:** в настоящий момент (январь 2020) имеются некоторые проблемы импорта SVG графики в Rive. Поэтому в здесь вы не найдёте никаких радиальных градиентов а наличие линеарных градиентов сведено к минимуму.

Графика была подготовлена в бесплатном онлайн редакторе векторной графики, под названием [Gravit Designer](https://www.designer.io/) (в данном случае функции «Про» версии не обязательны), после чего экспортированы в формат SVG без фона. Потом SVG файлы были оптимизированы (для облегчения) и импортированы в Rive. *Из за технических проблем я не использовал всю подготовленную графику.*

---
Файлы, которые вы возможно ищете:
* Оригинальный исходник Gravit Designer файла, находится в корне папки под названием [clock.gvdesign](clock.gvdesign).
* SVG файлы (оптимизированные и нетронутые) находятся в папке [SVG](./svg).
* Профиль SVG оптимизации, тоже находится в корне папки под названием [SVGO.yml](svgo.yml).
* Бесплатный шрифт (с лицензией OFL) использованный в термометре, называется «Ораниенбаум» (Oranienbaum), доступный на странице [Google Fonts](https://fonts.google.com/specimen/Oranienbaum), вы также можете найти его в папке [analog_clock/third_party](../analog_clock/third_party/).
* Открытые исходники анимации сами по себе находятся в моём профиле [Rive](https://rive.app/a/tsinis).
* Сам экспортированный бинарный FLR файл находится в папке [analog_clock/assets](../analog_clock/assets/).