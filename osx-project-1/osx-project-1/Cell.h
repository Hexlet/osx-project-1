//
//  Cell.h
//  osx-project-1
//
//  Created by HexletStudent13 on 10/31/12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DNALENGTH 100

@interface Cell : NSObject

@property (readonly) NSArray *dnaAlphabet;
@property (readonly) NSMutableArray *DNA;

- (int) hammingDistance: (Cell*) cell;
- (NSString*) randomDnaChar;

@end
