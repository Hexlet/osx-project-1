//
//  main.m
//  osx-project-1
//
//  Created by wtf on 11/11/12.
//  Copyright (c) 2012 on. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void) mutate:(int) ms;

@end

@implementation Cell (mutator)

-(void) mutate:(int) ms {
    NSMutableArray* mutateArray = [NSMutableArray arrayWithCapacity:100];
    
    for (int i = 0; i < 100; i++) {
        [mutateArray addObject:[NSNumber numberWithInt:i]];
    }
    
    // Shuffle mutateArray
    for (NSUInteger i = 0; i < 100; i++) {
        [mutateArray exchangeObjectAtIndex:i withObjectAtIndex:(arc4random() % (100 - i)) + i];
    }
    
    for (NSUInteger i = 0; i < ms; i++) {
        NSMutableArray* nbForReplace = [NSMutableArray arrayWithArray:self.NB];
        [nbForReplace removeObjectIdenticalTo:[self.DNA objectAtIndex:[[mutateArray objectAtIndex:i] integerValue]]];
        
        [self.DNA replaceObjectAtIndex:[[mutateArray objectAtIndex:i] integerValue]
                            withObject:[nbForReplace objectAtIndex:[[NSNumber numberWithInt:arc4random() & 2] integerValue]]];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell* herpCell = [[Cell alloc] init];
        Cell* derpCell = [[Cell alloc] init];
        
        NSLog(@"%i", [herpCell hammingDistance:derpCell]);
        
        [herpCell mutate:100];
        [derpCell mutate:100];
        
        NSLog(@"%i", [herpCell hammingDistance:derpCell]);
    }
    return 0;
}

