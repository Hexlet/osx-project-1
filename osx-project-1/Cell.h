//
//  Cell.h
//  osx-project-1
//
//  Created by admin on 03.11.12.
//  Copyright (c) 2012 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray* DNA;

- (int)hammingDistance:(Cell*)anotherCell;
- (void)regenerateDna;
- (NSString*)getRandomNucleoBase;

@end
