//
//  Cell.h
//  DNAProject
//
//  Created by Alex Nureev on 11/8/12.
//  Copyright (c) 2012 Alex Nureev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArrayRandom.h"

@interface Cell : NSObject {
}
@property NSMutableArray* DNA;

-(int) hummingDistance:(Cell*)c;

@end
