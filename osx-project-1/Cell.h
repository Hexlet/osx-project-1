//
//  Cell.h
//  osx-project-1
//
//  Created by Alexandr on 11/4/12.
//  Copyright (c) 2012 Alexandr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property (readonly) NSArray *dnaVariants;
@property (readonly) int dnaSize;

- (int)hammingDistance:(Cell *)compare;
- (NSMutableArray *)generateIndexes;
- (void)fillRandomAtPositions:(NSMutableArray *)indexes;

@end
