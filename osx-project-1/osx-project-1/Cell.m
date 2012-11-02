//
//  Cell.m
//  osx-project-1
//
//  Created by Mikhail on 02.11.12.
//  Copyright (c) 2012 Mikhail. All rights reserved.
//

#import "Cell.h"


@implementation Cell

@synthesize DNA;

+(int) getRandomNumberBetweenMin:(int)min andMax:(int)max
{
	return ( (arc4random() % (max-min+1)) + min );
}

-(id) init
{
    self = [super init];
    if (self) {
        DNA = [[NSMutableArray alloc] initWithCapacity: 100];
        for (int i = 0; i<100; ++i) {
            NSString * tmp;
            switch ([Cell getRandomNumberBetweenMin:0 andMax:3]) {
                case 0:
                    tmp = @"A";
                    break;
                case 1:
                    tmp = @"T";
                    break;
                case 2:
                    tmp = @"G";
                    break;
                case 3:
                    tmp = @"С";
                    break;
                }
            
            
//            NSNumber *tmp = [NSNumber numberWithInt:[Cell getRandomNumberBetweenMin:0 andMax:4]];
            [DNA addObject:tmp];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)cell
{
    int errorCount = 0;

    for (int i = 0; i < MIN([self.DNA count], [cell.DNA count]); i++) {
        NSString * this = [self.DNA objectAtIndex:i];
        NSString *that = [cell.DNA objectAtIndex:i];
        
        NSLog(@"%@  %@", this, that);
        
        if ([this compare:that] != NSOrderedSame) {
            errorCount ++;
        }
    }
    
    return errorCount;
}

@end
