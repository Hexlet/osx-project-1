#import "Cell.h"

@implementation Cell {
    int CAPACITY;
}

-(id) init {
    self = [super init];
    CAPACITY = 100;

    // init Array
    _DNA = [NSMutableArray arrayWithCapacity:CAPACITY];

    return self;
}

-(id) insertRandomData {
    for (int i = 0; i < CAPACITY; i++) {
        [_DNA addObject:[self getRandomElement]];
    }
  
    return self;
}

-(id) getRandomElement {
    srandomdev();
    
    NSArray *values = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
    NSUInteger randomIndex = arc4random() % [values count];
    
    
    return [values objectAtIndex:randomIndex];
}

-(void) print {
    NSString *str = [[NSString alloc] init];
    
    for (int i = 0; i < CAPACITY; i++) {
        str = [str stringByAppendingString:[_DNA objectAtIndex:i]];        
    }
    
    NSLog(@"%@", str);
}

-(int) hammingDistance:(Cell *)cellObject {
    int distance = 0, arrayLength;
    
    arrayLength = (int)[self.DNA count];
    
    for (int i = 0; i < arrayLength; i++) {
        if ( [self.DNA objectAtIndex:i] != [cellObject.DNA objectAtIndex:i]) {
            distance++;
        }
        
    }
    
    return distance;
}

-(void)mutate:(int)percentage {
    NSMutableArray *indices = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0; i < 100; i++) {
        [indices addObject:[NSNumber numberWithInt:i]];
    }
    
    [indices shuffle];
    
    for (int i = 0; i < percentage; i++) {
        [self.DNA replaceObjectAtIndex:i withObject:[self getRandomElement]];
    }
}

@end
