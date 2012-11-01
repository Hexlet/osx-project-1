//
//  Cell.m
//  osx-project-1
//
//  Created by Alexander Kazanskiy on 30.10.12.
//  Copyright (c) 2012 haxlet. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init{
    self = [super init];
    if(self) {
        
        capacity = 100;

        DNA = [[NSMutableArray alloc] initWithCapacity:capacity];
        for (int i = 0; i<capacity; ++i) {
            [DNA insertObject:[Cell getRandGen] atIndex:i ];
        }
    }
    
    return self;
}

-(int)hummingDistance:(Cell *)c {
    int counter = 0;
    for (int i = 0; i<capacity; ++i) {
        NSString * myGen = [self->DNA objectAtIndex:i];
        if(![myGen isEqualToString: [c->DNA objectAtIndex: i]]){
            counter++;
        }
    }
    return counter;
}

+(id) getRandGen {
    
    NSArray *arr = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C",nil];
    u_int8_t r = arc4random() % [arr count];
    return [arr objectAtIndex:r];

}

@end
