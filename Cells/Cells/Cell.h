//
//  Cell.h
//  Cells
//
//  Created by Vladimir Korshunov on 11/4/12.
//  Copyright (c) 2012 Vladimir Korshunov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
- (id) init;
- (id) initWithArray:(NSArray *)arrayDNA;
- (NSString *) genomeAtIndex:(int)index;
- (int) hammingDistance:(Cell *)another;

@end


@interface Cell ()
- (void) mutator:(int)persent;
@end
