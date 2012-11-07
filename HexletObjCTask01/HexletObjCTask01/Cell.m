//
//  Cell.m
//  HexletObjCTask01
//
//  Created by Mykola Makhin on 11/7/12.
//  Copyright (c) 2012 Mykola Makhin. All rights reserved.
//

#import "time.h"
#import "Cell.h"

@implementation Cell {
    NSMutableArray *DNA;
    const char *DNA_CHAR_SET;
}

-(Cell*)init {
    self = [super init];
    DNA_CHAR_SET = "ATCG";
    //DNA = [[NSMutableArray alloc] init];
    DNA = [[NSMutableArray alloc] initWithCapacity:100];
    for(int i=0; i<100; i++) {
        unsigned int random = arc4random();
        [DNA insertObject:[NSString stringWithFormat:@"%c" , DNA_CHAR_SET[random%4]] atIndex:0];
        //[self setRandomAt:i];
    }
    return self;
}

+(char)getAsCharFromDna:(NSMutableArray*)theDna atIndex:(int)index {
    return [[theDna objectAtIndex:index] UTF8String][0];
}

-(void)changeToRandomAt:(int)index {
    DNA_CHAR_SET = "ATCG";
    unsigned int random = arc4random();
//    [DNA replaceObjectAtIndex:index withObject:[NSString stringWithFormat:@"%c" , ' ']];
    const char currentVal = [Cell getAsCharFromDna:DNA atIndex:index];
    while( DNA_CHAR_SET[random%4]== currentVal) {
        random = arc4random();
    }
    [DNA replaceObjectAtIndex:index withObject:[NSString stringWithFormat:@"%c" , DNA_CHAR_SET[random%4]]];
}

-(NSMutableArray*)getDna {
    return self->DNA;
}

-(void)mutate:(int)percent {
    if(percent==0) return;
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
        [self changeToRandomAt:indexes[f]];
    }
}

-(int)hammingDistance:(Cell*)otherCell {
    unsigned long result = 0;
    unsigned long minLength = [self->DNA count];
    unsigned long lengthDiff = 0; // Yeah, just in case
    
    NSMutableArray* otherDna = otherCell->DNA;
    unsigned long otherDnaLength = [otherDna count];
    lengthDiff = otherDnaLength-minLength;
    if(minLength>otherDnaLength) {
        minLength = otherDnaLength;
        lengthDiff = -lengthDiff;
    }
    for(int i=0;i<minLength; i++) {
//        const char* oneStrChars = [[self->DNA objectAtIndex:i] UTF8String];
//        const char one = oneStrChars[0]; // Yeah, if you've got empty string there somehow - your fault (-;
//        const char* otherStrChars = [[otherDna objectAtIndex:i] UTF8String];
//        const char two = otherStrChars[0]; // Same as above d-:
        const char one = [Cell getAsCharFromDna:self->DNA atIndex:i];
        const char two = [Cell getAsCharFromDna:otherDna atIndex:i];
        if(one!=two) {
            result++;
        }
    }
    result+=lengthDiff;
    
    return (int)result;
}

-(Cell*)clone {
    Cell* newCell = [[Cell alloc] init];
    // Again, I assume 100 length for DNA 'cause I'm too lazy to handle other cases
    [[newCell getDna] setArray:[self getDna]];
    //for(int f=0; f<100; f++) {
    //    [[newCell getDna] replaceObjectAtIndex:f withObject:[[self getDna] objectAtIndex:f]];
    //}
    return newCell;
}

@end
