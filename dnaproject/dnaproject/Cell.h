//
//  Cell.h
//  dnaproject
//
//  Created by Andrey Zasorin on 10/31/12.
//  Copyright (c) 2012 Andrey Zasorin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    int counter;
}

@property NSMutableArray *dna;
@property NSString *dnastring;

-(int) getHummingDistance:(Cell *) anCell;

@end
