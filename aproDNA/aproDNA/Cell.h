//
//  Cell.h
//  aproDNA
//
//  Created by apro on 07.01.13.
//  Copyright (c) 2013 apro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
    NSArray *letter;
    int i;
    int randomNumber;
    int hD;
}

-(id) init;
-(void) print;
-(int) hammingDistance: (Cell *) DNA2;
-(NSMutableArray *) getDNA;

@end
