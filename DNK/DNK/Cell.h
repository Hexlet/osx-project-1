//
//  Cell.h
//  DNK
//
//  Created by Алексей Виноградов on 06.11.12.
//  Copyright (c) 2012 Алексей Виноградов. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *dnaarr;



- (id)init;

- (int)hammingDistance:(Cell *)a;

@end
