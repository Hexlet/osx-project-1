//
//  Cell.h
//  osx-project-1
//
//  Created by wtf on 11/11/12.
//  Copyright (c) 2012 on. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property (readonly) NSArray *NB;

-(int) hammingDistance:(Cell *)c;
-(void) print;

@end
