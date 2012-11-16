//
//  main.m
//  osx-project-1
//
//  Created by Aizat on 11/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (Mutator)
-(void)mutate:(int)percentsToChange;
@end


@implementation Cell (Mutator)

-(void)mutate:(int)percentsToChange {
    if (percentsToChange > 100 || percentsToChange <= 0)
        return;
    NSInteger size = [self.DNA count];
    NSMutableArray *range = [NSMutableArray array];
    for (int i = 0; i < size; i++)
        [range addObject:[NSNumber numberWithInteger:i]];
    for (int i = 0; i < size - 1; i++)
        [range exchangeObjectAtIndex:i withObjectAtIndex:arc4random() % (size - i - 1) + i + 1];
    int numberOfNucleotidesToChange = (int)(percentsToChange * size / 100);
    for (int i = 0; i < numberOfNucleotidesToChange; i++) {
        int replacementIndex = [[range objectAtIndex:i] intValue];
        NSString *randomNucleotide = [[self class] getRandomNucleotideExclude:[self.DNA objectAtIndex:replacementIndex]];
        [self.DNA replaceObjectAtIndex:replacementIndex withObject:randomNucleotide];
    }
}
@end

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1;
        Cell *cell2;
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance before mutation: %d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:10];
        [cell2 mutate:100];
        
        NSLog(@"Hamming distance after mutation: %d", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}

