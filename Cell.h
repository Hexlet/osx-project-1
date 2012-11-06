//
//  Cell.h
//  DNKProject
//
//  Created by IT-Dimension on 11/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject 

@property (nonatomic,strong) NSMutableArray *DNA; 
@property int countDNA;

-(int)hammingDistance:(Cell*)cell1;
-(NSString*)generateSymbol;

@end
