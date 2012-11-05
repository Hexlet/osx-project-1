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
    
    NSMutableArray *arrayMutableMembersDna = [NSMutableArray arrayWithCapacity:percent];
    //NSNumber *num = NULL;
    //int count = 0;
    //int count2 = 0;
    //int count3 = 0;
    
    for (int i = 0;i<percent; i++) {
      //  count2++;
        NSNumber *choseRandomMemberDna = [NSNumber numberWithUnsignedInt: arc4random() % 100];
        NSNumber *mutateMemberDna = [NSNumber numberWithUnsignedInt: arc4random() % 100];
        
        if ([arrayMutableMembersDna containsObject:mutateMemberDna]) {
            i--;
            //count++;
            continue;
        }
        //count3++;
        NSString *memberDna = [DNA objectAtIndex:[choseRandomMemberDna unsignedIntegerValue]];
        
        [DNA replaceObjectAtIndex:[mutateMemberDna unsignedIntegerValue] withObject:memberDna];
        
        [arrayMutableMembersDna addObject:mutateMemberDna];
        //NSLog(@"%u",[dst intValue]);
    }
    /*for (int i = 0 ; i<m; i++) {
        num = [arrayMutableMembersDna objectAtIndex:i];
        //NSLog(@"%d",[num intValue]);
    }*/
    //NSLog(@"%d %d %d",count,count2,count3);
}
@end

