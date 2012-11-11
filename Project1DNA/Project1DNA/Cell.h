//
//  Cell.h
//  Project1DNA
//
//  Created by Сергей Петрущенко on 11.11.12.
//  Copyright (c) 2012 NVision Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property NSArray *cellVariants;

- (NSString *)randomCell;

- (int)hammingDistance:(Cell *)cell;

- (void)print;
@end
