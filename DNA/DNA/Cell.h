//
//  Cell.h
//  DNA
//
//  Created by Alex Makarov on 11/6/12.
//  Copyright (c) 2012 Alex Makarov. All rights reserved.
//

#import <Foundation/Foundation.h>

const int DNA_SIZE = 100;
const char N_BASES[4] = {'A', 'T', 'G', 'C'};

@interface Cell : NSObject
{
    NSMutableArray *_DNA;
}
- (id)init;
+ (NSString*)getRandNBase;
- (void)result;

@end
