//
//  Cell.m
//  Project1-DNA
//
//  Created by ic-it on 11/14/12.
//  Copyright (c) 2012 ic-it. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init{
    self = [super init];
    if (self){
        DNA = [[NSMutableArray alloc] initWithCapacity:100];
        NSArray *chrome = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C",nil];
        srandom((unsigned)(mach_absolute_time()&0xFFFFFFFF));
        for (int i=0;i<100;i++)
           [DNA insertObject:[chrome  objectAtIndex:random()%4] atIndex:i ];
        NSLog(@"%@",DNA);
    }
    return self;
}

- (int) hammingDistance:(Cell*) nbr{
    int hdCounter=0;
    for (int i=0;i<100;i++){
        if ([self getElement:i]!=[nbr getElement:i])
            hdCounter++;
    }
    return hdCounter;
    
}

- (id) getElement: (int) i{
    return [DNA objectAtIndex:i];
}
@end

