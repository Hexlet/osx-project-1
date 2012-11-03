//
//  Cell.m
//  KobaDNA
//
//  Created by koba on 03.11.12.
//  Copyright (c) 2012 koba. All rights reserved.
//

#import "Cell.h"

@implementation Cell
   

-(id) init{
    self = [super init];
    if (self) {
        self.DNA = [[NSMutableArray alloc] init];
        for (int i = 0; i < 100; i++){
            [self.DNA addObject:[Cell getMutation]];
        }
    }
    return self;
}

+(NSString*) getMutation{
    NSString *letter;
    switch (arc4random() % 4) {
        case 0:
            letter = @"A";
            break;
        case 1:
            letter = @"T";
            break;
        case 2:
            letter = @"G";
            break;
        case 3:
            letter = @"C";
            break;
    }
    return letter;
}

-(int) hammingDistance: (Cell*) cell {
    int distance = 0;
    for (int i = 0; i < [self.DNA count]; i++){
        if ([self.DNA objectAtIndex:i] == [cell.DNA objectAtIndex:i]){
            distance++;
        }
    }
    return distance;
}
@end
