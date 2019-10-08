# anki-clone
Данный репозиторий содержит клон приложения [Anki]() для запоминания различной информации. 

Основной целью данного проекта является изучение базовых Design Patterns в iOS.

## Пройденные темы: 

* [MVC](#mvc) - ака Model-View-Controller. Базовый паттерн разработки мобильных приложений.
* [Delegation pattern](#delegation) - TODO
* [Strategy pattern](#strategy) - TODO
* [Singleton pattern](#singleton) - TODO
* [Memento pattern](#memento) - TODO
* [Observer pattern](#observer) - TODO
* [Builder pattern](#builder) - TODO


### MVC
![](https://www.pvsm.ru/images/2016/04/07/arhitekturnye-patterny-v-iOS-3.png)
Ключевые особенности: 
* MVC разделяет объекты на три категории: models, views и controllers
* MVC предполагает переиспользование моделей, view и контроллеров, однако последние в виду зачастую специфичной логики переиспользуютс не часто. 
* Контроллер выполняет задачу менеджера между моделями и view. Он обновляет view используя новые значения из моделей и реагирует с помощью @IBAction на изменения view.
* MVC является хорошей стартовой точкой, но имеет массу ограничений. Так зачастую контроллеры разрастаются в размерах и превращаются в Massive View Controllers.

### Delegation

### Strategy 

### Singleton

### Memento

### Observer

### Builder
