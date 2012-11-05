//
//  Cell.m
//  DNA
//
//  Created by Alexander on 11/3/12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import "Cell.h"

@interface Cell (mutator)

-(void)mutate:(int) percent;

@end

@implementation Cell (mutator)

-(void)mutate:(int) percent {
    int numberToMutate=percent*100/100;
    for (int i=0; i<numberToMutate; i++) {
        int arrpos=(arc4random() % 100) + 0;
        if ([[[self DNA] objectAtIndex:arrpos] length]>1) {
            i--;
        }
        else {
            bool fl=false;
            while (fl==false) {
                NSString *rLetter=[self fourRandomLetters];
                if (rLetter!=[[self DNA] objectAtIndex:arrpos]) {
                    [[self DNA] replaceObjectAtIndex:arrpos withObject:[[[self DNA] objectAtIndex:arrpos] stringByAppendingString:rLetter]];
                    fl=true;
                }
            }
        }
    }
    for (int i=0; i<100; i++) {
        if ([[[self DNA] objectAtIndex:i] length]>1) {
            [[self DNA] replaceObjectAtIndex:i withObject:[[[self DNA] objectAtIndex:i] substringFromIndex:1]];
        }
    }
}

@end

@implementation Cell

-(id) init {
    self=[super init];
    if (self) {
        _DNA=[NSMutableArray arrayWithCapacity:100];
        for (int i=0; i<100; i++) {
            [_DNA insertObject:[self fourRandomLetters] atIndex:i];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)another {
    int hd=0;
    for (int i=0; i<100; i++) {
        if ([_DNA objectAtIndex:i]!=[[another DNA] objectAtIndex:i]) {
            hd++;
        }
    }
    return hd;
}

-(NSString*)fourRandomLetters {
    NSString *oneLetterString;
    switch ((arc4random() % 4) + 0) {
        case 0:
            oneLetterString=@"A";
            break;
        case 1:
            oneLetterString=@"T";
            break;
        case 2:
            oneLetterString=@"G";
            break;
        case 3:
            oneLetterString=@"C";
            break;
            
        default:
            break;
    }
    return oneLetterString;
}
@end
