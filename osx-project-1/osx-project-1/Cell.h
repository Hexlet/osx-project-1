//
//  Cell.h
//  osx-project-1
//
//  Created by Роман Евсеев on 05.11.12.
//  Copyright (c) 2012 Роман Евсеев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray * DNA;

- (int) hammingDistance: (Cell *) cell;
+ (NSString *) randomElement;
@end
