//
// Created by eugenedymov on 01.11.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface CellElement : NSObject {
    NSString *_value;
}

/* Значение {A,T,G,C} */
@property(nonatomic, copy, readonly) NSString *value;

/* Возвращает объект с рандомно заполненным property value */
+ (CellElement *)randomElement;

/* Заполняет property value рандомным значением */
- (void)randomize;

/* Заполняет property value рандомным значением, но исключая выпадение значения attribute value */
- (void)randomizeExcludingValue:(NSString *)value;

/* Заполняет property value рандомным значением, но исключая повторное выпадение текущего значения property value*/
- (void)randomizeExcludingCurrentValue;

@end