//
//  Cell.h
//  DNAMutation
//
//  Created by Gosha Arinich on 10/30/12.
//  Copyright (c) 2012 Gosha Arinich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

+ (NSString *)generateRandomElement;
- (void)generateDNA;
- (int)hammingDistance:(Cell *)otherCell;

@end
