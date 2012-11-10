//
//  Cell.h
//  DNK
//
//  Created by Artem Osipov on 11/10/12.
//  Copyright (c) 2012 Artem Osipov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property NSArray *arrayChars;

-(id)init;
-(int) hammingDistance: (Cell *) DNA2;
@end
