# anki-clone
Данный репозиторий содержит клон приложения [Anki]() для запоминания различной информации. 

Основной целью данного проекта является изучение базовых Design Patterns в iOS.

## Пройденные темы: 

* [MVC](#mvc) - ака Model-View-Controller. Базовый паттерн разработки мобильных приложений.
* [Delegation pattern](#delegation) - The delegation pattern enables an object to use another “helper” object to provide data or perform a task rather than do the task itself
* [Strategy pattern](#strategy) - The strategy pattern defines a family of interchangeable objects that can be set or switched at runtime
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
![](https://s3.amazonaws.com/oodles-technologies1/blog-images/9680efe1-b47a-49c0-a68c-e911906df8ff.png)

The delegation pattern enables an object to use another “helper” object to provide data or perform a task rather than do the task itself. This pattern has three parts:
* An object needing a delegate, also known as the delegating object. It’s the object that has a delegate. The delegate is usually held as a weak property to avoid a retain cycle where the delegating object retains the delegate, which retains the delegating object.
* A delegate protocol, which defines the methods a delegate may or should implement.
* A delegate, which is the helper object that implements the delegate protocol.

Apple frameworks commonly use the term DataSource to group delegate methods that provide data. For example, UITableViewDataSource is expected to provide UITableViewCells to display.
Apple frameworks typically use protocols named Delegate to group methods that receive data or events. For example, UITableViewDelegate is notified whenever a row is selected.

Delegates are extremely useful, but they can be overused. Be careful about creating too many delegates for an object.
If an object needs several delegates, this may be an indicator that it’s doing too much. Consider breaking up the object’s functionality for specific use cases, instead of one catch-all class.

You should also be careful about creating retain cycles. Most often, delegate properties should be weak. If an object must absolutely have a delegate set, consider adding the delegate as an input to the object’s initializer and marking its type as forced unwrapped using ! instead of optional via ?. This will force consumers to set the delegate before using the object.
If you find yourself tempted to create a strong delegate, another design pattern may be better suited for your use case. For example, you might consider using the strategy pattern instead. 

* The delegation pattern has three parts: an object needing a delegate, a delegate protocol and a delegate.
* This pattern allows you to break up large classes and create generic, reusable components.
* Delegates should be weak properties in the vast majority of use cases.

### Strategy 

![](https://miro.medium.com/max/4000/1*F8nCO22vAG4mht6FyzOGbg.png)

This pattern has three parts:
* The object using a strategy. This is most often a view controller when the pattern is used in iOS app development, but it can technically be any kind of object that needs interchangeable behavior.
* The strategy protocol defines methods that every strategy must implement.
* The strategies are objects that conform to the strategy protocol.

Be careful about overusing this pattern. In particular, if a behavior won’t ever change, it’s okay to put this directly within the consuming view controller or object context. The trick to this pattern is knowing when to pull out behaviors, and it’s okay to do this lazily as you determine where it’s needed.

Use the strategy pattern when you have two or more different behaviors that are interchangeable.
This pattern is similar to the delegation pattern: both patterns rely on a protocol instead of concrete objects for increased flexibility. Consequently, any object that implements the strategy protocol can be used as a strategy at runtime.
Unlike delegation, the strategy pattern uses a family of objects.
Delegates are often fixed at runtime. For example, the dataSource and delegate for a UITableView can be set from Interface Builder, and it’s rare for these to change during runtime.
Strategies, however, are intended to be easily interchangeable at runtime.

### Singleton

### Memento

### Observer

### Builder
