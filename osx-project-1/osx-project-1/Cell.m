//
//  Cell.m
//  osx-project-1
//
//  Created by Sergey Kondratyev on 01.11.12.
//  Copyright (c) 2012 Sergey Kondratyev. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize DNA;

- (id) init {
    self = [super init];
    
    if (self) {
        
        DNA = [NSMutableArray arrayWithCapacity:100];
        
        for (int i=0; i<100; i++) {
            
            int randomNumber = (int)(arc4random() % 4);
            
            NSString *memberDnaArray = NULL;
            if (randomNumber == 0) {
                memberDnaArray = @"A";
            }else if (randomNumber == 1) {
                memberDnaArray = @"T";
            }else if (randomNumber == 2) {
                memberDnaArray = @"G";
            }else if (randomNumber == 3) {
                memberDnaArray = @"C";
            }
            
            [DNA addObject:memberDnaArray];
            //NSLog(@"Addition NSSring object str: %@",str);
        }
    }
    return self;
}

- (int) hammingDistance:(Cell *)insertCell {
    
    NSMutableArray *selfArrayDna = [self DNA];
    NSMutableArray *givenArrayDna = [insertCell DNA];
    int countMatchMembers = 0;
    
    for (int i=0; i<100; i++) {
        
        NSString *memberSelfArray = [selfArrayDna objectAtIndex:i];
        NSString *memberGivenArray = [givenArrayDna objectAtIndex:i];
        
        if (memberSelfArray != memberGivenArray) {
            //NSLog(@"str1 %@ str2 %@",str1, str2);
            countMatchMembers++;
        }
    }
    return countMatchMembers;
}
@end
