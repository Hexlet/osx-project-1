//
// Created by eugenedymov on 01.11.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CellElement.h"

@interface CellElement ()
@property(nonatomic, copy) NSString *value;
@end

static NSArray *_values = nil;

@implementation CellElement {

}
@synthesize value = _value;

- (id)init {
    self = [super init];
    if (self) {
        _value = @"";
    }

    return self;
}


+ (CellElement *)randomElement {
    CellElement *cellElement = [[CellElement alloc] init];
    [cellElement randomize];

    return cellElement;
}

- (void)randomize {
    if (!_values) {
        _values = @[@"A", @"T", @"G", @"C"];
    }

    self.value = _values[arc4random() % _values.count];
}

- (void)randomizeExcludingValue:(NSString *)value {
    [self randomize];

    // Если получили одинаковые значения
    if ( self.value == value ) {
        NSUInteger randomShift = (NSUInteger) [self randWithMin:1 max:_values.count - 1];
        NSUInteger newIndex = ([_values indexOfObject:self.value] + randomShift) % _values.count;

        self.value = _values[newIndex];
    }
}

- (void)randomizeExcludingCurrentValue {
    [self randomizeExcludingValue:self.value];
}

- (BOOL)isEqual:(id)other {

    // Переопределяем метод для корректного сравнения объектов
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;

    // Сравниваем 2 объекта CellElement
    return [self isEqualToCellElement:other];
}

- (BOOL)isEqualToCellElement:(CellElement *)element {
    if (self == element)
        return YES;

    // Если property value различны по адресам — объекты не равны(возвращаем NO). Сравнение через != или == в данном случае можно использовать(см. откуда берутся значения для property value).
    if (self.value != element.value) {
        return NO;
    }
    return YES;
}

-(NSUInteger)randWithMin:(NSUInteger)min max:(NSUInteger)max
{
    NSUInteger range = (max - min);
    NSUInteger rand = (arc4random() % (range + 1)) + min;
    return rand;
}

- (NSString *)description {

    // Формируем более human-readable вывод
    return self.value;
}


@end