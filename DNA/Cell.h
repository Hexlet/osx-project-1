//
//  Cell.h
//  DNA
//
//  Created by Evgeniy Kozachenko on 04.11.12.
//  Copyright (c) 2012 Evgeniy Kozachenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSMutableArray *DNA;
}
-(id) init;
-(int) hammingDistance: (Cell*) d;
@end
