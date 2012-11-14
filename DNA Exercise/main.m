#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void)mutate:(int)hammingDistance;
@end

@implementation Cell (mutator)
-(void)mutate:(int)hammingDistance {
    for (i=0; i<=hammingDistance; i++) {
        j = arc4random()%4;
        [[self DNA] replaceObjectAtIndex:i withObject:[[self nucleotides]objectAtIndex:j]];
    }
}
@end

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cellOne, *cellTwo;
        cellOne = [[Cell alloc] init];
        cellTwo = [[Cell alloc] init];
        
        [cellOne hammingDistance:[cellTwo DNA]];
        
        [cellOne mutate:[cellOne distance]];
        [cellTwo mutate:[cellOne distance]];
        
        [cellOne hammingDistance:[cellTwo DNA]];
    }
    return 0;
}