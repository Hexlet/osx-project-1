//
//  Cell.m
//  osx-project-1
//
//  Created by Sergey Kondratyev on 01.11.12.
//  Copyright (c) 2012 Sergey Kondratyev. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA;

- (id) init {
    self = [super init];
    
    if (self) {
        
        DNA = [NSMutableArray arrayWithCapacity:100];
        
        for (int i=0; i<100; i++) {
            
            NSArray *nucliotids = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
                    
            [DNA addObject:[nucliotids objectAtIndex:(int)(arc4random() % [nucliotids count])]];
            //NSLog(@"Addition NSSring object str: %@",str);
        }
    }
    return self;
}

- (int) hammingDistance:(Cell *)insertCell {
    
    int countMatchMembers = 0;
    
    for (int i=0; i<100; i++) {
        if ([[[self DNA] objectAtIndex:i] isNotEqualTo: [[insertCell DNA] objectAtIndex:i]]) {
            //NSLog(@"str1 %@ str2 %@",str1, str2);
            countMatchMembers++;
        }
    }
    return countMatchMembers;
}
@end
