//
//  Cell.m
//  DNA_App
//
//  Created by Anton Stepanov on 05.11.12.
//  Copyright (c) 2012 home. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init: (int) count{
    self = [super init];
    DNA = [[NSMutableArray alloc] init];
    NSString *needChars[4] = {@"A", @"T", @"G", @"C"};
    for (int i = 0; i < count; i++) {
        [DNA addObject:needChars[arc4random()%4]];
    }
    return self;
}

-(int) hammingDistance: (Cell*) cell{
    int diff = 0;
    
    if ( [DNA count] != [cell->DNA count] ) {
        NSLog(@"\nError DNA Length: (%ld) & (%ld)\n", [DNA count], [cell->DNA count]);
        return -1;
    }
    
    for (int i = 0; i < [DNA count]; i++) {
        if ([DNA objectAtIndex:i] != [cell->DNA objectAtIndex:i]) {
            diff++;
        }
    }
    
    return diff;
}

-(void) showDNA {
    NSLog(@"\nDNA:\n(%@)\n\n", [self->DNA componentsJoinedByString:@""]);
}

@end
