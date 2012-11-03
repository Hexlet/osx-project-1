//
//  Cell.m
//  DNAProject
//
//  Created by sagod on 03.11.12.
//  Copyright (c) 2012 Alexander Gudulin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init {
    ATGC = @[@"A", @"T", @"G", @"C"];
    
    self = [super init];
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i < 100; ++i) {
            int randomIndex = arc4random() % [ATGC count];
            [_DNA addObject: [ATGC objectAtIndex:randomIndex]];
        }
    }
    return self;
}

-(int)hammingDistance:(Cell *)cell {
    int counter = 0;
    for (int i = 0; i < [_DNA count]; ++i) {
        if ([_DNA objectAtIndex:i] != [[cell DNA] objectAtIndex:i]) {
            counter++;
        }
    }
    return counter;
}

@end

//
// Category implementation
//
@implementation Cell (mutator)

-(void)mutate:(int)percentages {
    if (percentages > 100 || percentages < 0) {
        [NSException raise: @"Invalid percentages value"
                    format: @"percentages of %d is invalid. It should be > 0 and < 100", percentages];
    }
    
    NSMutableDictionary *mutatedIndices = [NSMutableDictionary dictionary];

    for (;;) {
        if (percentages == 0) {
            break;
        }
        
        // Get index of item to replace
        int i = arc4random() % [_DNA count];
        
        // Check to see if we replaced the item on this index
        if ([mutatedIndices objectForKey:[NSNumber numberWithInt:i]] != [NSNumber numberWithBool:YES]) {
            NSString *oldValue = [_DNA objectAtIndex:i];
            
            // Get ATG|ATC|AGC|TGC array
            NSMutableArray *newATGC = [[NSMutableArray alloc] init];
            for (int j = 0; j < 4; ++j) {
                if ([ATGC objectAtIndex:j] != oldValue) {
                    [newATGC addObject:[ATGC objectAtIndex:j]];
                }
            }
            
            int randomIndex = arc4random() % [newATGC count];
            NSString *newValue = [newATGC objectAtIndex:randomIndex];
            [_DNA replaceObjectAtIndex:i withObject:newValue];
            // Save replaced item index
            [mutatedIndices setObject:[NSNumber numberWithBool:YES] forKey:[NSNumber numberWithInt:i]];
            
            percentages--;
        }
    }
}

@end