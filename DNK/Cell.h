//
//  Cell.h
//  DNK
//
//  Created by Станислава Алиуллова on 06.11.12.
//  Copyright (c) 2012 self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

-(int)hammingDistance :(Cell *) cell;
-(void) print;
-(id) getDNA;
+(id) getRandomNucl;

@end
