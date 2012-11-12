//
//  Cell.h
//  prj1-DNA
//
//  Created by void on 12.11.12.
//  Copyright (c) 2012 void. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property (readonly) NSArray *Gen;

- (int)hammingDistance:(Cell *)comp;
- (NSMutableArray *)crInd;
- (void)filling:(NSMutableArray *)ind;
- (NSString*) getIntRand;
-(void) print;
//-(void) printInt;

@end
