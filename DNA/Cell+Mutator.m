#import "Cell+Mutator.h"
#import "NucleobaseType.h"
#import <stdlib.h>

@implementation Cell (Mutator)

-(void)mutate:(int)percent {
    NSMutableArray* mutationPositionsMask = [self createMutationPositionsMask: percent];
    for (int i = 0; i < [mutationPositionsMask count]; i++) {
        if ([[mutationPositionsMask objectAtIndex:i] boolValue]) {
            NSString* replacement = [NucleobaseType randomExcluding:[self.dna objectAtIndex:i]];
            [self.dna replaceObjectAtIndex:i withObject: replacement];
        }
    }
}

-(NSMutableArray*)createMutationPositionsMask:(int)percent {
    
    int totalPositionsCount = (int)[self.dna count];
    int mutationPositionsCount = (int)(totalPositionsCount * percent / 100);
    
    NSMutableArray* positions = [[NSMutableArray alloc] initWithCapacity:totalPositionsCount];

    for (int i = 0; i < totalPositionsCount; i++) {
        [positions addObject: [NSNumber numberWithBool:NO]];
    }
    for (int i = 0; i < mutationPositionsCount; i++) {
        [positions replaceObjectAtIndex:i withObject: [NSNumber numberWithBool:YES]];
    }
    [[self class] shuffle:positions];
    
    return positions;
}

+(void)shuffle:(NSMutableArray*)array {
    for (int i = 0; i < [array count]; i++) {
        int targetPosition = arc4random_uniform((int)[array count]);
        [array exchangeObjectAtIndex:i withObjectAtIndex:targetPosition];
    }
}

@end
