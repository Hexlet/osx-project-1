//
//  Cell.h
//  osx-project-1
//
//  Created by Роман Евсеев on 05.11.12.
//  Copyright (c) 2012 Роман Евсеев. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_SIZE 100

@interface Cell : NSObject {
    NSMutableArray * DNA;
}

@property (nonatomic, readonly) NSMutableArray * DNA;

- (int) hammingDistance: (Cell *) cell;
+ (NSArray *) getElements;
+ (NSString *) randomElementWithout: (NSString *) element;

@end
