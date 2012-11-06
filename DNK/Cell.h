//
//  Cell.h
//  DNK
//
//  Created by admin on 06.11.12.
//
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property     NSMutableArray *DNA;


-(id) init;
-(void) print;
-(int) hammingDistance:(Cell *) cell;

@end
