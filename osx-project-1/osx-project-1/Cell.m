//
//  Cell.m
//  osx-project-1
//
//  Created by Admin on 11/17/12.
//  Copyright (c) 2012 antonv. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init{
    self = [super init];
    if (self){
        _DNA = [NSMutableArray arrayWithCapacity:100];
        for (int idx = 0; idx < 100; idx++) {
            uint rnum = arc4random() % 4;
            switch (rnum) {
                case 0:
                    [_DNA addObject:@"A"];
                    break;
                case 1:
                    [_DNA addObject:@"T"];
                    break;
                case 2:
                    [_DNA addObject:@"G"];
                    break;
                case 3:
                    [_DNA addObject:@"C"];
                    break;
                default:
                    break;
            }
        }        
    }
    return self;
}
-(int)hammingDistance:(Cell *)cell{
    int cnt_diff = 0;
    
    for(int idx = 0; idx < 100; idx++){
        if ([_DNA objectAtIndex:idx] != [[cell DNA] objectAtIndex:idx])
            cnt_diff++;
    }
    return cnt_diff;    
}

@end
