//
//  Cell.h
//  DNAProject
//
//  Created by cso on 03.11.2012.
//
//

#import <Foundation/Foundation.h>
@interface Cell : NSObject
{
	NSMutableArray* DNA;
	
	NSArray* cellCodes;
}

- (id) initWithDefaultCodes;

- (int) hammingDistance: (Cell*) cell;
- (NSString*) getRandomCellCode;

- (NSMutableArray*) getDNA;
- (void) print;


@end
