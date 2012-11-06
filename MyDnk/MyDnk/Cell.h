//
//  Cell.h
//  MyDnk
//
//  Created by Михаил Субботин on 03.11.12.
//  Copyright (c) 2012 Михаил Субботин. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(int) hammingDistance: (Cell*) cell;
-(NSString*) generateElement;

@end
