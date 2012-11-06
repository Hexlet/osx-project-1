//
//  Cell.h
//  project 1
//
//  Created by Dmitriy Zhukov on 11/6/12.
//  Copyright (c) 2012 Dmitriy Zhukov. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Cell : NSObject
{
    NSMutableArray *DNA;
}

+ (NSString *)randomGene;

- (int)hammingDistance:(Cell *)anotherCell;

@end
