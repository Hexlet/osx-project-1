//
//  Cell.h
//  DNA
//
//  Created by Alex Makarov on 11/6/12.
//  Copyright (c) 2012 Alex Makarov. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_SIZE 100

@interface Cell : NSObject
{
//    NSMutableArray *_DNA;
}

@property (nonatomic, strong) NSMutableArray *DNA;

+ (NSString*)getRandNBase;
- (int)hammingDistance:(Cell *)aCell;
- (void)result;

@end
