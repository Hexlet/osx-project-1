//
//  Cell.h
//  DNA
//
//  Created by Mac on 11/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSMutableArray *DNA;
}
@property (nonatomic) NSMutableArray *DNA;

- (id)init;
- (int)hammingDistanceWithCell:(Cell *)cellToCompareWith;

@end
