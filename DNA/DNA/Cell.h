//
//  Cell.h
//  DNA
//
//  Created by sx on 11.11.12.
//  Copyright (c) 2012 sx. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int DNA_SIZE = 100;

static const char DNA_CHARS[] = {'A', 'T', 'G', 'C'};

static const int CHARS_SIZE = 4;

@interface Cell : NSObject{

    NSMutableArray *DNA;
}

- (NSMutableArray *)DNA;

-(NSString*) getRandomChar;

-(int)getRandomNumber:(int)from to:(int)to;

-(int) hammingDistance: (Cell*) target;

@end
