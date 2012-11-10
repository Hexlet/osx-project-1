//
//  Cell.m
//  Project1 - DNA
//
//  Created by Dennis Dmitriev on 10.11.12.
//  Copyright (c) 2012 Dennis Dmitriev. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        _Tags = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        DNA = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i<100; i++) {
        [DNA addObject:[NSString stringWithFormat:@"%@", [_Tags objectAtIndex:arc4random()%4]]];
        }
    }
    return self;
}
-(NSString*) GetDNAItemAtIndex: (int) index {
    return [DNA objectAtIndex:index];
}
-(int) hammingDistance:(Cell*) a {
    int counter = 0;

    for (int i=0; i<100; i++) {
        NSString *a1 = [a GetDNAItemAtIndex:i];
        NSString *a2 = [self GetDNAItemAtIndex:i];
        if ([a1 isEqualToString:a2]) { } else counter++;
   }
    return counter;
}

-(void) print; {
   NSLog(@"%@", DNA);
}
@end
