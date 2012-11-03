//
//  Cell.h
//  DNK
//
//  Created by sidney on 01.11.12.
//  Copyright (c) 2012 sidney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSArray *charSet;
}

@property NSMutableArray *DNA; // если сделать переменную (как в условиях задачи), а не property, то как тогда обратиться к DNA другого объекта в их сравнении?

-(id) init;
-(int) hammingDistance: (Cell *) f ;
-(NSString *) genCharSet;

@end
