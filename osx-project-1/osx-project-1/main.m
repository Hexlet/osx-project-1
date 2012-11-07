//
//  main.m
//  osx-project-1
//
//  Created by Роман Евсеев on 05.11.12.
//  Copyright (c) 2012 Роман Евсеев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
- (void) mutate: (int) percent;
@end

@implementation Cell (Mutator)

- (void)mutate:(int)percent {
    if (percent<0 || percent>100) {
        [NSException raise:@"Invalid value" format:@"Value must be in range [0..100]"];
    }
    NSMutableSet * positions = [[NSMutableSet alloc] init];
    int X = [DNA count]*percent/100;
    
    while ([positions count]<X) {
        [positions addObject:[NSNumber numberWithInt:arc4random() % [DNA count]]];
    }
    
    for (int i=0; i<X; i++) {
        [DNA replaceObjectAtIndex:[[[positions allObjects] objectAtIndex:i] integerValue] withObject:[Cell randomElementWithout:[DNA objectAtIndex:i]]];
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell * cell1 = [[Cell alloc] init];
        Cell * cell2 = [[Cell alloc] init];

        NSLog(@"Hamming distance before mutation: %d",[cell1 hammingDistance:cell2]);

        [cell1 mutate:30];
        [cell2 mutate:30];

        NSLog(@"Hamming distance after mutation: %d",[cell1 hammingDistance:cell2]);
    }
    return 0;
}
