//
//  Cell+Mutator.m
//  project1-dna
//
//  Created by Артём on 08.11.12.
//
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate: (int) percentage
{
    int numItems = ([_DNA count]*percentage)/100;
    NSMutableSet* mutatedIndices =[[NSMutableSet alloc] init];
    int count = 0;
    do
    {
        NSNumber *index = [NSNumber numberWithInt:arc4random() % [_DNA count]];
        if (!([mutatedIndices containsObject:index]))
        {
            NSString* nucleobase = [self randomNucleobase];
            [_DNA setObject:nucleobase atIndexedSubscript:[index integerValue]];
            [mutatedIndices addObject:index];
            count++;
        }

    } while (count < numItems);
}

@end
