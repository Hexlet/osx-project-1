//
//  Cell.h
//  osx-project-1
//
//  Created by Tkachenko Vitalii on 11/1/12.
//  Copyright (c) 2012 Sanitariumlab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

- (NSMutableArray *)dna;
- (void)print;
- (int)hammingDistance:(Cell *)cell;

@end

@interface Cell (Mutator)

- (void)mutator:(int)percent;

@end
