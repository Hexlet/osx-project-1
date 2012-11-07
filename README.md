osx-project-1
=============

## Описание задания [(сдать задание)] (https://u.hexlet.org/courses/4/assignments/5)

1. Создайте новое консольное приложение в XCode.

2. Создайте класс Cell, который наследуется от NSObject.

3. В классе создайте переменную DNA типа NSMutableArray – массив из 100 символов. Этот массив будет представлять ДНК. Вам нужно самостоятельно разобраться с созданием массива и выбрать класс или тип для использования для символов.

4. Создайте собственный метод init. Не забудьте в нем вызвать [super init] (https://u.hexlet.org/courses/4/wiki/self-i-pierieghruzka-init). В этом методе задайте значение каждого из 100 символов в случайном порядке из множества A, T, G и С. Иными словами, каждая ячейка вашего массива должна быть одним из этих четырех символов.

5. Создайте метод hammingDistance, который возвращает int и принимает объект класса Cell. Этот метод должен сравнивать свой ДНК и ДНК переданного в качестве аргумента объекта и возвращать количество позиций где символы ДНК не совпадают. Например: ATGGCATTTAGC и ATAGCTTTTCGC. На трех позициях ДНК не совпадают, значит hamming distance = 3. 

6. Создайте категорию mutator класса Cell. В ней опишите метод mutate, который возвращает void и принимает int.

7. Создайте имплементацию (реализацию) метода mutate. Метод должен заменить X процентов символов в массиве DNA в случайном порядке; Х – значение переданной переменной типа int. Нужно заменить строго Х процентов, то есть заменять одну ячейку можно максимум один раз.

8. В main-функции создайте два объекта класса Cell, выведите на экран hamming distance между их ДНК, потом мутируйте каждый из объектов и выведите на экран новый hamming distance.

### Примечание
Прикладывайте полностью весь проект, включая .xcodeproj. Так значительно легче проверять ваши работы! 



#import "Cell.h"

@implementation Cell

//initialization of instance
-(id) init
{
    self = [super init];
    if (self) {
        NSLog(@"sdfsfd");
        // Custom 
    }
    return self;
}

@end
