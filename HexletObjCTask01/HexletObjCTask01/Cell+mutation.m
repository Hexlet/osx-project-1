//
//  Cell+mutation.m
//  HexletObjCTask01
//
//  Created by Mykola Makhin on 11/8/12.
//  Copyright (c) 2012 Mykola Makhin. All rights reserved.
//

#import "Cell.h"
#import "Cell+mutation.h"

@implementation Cell (mutation)
-(void)mutate:(int)percent {
    @autoreleasepool {
        if(percent<1) return;
        percent = percent%100;
        if(percent==0) percent = 100;
        // Yeah, I assume 100 length for DNA 'cause I'm too lazy to handle other cases
        int* indexes = malloc(sizeof(int)*percent);
        indexes[0] = rand()%100;
        int length = 1;
        while(length<percent) {
            unsigned int nextIdx = arc4random()%100;
            bool present = false;
            for(int f=0; f<length; f++) {
                if(indexes[f]==nextIdx) {
                    present = true;
                    break;
                }
            }
            if(!present) {
                indexes[length]=nextIdx;
                length++;
            }
        }
        //printf("Mutating at %d indexes\n", length);
        for(int f=0; f<length; f++) {
            //printf(" - index: %d\n", indexes[f]);
            [self changeCell:self toRandomAt:indexes[f]];
        }
    }
}


-(void)changeCell:(Cell*)cell toRandomAt:(int)index {
    char* DNA_CHAR_SET = "ATCG";
    unsigned int random = arc4random();
    //    [DNA replaceObjectAtIndex:index withObject:[NSString stringWithFormat:@"%c" , ' ']];
    const char currentVal = [Cell getAsCharFromDna:[cell getDna] atIndex:index];
    while( DNA_CHAR_SET[random%4]== currentVal) {
        random = arc4random();
    }
    [[cell getDna] replaceObjectAtIndex:index withObject:[NSString stringWithFormat:@"%c" , DNA_CHAR_SET[random%4]]];
}

@end
