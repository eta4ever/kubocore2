3D-принтер Kubocore 2. Дальний родственник SmartCore. Точнее, был первый Kubocore, который форк SmartCore из алюминиевой трубы. А второй - из конструкционного профиля 2020 и на рельсах MGN12. Общего со SmartCore - кинематика CoreXY двухуровневая и подшипники 608zz в качестве роликов.

Все изображено в "Компас-3D". Актуальная сборка - assembly_v3 в корне. Parts - просто детали. Printed parts - соответственно, печатные.

В общем, кубик из 2020, уголки печатные, Т-гайки китайские, рельсы нетипично расположены, чтобы уменьшить подъем ремней - для двух уровней сильно актуально. Печатает. 

http://3dtoday.ru/tag/kubocore+2/

---

Чуток подробностей. Тезисно.

--XY--

8 подшипников 60zz в качестве роликов ремней. Насажены на обрезки валов 8 мм, проложены печатными шайбами.

П-образный профиль 12х15 мм под рельсой X. 

Ремни натягиваются ручками. Для компенсации неравномерности натяга можно дополнительно подтянуть ремни подручными средствами (ну, там, пружинкой от прищепки) на участке за печатающей головкой (там перехлест, "правый" ремень идет к левому краю и наоборот).

Хотэнд E3D (в моем случае Volcano) крепится за верхнее горлышко алюминиевым держателем 16-миллиметрового вала (SK16).

--Z--

Два вала 12 мм, соотв., 4 держателя SK12. Длинные фланцевые подшипники (LMF12LUU) прикручены к 12-миллиметровой фанере (насквозь), она - основание стола.

Ходовой винт - TR8x8 с латуниевой гайкой, муфта обычная "пружинка", в нее закинут шарик от подшипника, чтобы на наклон работала, а на сжатие - нет.

---

Держатели движков - от cnc-tehnologi.ru. Алярма, они не особо стандартные. Надо прикидывать, можно ли поставить обычные.

Остальное менее интересно. Электроника - любая подходящая. Работало оно на MKS Gen (Marlin 1.02), сейчас на MKS SBase (Smoothieware).

