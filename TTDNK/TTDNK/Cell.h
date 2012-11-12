//
//  Cell.h
//  TTDNK
//
//  Created by timur tarasenko on 04.11.12.
//  Copyright (c) 2012 timur tarasenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;  //Массив оснований

@property NSArray *DNArray;  

- (int) hammingDistance: (Cell *) myCell;

@end
