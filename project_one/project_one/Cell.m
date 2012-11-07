//
//  Cell.m
//  project_one
//
//  Created by Roman Meshkevich on 02/11/2012.
//  Copyright (c) 2012 Roman Meshkevich. All rights reserved.
//

#import "Cell.h"


#define NUCLEO_COUNT 4
#define NUCLEO_COUNT_IN_CELL 100

@implementation Cell

+ (NSString*) generateNucleo{
    static NSString *arrayNucleo[NUCLEO_COUNT] = {@"A",@"T",@"G",@"C"};
    return arrayNucleo[arc4random()%4];
}

-(id) init {
    self = [super init];
    // what will we do if self is null
    if(self){
        _array = [NSMutableArray arrayWithCapacity:NUCLEO_COUNT_IN_CELL];
        for(int i =0;i<NUCLEO_COUNT_IN_CELL;i++){
            [_array addObject:[Cell generateNucleo]];
        }
    }
    return self;
}
- (int) hammingDistance:(Cell*) cell{
    int distance = 0;
    for(int i=0;i<NUCLEO_COUNT_IN_CELL;i++){
        if ([[_array objectAtIndex:i] isNotEqualTo:[[cell array] objectAtIndex:i]])
            distance++;
    }
    return distance;
}
-(NSString *)description 
{
    return [_array componentsJoinedByString:@""];
}

@end
