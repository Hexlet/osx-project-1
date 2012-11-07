//
//  Mutator.m
//  osx-project-1
//
//  Created by Sergey Kondratyev on 03.11.12.
//  Copyright (c) 2012 Sergey Kondratyev. All rights reserved.
//

#import "Mutator.h"

@implementation Cell (mutator)

- (void) mutate:(int)percent {
    
    if ((0 < percent) && ( 100 >= percent )) {
    
        NSMutableArray *arrayMutableMembersDna = [NSMutableArray arrayWithCapacity:percent];
        //NSNumber *num = NULL;
        /*int count = 0;
        int count2 = 0;
        int count3 = 0;
        int count4 = 0;*/
        
        for (int i = 0;i<percent; i++) {
            //count2++;
            NSNumber *choseRandomMemberDna = [NSNumber numberWithUnsignedInt: arc4random() % 100];
            NSNumber *mutateMemberDna = [NSNumber numberWithUnsignedInt: arc4random() % 100];
            
            if ([arrayMutableMembersDna containsObject:mutateMemberDna]) {
                i--;
            //    count++;
                continue;
            }
            
            NSString *memberDna = [DNA objectAtIndex:[choseRandomMemberDna unsignedIntegerValue]];
            NSString *givenMemberDna = [DNA objectAtIndex:[mutateMemberDna unsignedIntegerValue]];
            
            if (memberDna == givenMemberDna) {
                i--;
            //    count4++;
                continue;
            }
            //count3++;
            [DNA replaceObjectAtIndex:[mutateMemberDna unsignedIntegerValue] withObject:memberDna];
            
            [arrayMutableMembersDna addObject:mutateMemberDna];
            //NSLog(@"%u",[dst intValue]);
        }
    } else {
        NSLog(@"Value percent define over 100");
    }
    /*for (int i = 0 ; i<m; i++) {
        num = [arrayMutableMembersDna objectAtIndex:i];
        //NSLog(@"%d",[num intValue]);
    }*/
   //r NSLog(@"%d %d %d %d",count,count2,count3,count4);
}
@end

