//
//  main.m
//  DNA
//
//  Created by n on 12.11.12.
//  Copyright (c) 2012 n. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void) mutate: (int) percentToReplace;

@end

@implementation Cell (mutator)

-(void) mutate: (int) percentToReplace
{
    NSInteger replace = percentToReplace;
    
    // Explicit number of element to replace.
    replace = replace * [self.DNA count] / 100;
    
    // Some preparation in case of data out of range.
    if (replace < 0)
        replace = 0;
    if (replace > [self.DNA count])
        replace = [self.DNA count];
    
    if (replace == 0)
        return;
    
    // Array to store the indices to replace.
    NSMutableArray *indicesToReplace = [[NSMutableArray alloc] initWithCapacity:replace];

    // Temporary var to store generated index to add to indicesToReplace.
    NSNumber *tempIndex = [[NSNumber alloc] init];
    NSInteger i = 0;
    
    while (i < replace)
    {
        // Generate next index.
        tempIndex = [NSNumber numberWithInteger:arc4random() % [self.DNA count]];
        // Avoiding repeating indices.
        if (![indicesToReplace containsObject:tempIndex])
        {
            [indicesToReplace setObject:tempIndex atIndexedSubscript:i];
            i++;
        }
    }
    
    // Possible elements of DNA.
    NSArray *nucleotide = [[NSArray alloc] initWithObjects:@"A", @"C", @"G", @"T", nil];
    NSString *tempNucleotide = [[NSString alloc] init];
    NSInteger DNAindex = 0;
    
    for (i = 0; i<[indicesToReplace count]; i++)
    {
        // Index of DNA array.
        DNAindex = [[indicesToReplace objectAtIndex:i] integerValue];
        // Generate string different from that in DNA array.
        do
        {
            tempNucleotide = [nucleotide objectAtIndex:arc4random() % [nucleotide count]];
        }
        while ([[self.DNA objectAtIndex:DNAindex] isEqualToString:tempNucleotide]);
        
        [self.DNA setObject:tempNucleotide atIndexedSubscript:DNAindex];
    }
}

@end

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Cell *myCell = [[Cell alloc] init];
        Cell *myCell2 = [[Cell alloc] init];
        
        NSLog(@"%d", [myCell hammingDistance:myCell2]);
        
        [myCell mutate:50];
        [myCell2 mutate:77];
        
        NSLog(@"%d", [myCell hammingDistance:myCell2]);
    }
    return 0;
}

