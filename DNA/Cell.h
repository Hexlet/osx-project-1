//
//  Cell.h
//  DNA
//
//  Created by Rustem Sayargaliev on 10/30/12.
//  Copyright (c) 2012 sensation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(id) init;
-(int) hammingDistance:(Cell *) c;
-(void) print;

@end
