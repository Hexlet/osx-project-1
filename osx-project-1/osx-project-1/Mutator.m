//
//  Mutator.m
//  osx-project-1
//
//  Created by Sergey Kondratyev on 03.11.12.
//  Copyright (c) 2012 Sergey Kondratyev. All rights reserved.
//

#import "Mutator.h"

@implementation Cell (mutator)

- (void) mutate:(int)m {
    
    NSMutableArray *prc = [NSMutableArray arrayWithCapacity:m];
    NSNumber *num = NULL;
    //int count = 0;
    //int count2 = 0;
    //int count3 = 0;
    
    for (int i = 0;i<m; i++) {
      //  count2++;
        NSNumber *src = [NSNumber numberWithUnsignedInt: arc4random() % 100];
        NSNumber *dst = [NSNumber numberWithUnsignedInt: arc4random() % 100];
        
        if ([prc containsObject:dst]) {
            i--;
            //count++;
            continue;
        }
        //count3++;
        NSString *str = [DNA objectAtIndex:[src unsignedIntegerValue]];
        
        [DNA replaceObjectAtIndex:[dst unsignedIntegerValue] withObject:str];
        
        [prc addObject:dst];
        //NSLog(@"%u",[dst intValue]);
    }
    for (int i = 0 ; i<m; i++) {
        num = [prc objectAtIndex:i];
        //NSLog(@"%d",[num intValue]);
    }
    //NSLog(@"%d %d %d",count,count2,count3);
}
@end

