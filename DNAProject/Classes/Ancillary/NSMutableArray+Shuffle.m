//
// Created by eugenedymov on 02.11.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSMutableArray+Shuffle.h"


@implementation NSMutableArray (Shuffle)

- (void)shuffle {
    for (NSUInteger i = 0; i < self.count; ++i) {
        NSUInteger newIndex = (arc4random() % (self.count - i)) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:newIndex];
    }
}

@end