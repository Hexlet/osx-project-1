//
//  Cell.h
//  DNK
//
//  Created by p.naumov on 01.11.12.
//  Copyright (c) 2012 p.naumov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cell : NSObject

@property NSMutableArray *DNA;
+ (NSString*) randomElement;

- (int) hammingDistance: (Cell *)cell;

@end
