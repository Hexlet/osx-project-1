#import "NSArray+GetRandomObjectGetter.h"

@implementation NSArray (GetRandomObjectGetter)

- (id)getRandomObject {
    
    if (self.count < 1) {
        return nil;
    }
    
    NSUInteger randomIndex = arc4random() % [self count];
    
    return [self objectAtIndex: randomIndex];
}

@end