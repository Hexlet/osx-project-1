#import "NSMutableArray (Shuffling).h"
#import "Cell+Mutator.h"

@implementation Cell (Mutator)

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